defmodule CheckersWeb.Game.Piece do
    alias CheckersWeb.Game.Piece
    alias CheckersWeb.Game.Square

    defstruct [
        color: "",
        nextMoves: [],
        isKing: false,
        position: :none
    ]
    
    def start_link() do
        Agent.start_link(fn-> %Piece{} end)
    end
    def get_state(pid) do
        Agent.get(pid, fn state -> state end)
    end
    def getPosition(pid) do
        Agent.get(pid, fn state -> state.position end)
    end

    def setPosition(pid, squarePid) do
        IO.puts("entered set position")
        Agent.update(pid, fn state -> Map.put(state, :position, squarePid) end)
    end 

    def getNextMoves(pid) do
        Agent.get(pid, fn state -> state.nextMoves end)
    end

    def getColor(pid) do
        Agent.get(pid, fn state -> state.color end)
    end

    def king?(pid) do
        Agent.get(pid, fn state -> state.isKing end)
    end

    def addtoSquare(pid, squarePid) do
        Square.setPiecePid(squarePid, pid)
        Square.setChecker(squarePid, true)
        setPosition(pid, squarePid)
    end

    def setColor(pid, color)  do 
        Agent.update(pid, fn state -> Map.put(state, :color, color) end)
    end
    def toString(pid) do
        " color => #{getColor(pid)}"
    end
   
end