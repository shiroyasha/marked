defmodule MarkedTest do
  Code.load_file("test/common_mark.exs")

  use ExUnit.Case
  doctest Marked

  CommonMark.create_tests "Paragraphs", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "Thematic breaks", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "Lists", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "List items", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "ATX headings", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "Fenced code blocks", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "Emphasis and strong emphasis", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "Indented code blocks", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "Links", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "Hard line breaks", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "HTML blocks", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "Tabs", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "Images", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "Block quotes", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "Raw HTML", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "Setext headings", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "Code spans", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "Autolinks", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "Entity and numeric character references", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "Link reference definitions", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "Backslash escapes", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "Blank lines", fn(title, markdown, html) ->
    test title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end
  end

  CommonMark.create_tests "Inlines", fn(title, markdown, html) ->
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
