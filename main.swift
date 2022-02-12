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
      var num_list: [Int] = Array(1...9)
      for col in grid[row].indices
      {
        var num_list_copy: [Int] = num_list
        var isOK: Bool = false
        var index: Int?
        while(!isOK)
        {
          let number = num_list_copy.randomElement()
          index = num_list_copy.firstIndex(of: number?)
          if(validate(row, col, number))
          {
            grid[row][col] = number
            isOK = true
          }
          else
          {
            if(index != nil)
            {
              num_list_copy.remove(at: index!)
            }
          }
        }
        if(index != nil)
        {
          num_list.remove(at: index!)
        }
      }
    }
  }

  func validate(_ row: Int, _ col: Int, _ number: Int) -> Bool
  {
    if(!valid_row(row, number))
    {
      return false
    }
    if(!valid_col(col, number))
    {
      return false
    }
    if(!valid_sq())
    {
      return false
    }
    return true
  }

  func valid_row(_ row: Int, _ number: Int) -> Bool
  {
    var tmp_set = Set<Int>(grid[row])
    if(tmp_set.insert(number).inserted)
    {
      return true
    }
    else
    {
      return false
    }
  }

  func valid_col(_ col: Int, _ number: Int) -> Bool
  {
    for i in 0..<9
    {
      if(grid[i][col] == number)
      {
        return false
      }
    }
    return true
  }

  func valid_sq() -> Bool
  {
    return true
  }  
}

var sudoku = Sudoku()
sudoku.show()