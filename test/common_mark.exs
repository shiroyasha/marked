defmodule CommonMark do
  @common_mark_tests_path "test/common_mark_tests.json"

  def create_tests(section_name, callback) do
    tests = (section_name == "All") && all || section(section_name)

    tests |> Enum.map fn(test_case) ->
      section = test_case["section"]
      example = test_case["example"]
      markdown = test_case["markdown"]
      html = test_case["html"]

      test_title = "#{section} ##{example}"

      callback.(test_title, markdown, html)
    end
  end

  def section(section_name) do
    all |> Enum.filter(fn(test_case) -> test_case["section"] == section_name end)
  end

  def all do
    @common_mark_tests_path
    |> File.read!
    |> Poison.decode!
  end
end
