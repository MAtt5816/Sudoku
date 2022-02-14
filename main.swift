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
      var list = Set<Int>(1...9)
      for col in grid[row].indices
      {
        var isOK: Bool = false
        var number: Int? = nil
        while(!isOK){
          number = list.randomElement()
          if(validate(row, col, number!))
          {
            grid[row][col] = number!
            print(number!) //tmp
            isOK = true
          }
        }
        if(number != nil)
        {
          list.remove(number!)
        }
      }
      print(grid[row]) //tmp
    }
  }

  func validate(_ row: Int, _ col: Int, _ number: Int) -> Bool
  {
    if(!valid_row(row, number))
    {
      return false
    }
    if(row != 0)
    {
      if(!valid_col(row, col, number))
      {
        return false
      }
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

  func valid_col(_ row: Int, _ col: Int, _ number: Int) -> Bool
  {
    var row_set = Set<Int>(grid[row])
    row_set.remove(0)
    var col_set = Set<Int>()
    for i in 0..<9
    {
      if(grid[i][col] == 0)
      {
        break
      }
      else if(grid[i][col] == number)
      {
        return false
      }
      else
      {
        col_set.insert(grid[i][col])
      }
    }
    if (row_set.count > 1) && (col_set.count > 4)
    {
      let common = row_set.intersection(col_set).count
      print("cmmn \(common), rows \(row_set.count), cols \(col_set.count)")  //tmp
      if(row_set.count > col_set.count)
      {
        if !(col_set.count-common <=  row_set.count-(8 - row_set.count))
        {
          return false
        }
      }
      else
      {
        if !(row_set.count-common <= col_set.count-(8 - col_set.count))
        {
          return false
        }
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