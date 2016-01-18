defmodule Marked.Block do

  def parse(lines = [%{type: :thematic_break, content: content} | rest]) do
    Marked.Html.hr(content) <> parse(rest)
  end

  def parse(lines = [%{type: :simple, content: content} | rest]) do
    paragraph = lines
                |> Enum.take_while(fn(token) -> token.type == :simple end)
                |> Enum.map(fn(token) -> token.content end)
                |> Enum.join("\n")
                |> Marked.Html.paragraph

    new_rest = lines
               |> Enum.drop_while(fn(token) -> token.type == :simple end)

    paragraph <> parse(new_rest)
  end

  def parse(lines = [%{type: :list_item, content: content} | rest]) do
    list_items = lines
                  |> Enum.take_while(fn(token) -> token.type == :list_item end)
                  |> Enum.map(fn(token) -> String.replace(token.content, "- ", "") end)

    new_rest = lines |> Enum.drop_while(fn(token) -> token.type == :list_item end)

    Marked.Html.ul(list_items) <> parse(new_rest)
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

end
