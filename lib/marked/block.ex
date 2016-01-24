defmodule Marked.Block do

  def parse(lines = [%{type: :thematic_break, content: content} | rest]) do
    Marked.Html.hr(content) <> parse(rest)
  end

  def parse(lines = [%{type: :simple, content: _} | _]) do
    {simple_lines, rest} = lines |> take_all(:simple)

    (simple_lines |> join_content |> Marked.Html.paragraph) <> parse(rest)
  end

  def parse(lines = [%{type: :list_item, content: content} | rest]) do
    {list_items, rest} = lines |> take_all(:list_item)

    (list_items |> content |> Marked.Html.ul) <> parse(rest)
  end

  def parse(lines = [%{type: :blank, content: ""} | rest]) do
    parse(rest)
  end

  def parse([%{type: :atx_heading, level: level, content: content} | rest]) do
    Marked.Html.header(content, level) <> parse(rest)
  end

  def parse(lines = [%{type: :code, content: _} | _]) do
    {code_lines, rest} = lines |> take_all([:code, :blank])

    code_block = code_lines |> join_content |> String.strip(?\n)

    (code_block |> Marked.Html.code) <> parse(rest)
  end

  def parse(lines = [%{type: :code_guard} | rest]) do
    fence_type = hd(lines).fence_type
    strength = hd(lines).strength
    language = hd(lines).language

    {code, non_code} = rest |> Enum.split_while fn(line) ->
      result = line.type == :code_guard &&
               line.strength >= strength &&
               line.fence_type == fence_type

      !result
    end

    code_segment = code |> join_content |> Marked.Html.code(language)

    code_segment <> parse(length(non_code) > 0 && tl(non_code) || "")
  end

  def parse(_) do
    ""
  end

  def join_content(lines) do
    lines |> content |> Enum.join("\n")
  end

  def content(lines) do
    lines |> Enum.map(fn(line) -> line.content end)
  end

  def take_all(lines, line_type) when is_atom(line_type) do
    lines |> Enum.split_while(&Marked.Line.type?(&1, line_type))
  end

  def take_all(lines, line_types) when is_list(line_types) do
    lines |> Enum.split_while fn(line) ->
      line_types |> Enum.any?(&Marked.Line.type?(line, &1))
    end
  end

end
