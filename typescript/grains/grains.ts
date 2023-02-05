export const square = (num: number): bigint => {
  assertValidSquare(num);

  return BigInt(2 ** (num - 1));
}

export const total = () => {
  return chessboardIndexes().reduce(
    (total: bigint, num: number): bigint => total + square(num),
    BigInt(0)
  );
}

function assertValidSquare(num: number): void {
  if (num < 1 || num > 64) throw new Error("Invalid square");
}

function chessboardIndexes() {
  return [...Array(64).keys()].map(x => x + 1);
}
