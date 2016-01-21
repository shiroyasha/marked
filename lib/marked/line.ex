defmodule Marked.Line do

  def parse(line) do
    Marked.LineParser.parse(type(line), line)
  end

  def type?(line, line_type) do
    line.type == line_type
  end

  def type(line) do
    cond do
      thematic_break?(line) ->
        :thematic_break
      atx_heading?(line) ->
        :atx_heading
      list_item?(line) ->
        :list_item
      blank?(line) ->
        :blank
      code_guard?(line) ->
        :code_guard
      true ->
        :simple
    end
  end

  def thematic_break?(line) do
    Regex.match?(~r/^(\s*-){3,}$/, line) ||
    Regex.match?(~r/^(\s*_){3,}$/, line) ||
    Regex.match?(~r/^(\s*\*){3,}$/, line)
  end

  def blank?(line) do
    Regex.match?(~r/^\s*$/, line)
  end

  def list_item?(line) do
    Regex.match?(~r/^- .*$/, line)
  end

  def atx_heading?(line) do
    Regex.match?(~r/^\s{0,3}\#{1,6}(\s+.*)?(\#*)$/, line)
  end

  def code_guard?(line) do
    Regex.match?(~r/^\s*`{3,}/, line) ||
    Regex.match?(~r/^\s*~{3,}/, line)
  end

end
