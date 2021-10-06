defmodule NewWorldBot.Web.ServerStatus do
	@url "https://www.newworld.com/en-us/support/server-status"
	@status_maintenance_class ".ags-ServerStatus-content-responses-response-server-status--maintenance"

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
		if have_class(div, @status_maintenance_class) do
			:maintenance
		else
			:error
		end
	end

	defp have_class(div, class) do
		divs = Floki.find(div, class)
		length(divs) > 0
	end
end
