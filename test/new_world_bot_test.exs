defmodule NewWorldBotTest do
  use ExUnit.Case
  doctest NewWorldBot

  test "greets the world" do
    assert NewWorldBot.hello() == :world
  end
end
