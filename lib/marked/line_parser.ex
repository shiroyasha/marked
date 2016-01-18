defmodule Marked.LineParser do

  def parse(:thematic_break, line) do
    %{type: :thematic_break, content: ""}
  end

  def parse(:atx_heading, line) do
    level = Regex.scan(~r/^(\#*)/, String.strip(line), capture: :first)
            |> List.first
            |> List.first
            |> String.length

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
    fence = Regex.scan(~r/^\s*(`*|~*)/, line, capture: :first)
            |> List.first
            |> List.first

    fence_type = String.at(fence, 0)

    stregth = fence |> String.length

    %{type: :code_guard, stregth: stregth, fence_type: fence_type, content: ""}
  end

end
