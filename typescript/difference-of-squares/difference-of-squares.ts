export class Squares {
  n: number;

  constructor(count: number) {
    this.n = count;
  }

  get sumOfSquares(): number {
    return this.sumOf(this.baseArray().map(x => x ** 2));
  }

  get squareOfSum(): number {
    return this.sumOf(this.baseArray()) ** 2;
  }

  get difference(): number {
    return this.squareOfSum - this.sumOfSquares;
  }

  private baseArray(): number[] {
    return Array.from(Array(this.n).keys()).map(x => x + 1);
  }

  private sumOf(arr: number[]): number {
    return arr.reduce((partialSum, a) => partialSum + a, 0);
  }
}
