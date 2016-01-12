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
    render_thematic_break(content) <> parse(rest)
  end

  defp parse(tokens = [%{type: :simple, content: content} | rest]) do
    paragraph = tokens
                |> Enum.take_while(fn(token) -> token.type == :simple end)
                |> Enum.map(fn(token) -> token.content end)
                |> Enum.join("\n")
                |> render_paragraph

    new_rest = tokens
               |> Enum.drop_while(fn(token) -> token.type == :simple end)

    paragraph <> parse(new_rest)
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
    tokenize(rest, result ++ [%{type: line_type(line), content: line}])
  end

  defp line_type(line) do
    cond do
      thematic_break?(line) ->
        :thematic_break
      empty?(line) ->
        :empty
      true ->
        :simple
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

  # rendering

  defp render_paragraph(content) do
    "<p>#{strip_lines(content)}</p>\n"
  end

  defp render_thematic_break(content) do
    "<hr />\n"
  end

  # helpers

  defp strip_lines(content) do
    content
    |> String.split("\n", trim: true)
    |> Enum.map(&String.strip(&1))
    |> Enum.join("\n")
  end

end
