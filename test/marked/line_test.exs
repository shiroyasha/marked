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

  describe ".type?" do
    context "when line has the passed type" do
      it "returns true" do
        assert Marked.Line.type?(%{type: :simple}, :simple)
      end
    end

    context "when line has the passed type" do
      it "returns true" do
        refute Marked.Line.type?(%{type: :simple}, :empty)
      end
    end
  end

end
