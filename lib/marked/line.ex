defmodule Marked.Line do

  def type(line) do
    cond do
      thematic_break?(line) ->
        %{type: :thematic_break, content: ""}

      atx_heading?(line) ->
        level = Regex.scan(~r/^(\#*)/, String.strip(line), capture: :first)
                |> List.first
                |> List.first
                |> String.length

        content = line
                  |> String.replace(~r/^\s*\#*/, "")
                  |> String.replace(~r/\s+\#*\s*$/, "")

        %{type: :atx_heading, level: level, content: content}

      list_item?(line) ->
        %{type: :list_item, content: line}

      empty?(line) ->
        %{type: :empty, content: ""}

      true ->
        %{type: :simple, content: line}
    end
  end

  def thematic_break?(line) do
    Regex.match?(~r/^(\s*-){3,}$/, line) ||
    Regex.match?(~r/^(\s*_){3,}$/, line) ||
    Regex.match?(~r/^(\s*\*){3,}$/, line)
  end

  def empty?(line) do
    Regex.match?(~r/^$/, line)
  end

  def list_item?(line) do
    Regex.match?(~r/^- .*$/, line)
  end

  def atx_heading?(line) do
    Regex.match?(~r/^\s{0,3}\#{1,6}(\s+.*)?(\#*)$/, line)
  end

end
