require_relative './search_2D_matrix'

describe "#search_matrix_recursive" do
  it "returns expected result for provided example 1" do
    matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]]
    target = 3
    result = search_matrix_recursive(matrix,target)
    expect(result).to eq(true)
  end

  it "returns expected result for provided example 2" do
    matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]]
    target = 13
    result = search_matrix_recursive(matrix,target)
    expect(result).to eq(false)
  end

  it "returns expected result" do
    matrix = [[1, 30, 31, 37]]
    target = 31
    result = search_matrix_recursive(matrix,target)
    expect(result).to eq(true)
  end

  it "returns expected result with single row when target is last value" do
    matrix = [[1, 30, 31, 37]]
    target = 37
    result = search_matrix_recursive(matrix,target)
    expect(result).to eq(true)
  end

  it "returns expected result when target exceeds entire matrix" do
    matrix = [[1, 2, 3, 4], [19, 20, 30, 60], [61, 62, 64, 70]]
    target = 71
    result = search_matrix_recursive(matrix,target)
    expect(result).to eq(false)
  end

  it "returns expected result when rows only have a single element" do
    matrix = [[3], [4]]
    target = 3
    result = search_matrix_recursive(matrix,target)
    expect(result).to eq(true)
  end

  it "returns expected result" do
    matrix =  [[3, 5], [11, 15], [21, 22]]
    target = 15
    result = search_matrix_recursive(matrix,target)
    expect(result).to eq(true)
  end

  it "returns expected result with negative values when target is first element" do
    matrix =  [[-21, -20, -9, 0, 1, 34], [50, 51, 55, 60, 61, 65], [78, 79, 80, 90, 100, 102]]
    target = -21
    result = search_matrix_recursive(matrix,target)
    expect(result).to eq(true)
  end

  it "returns expected result with negative numbers when target is smaller than entire matrix" do
    matrix =  [[-21, -20, -9, 0, 1, 34], [50, 51, 55, 60, 61, 65], [78, 79, 80, 90, 100, 102]]
    target = -25
    result = search_matrix_recursive(matrix,target)
    expect(result).to eq(false)
  end
end

describe "#search_matrix_iterative" do
  it "returns expected result for provided example 1" do
    matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]]
    target = 3
    result = search_matrix_iterative(matrix,target)
    expect(result).to eq(true)
  end

  it "returns expected result for provided example 2" do
    matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]]
    target = 13
    result = search_matrix_iterative(matrix,target)
    expect(result).to eq(false)
  end

  it "returns expected result" do
    matrix = [[1, 30, 31, 37]]
    target = 31
    result = search_matrix_iterative(matrix,target)
    expect(result).to eq(true)
  end

  it "returns expected result with single row when target is last value" do
    matrix = [[1, 30, 31, 37]]
    target = 37
    result = search_matrix_iterative(matrix,target)
    expect(result).to eq(true)
  end

  it "returns expected result when target exceeds entire matrix" do
    matrix = [[1, 2, 3, 4], [19, 20, 30, 60], [61, 62, 64, 70]]
    target = 71
    result = search_matrix_iterative(matrix,target)
    expect(result).to eq(false)
  end

  it "returns expected result when rows only have a single element" do
    matrix = [[3], [4]]
    target = 3
    result = search_matrix_iterative(matrix,target)
    expect(result).to eq(true)
  end

  it "returns expected result" do
    matrix =  [[3, 5], [11, 15], [21, 22]]
    target = 15
    result = search_matrix_iterative(matrix,target)
    expect(result).to eq(true)
  end

  it "returns expected result with negative values when target is first element" do
    matrix =  [[-21, -20, -9, 0, 1, 34], [50, 51, 55, 60, 61, 65], [78, 79, 80, 90, 100, 102]]
    target = -21
    result = search_matrix_iterative(matrix,target)
    expect(result).to eq(true)
  end

  it "returns expected result with negative numbers when target is smaller than entire matrix" do
    matrix =  [[-21, -20, -9, 0, 1, 34], [50, 51, 55, 60, 61, 65], [78, 79, 80, 90, 100, 102]]
    target = -25
    result = search_matrix_iterative(matrix,target)
    expect(result).to eq(false)
  end
end