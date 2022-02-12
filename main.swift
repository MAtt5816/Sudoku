class Sudoku
{
  private var grid = [[Int]]()

  init()
  {
    self.grid = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    generate()
  }

  func show()
  {
    print(grid)
  }

  func generate()
  {
    for row in grid.indices
    {
      for col in grid[row].indices
      {
        grid[row][col] = Int.random(in: 1...9)
      }
    }
  }
}

var sudoku = Sudoku()
sudoku.show()