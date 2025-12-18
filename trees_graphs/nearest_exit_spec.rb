require_relative "./nearest_exit"

describe "#nearest_exit" do
    it "returns the expected result for provided example 1" do
        maze = [["+","+",".","+"],[".",".",".","+"],["+","+","+","."]]
        entrance = [1,2]
        result = nearest_exit(maze, entrance)
        expect(result).to be(1)
    end

    it "returns the expected result for provided example 2" do
        maze = [["+","+","+"],[".",".","."],["+","+","+"]]
        entrance = [1,0]
        result = nearest_exit(maze, entrance)
        expect(result).to be(2)
    end
    
    it "returns the expected result for provided example 3" do
        maze = [[".","+"]]
        entrance = [0,0]
        result = nearest_exit(maze, entrance)
        expect(result).to be(-1)
    end