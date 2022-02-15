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
        var counter: Int = 0
        while(!isOK){
          let number = list.randomElement()
          if(validate(row, col, number!))
          {
            grid[row][col] = number!
            print(number!) //tmp
            isOK = true
            list.remove(at: list.firstIndex(of: number!)!)
          }
          else if (counter > (list.count + 3)) && col != 0
          {
            list.insert(grid[row][col-1])
            grid[row][col-1] = 0
            counter = 0
          }
          else{
            counter += 1
          }
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
      if(!valid_col(col, number))
      {
        return false
      }
      if(!valid_sq(row, col, number))
      {
        return false
      }
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
      if(grid[i][col] == 0)
      {
        break
      }
      else if(grid[i][col] == number)
      {
        return false
      }
    }
    return true
  }

  func valid_sq(_ row: Int, _ col: Int, _ number: Int) -> Bool
  {
    /*
    Subsquares:
    1. 2. 3.
    4. 5. 6.
    7. 8. 9.
    */
    let big_row: Int = row/3+1
    let big_col: Int = col/3+1

    var tmp_set = Set<Int>()
    for r in (big_row*3-3)...(big_row*3-1)
    {
      for c in (big_col*3-3)...(big_col*3-1)
      {
        tmp_set.insert(grid[r][c])
      }
    }
    if(tmp_set.insert(number).inserted){
      return true
    }
    else
    {
      return false
    }
  }  
}

var sudoku = Sudoku()
sudoku.show()