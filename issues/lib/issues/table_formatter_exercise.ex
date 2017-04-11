defmodule Issues.TableFormatterExercise do

  def print_as_table(issues, columns) do
    columns_with_width = get_columns_with_width(issues, columns)
    get_header_column_names(columns_with_width) |> IO.puts
    get_header_cells(columns_with_width) |> IO.puts
    get_issues_as_rows(issues, columns_with_width) |> Enum.each(&IO.puts/1)
  end

  def get_header_column_names(columns_with_width) do
    columns_with_width
    |> Enum.map(&String.pad_trailing(elem(&1, 0), elem(&1, 1)))
    |> Enum.join(" | ")
  end

  def get_header_cells(columns_with_width) do
    columns_with_width
    |> Enum.map(&String.duplicate("-", elem(&1, 1)))
    |> Enum.join("-+-")
  end

  def get_issues_as_rows(issues, columns_with_width) do
    for issue <- issues,
    do: get_issue_as_row(issue, columns_with_width)
  end

  def get_issue_as_row(issue, columns) do
    columns
    |> Enum.map(&String.pad_trailing(to_string(issue[elem(&1, 0)]), elem(&1, 1)))
    |> Enum.join(" | ")
  end

  def get_columns_with_width(issues, columns) do
    for column <- columns, do: {column, get_column_with_width(issues, column)}
  end

  def get_column_with_width(issues, column) do
    issues
    |> Stream.map(&(&1[column]))
    |> Stream.map(&to_string/1)
    |> Stream.map(&String.length/1)
    |> Enum.max
  end

  def data do
  [
    %{"id" => 1, "title" => "titile_for_id_1", "content" => "content_for_id_111111"},
    %{"id" => 22, "title" => "titile_for_id_2", "content" => "content_for_id_22222"},
    %{"id" => 333, "title" => "titile_for_id_3", "content" => "content_for_id_3333"},
    %{"id" => 4444, "title" => "titile_for_id_4", "content" => "content_for_id_444"},
    %{"id" => 55555, "title" => "titile_for_id_5", "content" => "content_for_id_55"},
    %{"id" => 666666, "title" => "titile_for_id_6", "content" => "content_for_id_6"},
  ]
  end
end
