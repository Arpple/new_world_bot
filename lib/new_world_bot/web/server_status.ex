defmodule NewWorldBot.Web.ServerStatus do
	@url "https://www.newworld.com/en-us/support/server-status"
	@class_status_maintenance ".ags-ServerStatus-content-responses-response-server-status--maintenance"
	@class_status_up ".ags-ServerStatus-content-responses-response-server-status--up"
	@class_status_full ".ags-ServerStatus-content-responses-response-server-status--full"

  def status(world) do
		get_html()
		|> get_world_divs()
		|> find_world(world)
		|> get_status()
	end

	defp get_html() do
		%{body: body} = HTTPoison.get!(@url)
		Floki.parse_document!(body)
	end

	defp get_world_divs(html) do
		Floki.find(html, ".ags-ServerStatus-content-responses-response-server")
	end

	defp find_world(divs, world) do
		Enum.find(divs, fn div -> get_world_name(div) == world end)
	end

	defp get_world_name(div) do
		Floki.find(div, ".ags-ServerStatus-content-responses-response-server-name")
		|> Floki.text()
		|> String.trim()
	end

	defp get_status(div) do
		cond do
			have_class(div, @class_status_maintenance) -> :maintenance
			have_class(div, @class_status_up) -> :online
			have_class(div, @class_status_full) -> :online
			true -> :error
		end
	end

	defp have_class(div, class) do
		divs = Floki.find(div, class)
		length(divs) > 0
	end
end
