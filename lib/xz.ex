defmodule XZ do
  @moduledoc """
  Elixir wrapper for the XZ SDK. Allows binary data to be compressed or decompressed.
  """

  @on_load { :init, 0 }
  app = Mix.Project.config[:app]

  @doc """
  Load the NIF from the priv directory
  """
  @spec init() :: :ok
  def init,
    do: :ok = :erlang.load_nif(:filename.join(:code.priv_dir(unquote(app)), ~c"nif"), 0)

  @spec compress(data :: binary()) :: {:ok, binary()} | {:error, term()}
  def compress(data),
    do: compress(data, [])

  @doc """
  Compress the given data.
  """
  @spec compress(data :: binary(), options :: [term()]) :: {:ok, binary()} | {:error, term()}
  def compress(data, options)
  def compress(_, _) do
    # if the NIF can't be loaded, this function is called instead.
    :erlang.nif_error(:nif_library_not_loaded)
  end

  @spec decompress(data :: binary()) :: {:ok, binary()} | {:error, term()}
  def decompress(data),
    do: decompress(data, [])

  @doc """
  Decompress the given data.
  """
  @spec decompress(data :: binary(), options :: [term()]) :: {:ok, binary()} | {:error, term()}
  def decompress(data, options)
  def decompress(_, _) do
    # if the NIF can't be loaded, this function is called instead.
    :erlang.nif_error(:nif_library_not_loaded)
  end
end
