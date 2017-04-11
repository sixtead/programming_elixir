defmodule Weather do
  @moduledoc """
  Documentation for Weather.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Weather.hello
      :world

  """
  def hello do
    :world
  end

  def get(location) do
    XML.get(location)
    |> XML.handle_response
    |> XML.get_content
    |> XML.parse(
                 ["location",
                  "station_id",
                  "latitude",
                  "longitude",
                  "weather",
                  "temperature_string",
                  "relative_humidity",
                  "wind_string",
                  "pressure_string"
                 ]
                )
    |> XML.print
  end
end
