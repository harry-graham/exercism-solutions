export class Triangle {
  side1: number;
  side2: number;
  side3: number;

  constructor(side1: number, side2: number, side3: number) {
    this.side1 = side1;
    this.side2 = side2;
    this.side3 = side3;
  }

  get isEquilateral(): boolean {
    return this.side1 > 0 && this.hasThreeEqualSides();
  }

  get isIsosceles(): boolean {
    return this.hasAtLeastTwoEqualSides() && this.satisfiesTriangleInequality();
  }

  get isScalene(): boolean {
    return this.hasNoEqualSides() && this.satisfiesTriangleInequality();
  }

  private hasThreeEqualSides(): boolean {
    return (
      this.side1 === this.side2 &&
      this.side1 === this.side3
    );
  }

  private hasAtLeastTwoEqualSides(): boolean {
    return (
      this.side1 === this.side2 ||
      this.side1 === this.side3 ||
      this.side2 === this.side3
    );
  }

  private hasNoEqualSides(): boolean {
    return (
      this.side1 !== this.side2 &&
      this.side1 !== this.side3
    );
  }

  private satisfiesTriangleInequality(): boolean {
    return (
      this.side1 + this.side2 >= this.side3 &&
      this.side1 + this.side3 >= this.side2 &&
      this.side2 + this.side3 >= this.side1
    );
  }
}
