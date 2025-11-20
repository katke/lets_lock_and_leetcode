require_relative './canonical_path'

describe "#simplify_path" do
    it "should return the correct output for provided example 1" do
        path = "/home/"
        result = simplify_path(path)
        expect(result).to eq("/home")
    end

    it "should return the correct output for provided example 2" do
        path = "/home//foo/"
        result = simplify_path(path)
        expect(result).to eq("/home/foo")
    end

    it "should return the correct output for provided example 3" do
        path = "/home/user/Documents/../Pictures"
        result = simplify_path(path)
        expect(result).to eq("/home/user/Pictures")
    end

    it "should return the correct output for provided example 4" do
        path = "/../"
        result = simplify_path(path)
        expect(result).to eq("/")
    end

    it "should return the correct output for provided example 5" do
        path = "/.../a/../b/c/../d/./"
        result = simplify_path(path)
        expect(result).to eq("/.../b/d")
    end

    it "should handle long path followed by lots of cd .." do
        path = "/a/b/c/d/e/f/g/h/i/../../..//../..//..///"
        result = simplify_path(path)
        expect(result).to eq("/a/b/c")
    end
end