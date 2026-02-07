require_relative "./word_search"

describe "#word_exists" do
  it "returns expected result for provided ex 1" do
    board = [%w[A B C E], %w[S F C S], %w[A D E E]]
    word = "ABCCED"
    result = word_exists(board, word)
    expect(result).to be_truthy
  end

  it "returns expected result for provided ex 2" do
    board = [%w[A B C E], %w[S F C S], %w[A D E E]]
    word = "SEE"
    result = word_exists(board, word)
    expect(result).to be_truthy
  end

  it "returns expected result for provided ex 3" do
    board = [%w[A B C E], %w[S F C S], %w[A D E E]]
    word = "ABCB"
    result = word_exists(board, word)
    expect(result).to be_falsey
  end

  it "passes failing test case" do
    board = [%w[C A A], %w[A A A], %w[B C D]]
    word = "AAB"
    result = word_exists(board, word)
    expect(result).to be_truthy
  end

  it "passes other failing test case" do
    board = [%w[A B C E], %w[S F E S], %w[A D E E]]
    word = "ABCEFSADEESE"
    result = word_exists(board, word)
    expect(result).to be_truthy
  end

  it "passes other failing test case" do
    board = [["a"]]
    word = "a"
    result = word_exists(board, word)
    expect(result).to be_truthy
  end
end