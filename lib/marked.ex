defmodule Marked do
  def to_html(markdown) do
    markdown |> blocks |> Enum.map(&paragraph(&1)) |> Enum.join
  end

  defp blocks(markdown) do
    String.split(markdown, "\n\n", trim: true)
  end

  defp paragraph(content) do
    "<p>#{strip_lines(content)}</p>\n"
  end

  defp strip_lines(content) do
    content
    |> String.split("\n", trim: true)
    |> Enum.map(&String.strip(&1))
    |> Enum.join("\n")
  end

end
