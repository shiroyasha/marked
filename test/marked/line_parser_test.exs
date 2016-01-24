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

    context "when code fence has a set language" do
      it "saves the language" do
        line = "``` ruby"

        assert Marked.LineParser.parse(:code_guard, line).language == "ruby"
      end
    end

    context "when code fence has no set language" do
      it "saves the language" do
        line = "```"

        assert Marked.LineParser.parse(:code_guard, line).language == nil
      end
    end
  end

  describe ":code" do
    it "strips the first 4 spaces from the string" do
      line = "    def test"

      assert Marked.LineParser.parse(:code, line).content == "def test"
    end
  end

end
