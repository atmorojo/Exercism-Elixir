defmodule FreelancerRates do
  @daily_productive_hour 8.0
  @monthly_billable_days 22

  def daily_rate(hourly_rate), do: hourly_rate * @daily_productive_hour

  def apply_discount(before_discount, discount) do
    before_discount * (100 - discount) / 100 # Stolen from mig4ng's solution
  end

  def monthly_rate(hourly_rate, discount) do
    # Modified from mrroot5's comment on mig4ng's solution
    hourly_rate
      |> daily_rate
      |> Kernel.*(@monthly_billable_days)
      |> apply_discount(discount)
      |> ceil()
      |> trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    # The code is less readable but PIPE EVERYTHING!
    budget
      |> Kernel./(
        hourly_rate
        |> daily_rate
        |> apply_discount(discount)    
      )
      |> Float.floor(1)
  end
end
