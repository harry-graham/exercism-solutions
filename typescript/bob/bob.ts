function hasLetters(str: string): boolean {
  let regExp = /[a-zA-Z]/g;
  return regExp.test(str);
}

function isAllUpperCase(str: string): boolean {
  return str === str.toUpperCase();
}

function isSilent(str: string): boolean {
  return str.length === 0;
}

function isAskingQuestion(str: string): boolean {
  return str.slice(-1) === "?";
}

function isYelling(str: string): boolean {
  return hasLetters(str) && isAllUpperCase(str);
}

export function hey(message: string): string {
  message = message.trim();

  if (isSilent(message)) {
    return "Fine. Be that way!";
  } else if (isYelling(message) && isAskingQuestion(message)) {
    return "Calm down, I know what I'm doing!";
  } else if (isYelling(message)) {
    return "Whoa, chill out!";
  } else if (isAskingQuestion(message)) {
    return "Sure.";
  } else {
    return "Whatever.";
  }
}
