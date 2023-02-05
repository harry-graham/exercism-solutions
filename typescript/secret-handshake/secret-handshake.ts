const MOVES = [
  'wink',
  'double blink',
  'close your eyes',
  'jump'
];

// Assumption: input is non-negative
export function commands(decimal: number): string[] {
  let binaryDigits = decimal.toString(2).split("").reverse();
  
  let moves: string[] = MOVES.filter((_, i) => binaryDigits[i] === "1");

  if (binaryDigits[4] === "1") {
    moves = moves.reverse();
  }

  return moves;
}
