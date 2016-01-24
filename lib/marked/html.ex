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

  def hr(content), do: "<hr />\n"

  def code(""),           do: code("", nil)
  def code(content),      do: code(content, nil)
  def code("", nil),      do: "<pre><code></code></pre>\n"
  def code(content, nil), do: "<pre><code>#{html_escape(content)}\n</code></pre>\n"

  def code(content, language) do
    "<pre><code class=\"language-#{language}\">#{html_escape(content)}\n</code></pre>\n"
  end

  defp strip_lines(content) do
    content
    |> String.split("\n", trim: true)
    |> Enum.map(&String.strip(&1))
    |> Enum.join("\n")
  end

  defp html_escape(content) do
    content
    |> String.replace("<", "&lt;")
    |> String.replace(">", "&gt;")
  end

end
