export function count(phrase: string): Map<string, number> {
  const result = new Map<string, number>;

  phrase.toLowerCase()
    .trim()
    .split(/\s+/)
    .forEach((word) => {
      const wordCount = result.get(word) || 0;
      result.set(word, wordCount + 1);
    });

  return result;
}
