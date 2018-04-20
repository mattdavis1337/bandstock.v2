defmodule Bandstock.Conversation.ConversationServer do
  use GenServer

  alias Bandstock.Repo

  @name :conversation_server

  # Client API
  def start_link(opts \\ []) do
    IO.puts "+++ConversationServer start_link"
    GenServer.start_link(__MODULE__, [], opts ++ [name: @name])
  end

  def hello() do
    IO.puts('hello')
  end

  def start_conversation(status) do
    IO.puts("+++In Conversation Server1")
    IO.inspect(status)
    GenServer.cast(@name, status)
  end

  # Server implementation
  #Init is to set the initial state
  def init(initial_data) do
    IO.puts "+++ConversationServer Init"
    greetings = %{:greeting => initial_data}
    {:ok, greetings}
  end


  def handle_cast(status, _state) do

    IO.puts("++++In ConversationServer2")
    IO.inspect(status)
    
    {:noreply, []}
  end
  
  #defp get_content_type(headers) do
  #  header_map = headers |> Map.new
  #  header_map["Content-Type"]
  #end
end