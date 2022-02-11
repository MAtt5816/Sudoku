class Sudoku
{
  private var grid = [[Int]]()

  init()
  {
    self.grid = Array(repeating: Array(repeating: 0, count: 9), count: 9)
  }

  func show()
  {
    print(grid)
  }
}

var sudoku = Sudoku()
sudoku.show()