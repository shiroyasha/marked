defmodule Marked.Html do

  def header(content, level) do
    "<h#{level}>#{String.strip(content)}</h#{level}>\n"
  end

  def ul(list_items) do
    rendered_list_items = Enum.map(list_items, &li(&1))

    "<ul>\n#{rendered_list_items}</ul>\n"
  end

  def li(content) do
    "<li>#{content}</li>\n"
  end

  def paragraph(content) do
    "<p>#{strip_lines(content)}</p>\n"
  end

  def hr(content) do
    "<hr />\n"
  end

  defp strip_lines(content) do
    content
    |> String.split("\n", trim: true)
    |> Enum.map(&String.strip(&1))
    |> Enum.join("\n")
  end

end
