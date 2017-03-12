defmodule Orders do

  def full_orders(orders, tax_rates) do
    with_taxes =
      orders
      |> orders_with_taxes(tax_rates)
      |> add_total_amount_to_orders_with_taxes(tax_rates)

    without_taxes =
      orders
      |> orders_without_taxes(tax_rates)
      |> add_total_amount_to_orders_without_taxes

    with_taxes ++ without_taxes
    |> Enum.sort
  end

  defp orders_with_taxes(orders, tax_rates) do
    for [_, {:ship_to, ship_to}, _] = order <- orders,
      {state, _} <- tax_rates,
      ship_to == state,
      do: order
  end

  defp orders_without_taxes(orders, tax_rates) do
    orders -- orders_with_taxes(orders, tax_rates)
  end

  defp add_total_amount_to_orders_with_taxes(orders, tax_rates) do
    for [_, {:ship_to, ship_to}, {_, net_amount}] = order <- orders,
    {state, tax} <- tax_rates,
    ship_to == state,
    do: order ++ [{:total_amount, net_amount + tax}]
  end

  defp add_total_amount_to_orders_without_taxes(orders) do
    for [_, _, {_, net_amount}] = order <- orders,
    do: order ++ [{:total_amount, net_amount}]
  end

  def tax_rates, do: [NC: 0.075, TX: 0.08]

  def orders do
    [
      [id: 123, ship_to: :NC, net_amount: 100.0],
      [id: 124, ship_to: :OK, net_amount: 35.50],
      [id: 125, ship_to: :TX, net_amount: 24.0],
      [id: 126, ship_to: :TX, net_amount: 44.0],
      [id: 127, ship_to: :NC, net_amount: 25.0],
      [id: 128, ship_to: :MA, net_amount: 10.0],
      [id: 129, ship_to: :CA, net_amount: 102.0],
      [id: 130, ship_to: :NC, net_amount: 50.0]
    ]
  end

end
