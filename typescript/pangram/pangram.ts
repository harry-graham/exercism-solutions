const alphabet: string[] = [...'abcdefghijklmnopqrstuvwxyz'];

export function isPangram(sentence: string): boolean {
  sentence = sentence.toLowerCase();
  return alphabet.every(letter => sentence.includes(letter));
}
