const dnaToRnaMapping: { [key: string] : string } = {
  'A': 'U',
  'C': 'G',
  'G': 'C',
  'T': 'A'
};

const validDna = Object.keys(dnaToRnaMapping);

function validateDna(dna: string): void {
  if (!validDna.includes(dna)) {
    throw new Error('Invalid input DNA.');
  }
}

export function toRna(dnaStrand: string): string {
  let letters = dnaStrand.split('');
  let result = '';

  for (let i = 0; i < letters.length; i++) {
    let letter = letters[i];
    validateDna(letter);
    result += dnaToRnaMapping[letter];
  }

  return result;
}
