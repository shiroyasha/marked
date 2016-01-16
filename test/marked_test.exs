defmodule MarkedTest do
  use ExUnit.Case
  doctest Marked

  @common_mark_tests_path "test/common_mark_tests.json"

  @common_mark_tests_path
  |> File.read!
  |> Poison.decode!
  #|> Enum.filter(fn(test_case) -> test_case["section"] == "Paragraphs" end)
  #|> Enum.filter(fn(test_case) -> test_case["section"] == "Thematic breaks" end)
  #|> Enum.filter(fn(test_case) -> test_case["section"] == "Tabs" end)
  #|> Enum.filter(fn(test_case) -> test_case["section"] == "Lists" end)
  |> Enum.map fn(test_case) ->

    section = test_case["section"]
    example = test_case["example"]
    markdown = test_case["markdown"]
    html = test_case["html"]

    test_title = "#{section} ##{example}"

    test test_title do
      assert Marked.to_html(unquote(markdown)) == unquote(html)
    end

  end

end
