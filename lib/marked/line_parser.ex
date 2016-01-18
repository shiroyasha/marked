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
    %{type: :list_item, content: line}
  end

  def parse(:empty, _) do
    %{type: :empty}
  end

  def parse(:simple, line) do
    %{type: :simple, content: line}
  end

  def parse(:code_guard, _) do
    %{type: :code_guard, content: ""}
  end

end
