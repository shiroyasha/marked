defmodule Marked do

  def to_html(markdown) do
    markdown
    |> String.split("\n")
    |> Enum.map(&Marked.Line.parse(&1))
    |> Marked.Block.parse
  end

end
