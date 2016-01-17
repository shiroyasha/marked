defmodule MarkedTest do
  Code.load_file("test/common_mark.exs")

  use ExUnit.Case
  doctest Marked

  CommonMark.create_tests "Paragraphs", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "Lists", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "Tabs", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "All", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

end
