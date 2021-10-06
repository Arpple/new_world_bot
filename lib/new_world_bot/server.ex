defmodule NewWorldBot.Server do
	alias NewWorldBot.Web.ServerStatus

	def status(world) do
		ServerStatus.status(world)
	end
end
