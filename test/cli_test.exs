defmodule CLITest do
  use ExUnit.Case
  doctest Issues

  import Issues.CLI, only: [parse_args: 1]

  describe "Argument parser" do
    test "returns :help if not enough options provided" do
      assert parse_args([]) == :help
      assert parse_args(["user"]) == :help
    end

    test "returns :help when -h and --help passed" do
      assert parse_args(["-h", "anything"]) == :help
      assert parse_args(["--help", "anything"]) == :help
    end

    test "returns three values when three options given" do
      assert parse_args(["user", "project", "99"]) == {"user", "project", 99}
    end

    test "defaults count when two options given" do
      assert parse_args(["user", "project"]) == {"user", "project", 4}
    end
  end
end
