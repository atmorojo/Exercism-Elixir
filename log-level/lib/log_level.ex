defmodule LogLevel do
  def to_label(level, legacy?) do
    label = {:trace, :debug, :info, :warning, :error, :fatal, :unknown}

    cond do
      level in 1..4 or (level in [0, 5] and not legacy?) -> elem(label, level)
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)

    cond do
      label in [:fatal, :error] -> :ops
      label == :unknown and legacy? -> :dev1
      label == :unknown and not legacy?  -> :dev2
      true -> false
    end
  end
end
