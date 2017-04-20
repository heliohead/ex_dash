defmodule Mix.Tasks.Docs.Dash do
  @moduledoc """
  Run ExDoc with a Dash Docs compatible formatter and output.
  """

  use Mix.Task

  alias Mix.Tasks.Docs
  alias ExDash.Store

  @type args :: [String.t]

  @doc """
  Builds a Dash Docset for the current Mix project.

  ## Options

    * `--open`: opens the built docset in Dash following the build
    * `--name NAME`: names the docset something other than the app name (recommended for umbrella apps)

  """
  @spec run(args) :: String.t
  def run(args \\ []) do
    {opts, _, _} =
      OptionParser.parse(args, switches: [open: :boolean, name: :string])

    name =
      Keyword.get(opts, :name)

    Store.start_link()

    Store.set(:name, name)

    [doc_set_path] =
      Docs.run(["-f", ExDash])

    auto_open? =
      Keyword.get(opts, :open, false)

    if auto_open? do
      IO.inspect(doc_set_path, label: :opening)
      System.cmd("open", [doc_set_path], [])
    end

    doc_set_path
  end
end
