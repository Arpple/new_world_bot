defmodule NewWorldBot.Scheduler do
  use Quantum, otp_app: :new_world_bot

	alias NewWorldBot.{ Server, Discord }

	def update_server_status() do
		Application.get_env(:new_world_bot, :world)
		|> Server.status()
		|> Discord.set_status()
	end
end
