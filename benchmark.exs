Mix.install([:benchee, :benchee_html])

list = Enum.to_list(1..9_000)
map_fun = fn i -> [i, i * i] end

Benchee.run(
  %{
    "flat_map" => fn -> Enum.flat_map(list, map_fun) end,
    "map.flatten" => fn -> list |> Enum.map(map_fun) |> List.flatten() end
  },
  time: 10,
  memory_time: 2,
  formatters: [
    {Benchee.Formatters.HTML, file: "output.html"},
    Benchee.Formatters.Console
  ]
)
