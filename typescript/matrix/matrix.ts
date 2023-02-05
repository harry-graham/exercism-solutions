export class Matrix {
  readonly rows: number[][];
  readonly columns: number[][];

  constructor(str: string) {
    this.rows = Matrix.parseInputDataIntoRows(str);
    this.columns = Matrix.transposeToColumns(this.rows);
  }

  // Example data:
  // Input: "1 2\n10 20"
  // Output: [[1, 2], [10, 20]]
  private static parseInputDataIntoRows(str: string): number[][] {
    return str.split("\n").map(row => row.split(" ").map(Number));
  }

  // Example data:
  // Input: [[1, 2], [3, 4], [5, 6]]
  // Output: [[1, 3, 5], [2, 4, 6]]
  private static transposeToColumns(rows: number[][]): number[][] {
    return rows[0].map((_, colIndex) => rows.map(row => row[colIndex]));
  }
}
