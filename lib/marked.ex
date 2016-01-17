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

  defp parse(_) do
    ""
  end

  # tokens

  defp tokenize([], result) do
    result
  end

  defp tokenize([line | rest], result) do
    tokenize(rest, result ++ [line_type(line)])
  end

  defp line_type(line) do
    cond do
      thematic_break?(line) ->
        %{type: :thematic_break, content: ""}

      list_item?(line) ->
        %{type: :list_item, content: line}

      empty?(line) ->
        %{type: :empty, content: ""}

      true ->
        %{type: :simple, content: line}
    end
  end

  defp thematic_break?(line) do
    Regex.match?(~r/^(\s*-){3,}$/, line) ||
    Regex.match?(~r/^(\s*_){3,}$/, line) ||
    Regex.match?(~r/^(\s*\*){3,}$/, line)
  end

  defp empty?(line) do
    Regex.match?(~r/^$/, line)
  end

  defp list_item?(line) do
    Regex.match?(~r/^- .*$/, line)
  end

end
