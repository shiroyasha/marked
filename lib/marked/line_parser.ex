defmodule Marked.LineParser do

  def parse(:thematic_break, line) do
    %{type: :thematic_break, content: ""}
  end

  def parse(:atx_heading, line) do
    level = line |> first_match(~r/^(\#*)/) |> String.length

    content = line
              |> String.replace(~r/^\s*\#*/, "")
              |> String.replace(~r/\s+\#*\s*$/, "")

    %{type: :atx_heading, level: level, content: content}
  end

  def parse(:list_item, line) do
    content = String.replace(line, "- ", "")

    %{type: :list_item, content: content}
  end

  def parse(:empty, _) do
    %{type: :empty, content: ""}
  end

  def parse(:simple, line) do
    %{type: :simple, content: line}
  end

  def parse(:code_guard, line) do
    fence = line |> first_match(~r/^\s*(`+|~+)/)
    language = line |> String.replace(~r/(`|~)/, "") |> String.split |> List.first

    %{type: :code_guard,
      strength: fence |> String.length,
      fence_type: String.at(fence, 0),
      language: language,
      content: line}
  end

  defp first_match(line, regex) do
    Regex.scan(regex, line, capture: :first) |> List.first |> List.first
  end

end
