defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    coordinate = x * x + y * y

    cond do
      coordinate > 10 * 10 -> 0
      coordinate > 5 * 5 -> 1
      coordinate > 1 -> 5
      true -> 10
    end
  end
end
