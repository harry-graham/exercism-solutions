export function decodedResistorValue(bands: [string, string, string]): string {
  let firstDigit = colorToValue(bands[0]);
  let secondDigit = colorToValue(bands[1]);
  let numZeroes = colorToValue(bands[2]);

  return resistorValue(firstDigit, secondDigit, numZeroes);
};

function colorToValue(color: string): number {
  let colorMapping: { [key: string]: number } = {
    'black': 0,
    'brown': 1,
    'red': 2,
    'orange': 3,
    'yellow': 4,
    'green': 5,
    'blue': 6,
    'violet': 7,
    'grey': 8,
    'white': 9
  };

  return colorMapping[color];
};

function resistorValue(firstDigit: number, secondDigit: number, numZeroes: number): string {
  let result: string = firstDigit.toString();

  if (secondDigit == 0) {
    numZeroes += 1;
  } else {
    result += secondDigit.toString();
  }

  let zeroes = "0".repeat(numZeroes % 3);

  return result + zeroes + " " + resistanceUnit(numZeroes);
};

function resistanceUnit(numZeroes: number): string {
  if (numZeroes >= 3) {
    return "kiloohms"
  } else {
    return "ohms"
  }
};
