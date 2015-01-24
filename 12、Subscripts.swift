//TODO:1. Subscript Syntax 
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) ->Int{//read-only
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
threeTimesTable[6]
//TODO:2. Subscript Usage
var numberOfLegs = ["spider":8, "ant":6, "cat":4]
numberOfLegs["bird"] = 2
//TODO:3. Subscript Options
struct Matrix {
    let rows: Int, columns: Int
    var grid:[Double]
    init(rows:Int, columns:Int){
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    func indexIsValidForRow(row: Int, column: Int)->Bool{
        return rows>=0 && row<rows && column>=0 && column < columns
    }
    subscript(row:Int, column:Int)->Double{
        get{
            assert(indexIsValidForRow(row, column: column),"Index out of Range")
            return grid[(row * columns)+column]
        }
        set{
            assert(indexIsValidForRow(row, column: column),"Index out of Range")
            grid[(row * columns)+column] = newValue
        }
    }
}
var matrix = Matrix(rows: 2, columns: 2)
matrix[0,1] = 1.5
matrix[1,0] = 3.2
let someValue = matrix[1,1]
//let someValue2 = matrix[2,2]; out of range
