use Mix.Config

import_config "secret.exs"

config :new_world_bot, NewWorldBot.Scheduler,
	jobs: [
		{"* * * * *", {NewWorldBot.Scheduler, :update_server_status, []}}
	]
