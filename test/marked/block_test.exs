defmodule BlockTest do
  use ExSpec
  doctest Marked

  describe "paragraphs" do

    it "collects all :simple lines" do
      lines = [
        %{type: :simple, content: "a"},
        %{type: :simple, content: "b"},
        %{type: :simple, content: "c"}
      ]

      assert Marked.Block.parse(lines) == "<p>a\nb\nc</p>\n"
    end

    it "breaks paragraphs on :empty lines" do
      lines = [
        %{type: :simple, content: "a"},
        %{type: :simple, content: "b"},
        %{type: :empty},
        %{type: :simple, content: "c"}
      ]

      assert Marked.Block.parse(lines) == "<p>a\nb</p>\n<p>c</p>\n"
    end

  end

end
