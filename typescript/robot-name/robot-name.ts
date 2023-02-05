let robotNamesDb: string[] = [];

const validLetters: string[] = [..."ABCDEFGHIJKLMNOPQRSTUVWXYZ"];

export class Robot {
  _name: string;

  constructor() {
    this._name = this.newRobotName();
  }

  public get name(): string {
    return this._name;
  }

  public resetName(): void {
    this._name = this.newRobotName();
  }

  public static releaseNames(): void {
    robotNamesDb = [];
  }

  private newRobotName(): string {
    let newName = "";

    do { newName = this.generateNewRobotName() }
    while (robotNamesDb.includes(newName));

    robotNamesDb.push(newName);
    return newName;
  }

  private generateNewRobotName(): string {
    let newName = "";

    for (let i = 0; i < 2; i++) {
      newName += validLetters[Math.floor(Math.random() * 26)];
    }

    for (let i = 0; i < 3; i++) {
      newName += String(Math.floor(Math.random() * 10))
    }

    return newName;
  }
}
