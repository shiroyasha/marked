defmodule Marked do
  def to_html(markdown) do
    markdown |> lines |> tokenize([]) |> parse
  end

  defp lines(string) do
    String.split(string, "\n")
  end

  defp parse([]) do
    ""
  end

  defp parse(tokens = [%{type: :thematic_break, content: content} | rest]) do
    Marked.Html.hr(content) <> parse(rest)
  end

  defp parse(tokens = [%{type: :simple, content: content} | rest]) do
    paragraph = tokens
                |> Enum.take_while(fn(token) -> token.type == :simple end)
                |> Enum.map(fn(token) -> token.content end)
                |> Enum.join("\n")
                |> Marked.Html.paragraph

    new_rest = tokens
               |> Enum.drop_while(fn(token) -> token.type == :simple end)

    paragraph <> parse(new_rest)
  end

  defp parse(tokens = [%{type: :list_item, content: content} | rest]) do
    list_items = tokens
                  |> Enum.take_while(fn(token) -> token.type == :list_item end)
                  |> Enum.map(fn(token) -> String.replace(token.content, "- ", "") end)

    new_rest = tokens |> Enum.drop_while(fn(token) -> token.type == :list_item end)

    Marked.Html.ul(list_items) <> parse(new_rest)
  end

  defp parse(tokens = [%{type: :empty, content: content} | rest]) do
    parse(rest)
  end

  defp parse([%{type: :atx_heading, level: level, content: content} | rest]) do
    Marked.Html.header(content, level) <> parse(rest)
  end

  defp parse(_) do
    ""
  end

  # tokens

  defp tokenize([], result) do
    result
  end

  defp tokenize([line | rest], result) do
    tokenize(rest, result ++ [Marked.Line.parse(line)])
  end

end
