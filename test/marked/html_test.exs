defmodule HtmlTest do
  use ExSpec
  doctest Marked

  describe ".code" do
    it "escapes '<' and '>'" do
      assert Marked.Html.code("<\\n >") == "<pre><code>&lt;\\n &gt;\n</code></pre>\n"
    end
  end

end
