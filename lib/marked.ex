defmodule Marked do

  def to_html(markdown) do
    markdown |> lines |> Marked.Block.parse
  end

  def lines(markdown) do
    markdown |> String.split("\n") |> Enum.map(&Marked.Line.parse(&1))
  end

end
