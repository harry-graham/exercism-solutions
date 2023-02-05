export function decodedValue(colors: string[]) {
  return parseInt(
    colorToValue(colors[0]) + colorToValue(colors[1])
  )
}

function colorToValue(color: string) {
  var color_mapping: { [key: string]: number } = {
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
  }
  return color_mapping[color].toString()
}
