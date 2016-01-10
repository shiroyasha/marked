defmodule MarkedTest do
  use ExUnit.Case
  doctest Marked

  @common_mark_tests_path "test/common_mark_tests.json"

  @common_mark_tests_path
  |> File.read!
  |> Poison.decode!
  |> Enum.map fn(test_case) ->

    test_title = "#{test_case["section"]} -- example #{test_case["example"]}"

    test test_title do
      markdown = unquote(test_case["markdown"])
      html = unquote(test_case["html"])

      assert Marked.to_html(markdown) == html
    end

  end

end
