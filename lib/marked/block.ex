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

  def parse(lines = [%{type: :empty} | rest]) do
    parse(rest)
  end

  def parse([%{type: :atx_heading, level: level, content: content} | rest]) do
    Marked.Html.header(content, level) <> parse(rest)
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

  def take_all(lines, line_type) do
    lines |> Enum.split_while(&Marked.Line.type?(&1, line_type))
  end

end
