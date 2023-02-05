function sortAlphabetically(words: string[]): string[] {
  return words.sort((a, b): number => {
    return (a < b) ? -1 : a > b ? 1 : 0
  })
}

function deepCopyOf<T>(obj: T): T {
  return JSON.parse(JSON.stringify(obj));
}

type Roster = {
  [key: number]: string[];
}

export class GradeSchool {
  rosterData: Roster;

  constructor() {
    this.rosterData = {};
  }

  roster(): Roster {
    return deepCopyOf(this.rosterData);
  }

  add(studentName: string, grade: number): void {
    if (this.rosterData[grade] === undefined) {
      this.rosterData[grade] = [];
    }

    // Students cannot be in two different grades
    this.removeStudentFromRoster(studentName);
    // Add to the new grade
    this.rosterData[grade].push(studentName);
    this.rosterData[grade] = sortAlphabetically(this.rosterData[grade]);
  }

  grade(grade: number): string[] {
    if (this.rosterData[grade] === undefined) {
      return [];
    }

    return deepCopyOf(this.rosterData[grade]);
  }

  private removeStudentFromRoster(student: string): void {
    for (const [grade, students] of Object.entries(this.rosterData)) {
      this.rosterData[Number(grade)] = students.filter(x => x !== student);
    }
  }
}
