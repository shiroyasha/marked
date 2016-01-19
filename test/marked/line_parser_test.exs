defmodule LineParserTest do
  use ExSpec
  doctest Marked

  describe ":code_guard" do
    it "calculates the correct guard strength" do
      line = "`````"

      assert Marked.LineParser.parse(:code_guard, line).strength == 5
    end

    context "when code fence is made of backticks" do
      it "sets the fence_type to backtick" do
        line = "```"

        assert Marked.LineParser.parse(:code_guard, line).fence_type == "`"
      end
    end

    context "when code fence is made of tildas" do
      it "sets the fence_type to tilda" do
        line = "~~~"

        assert Marked.LineParser.parse(:code_guard, line).fence_type == "~"
      end
    end
  end

end
