defmodule NewWorldBot.Discord do
  use Nostrum.Consumer

	alias Nostrum.Api
	alias NewWorldBot.Server

	def start_link do
		Consumer.start_link(__MODULE__)
	end

	def handle_event(_event) do
		:noop
	end

	def set_status(world_status) do
		status = case world_status do
			:maintenance -> :idle
			:online -> :online
			_ -> :dnd
		end

		Api.update_status(status, "")
	end
end
