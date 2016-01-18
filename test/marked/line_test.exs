defmodule LineTest do
  use ExSpec
  doctest Marked

  describe ".parse" do
    it "parses code guards" do
      assert Marked.Line.parse("```") == %{type: :code_guard, content: ""}
    end
  end

  describe ".code_guard?" do
    it "mathes simple code guards" do
      assert Marked.Line.code_guard?("```")
    end
  end

end
