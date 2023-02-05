class Die {
  // Generates a random number between 1 and 6
  roll(): number {
    return Math.floor(Math.random() * 5) + 1;
  }
}

export class DnDCharacter {
  public strength: number;
  public dexterity: number;
  public constitution: number;
  public intelligence: number;
  public wisdom: number;
  public charisma: number;
  public hitpoints: number;
  
  constructor() {
    this.strength = DnDCharacter.generateAbilityScore();
    this.dexterity = DnDCharacter.generateAbilityScore();
    this.constitution = DnDCharacter.generateAbilityScore();
    this.intelligence = DnDCharacter.generateAbilityScore();
    this.wisdom = DnDCharacter.generateAbilityScore();
    this.charisma = DnDCharacter.generateAbilityScore();

    this.hitpoints = DnDCharacter.getModifierFor(this.constitution) + 10;
  }

  public static generateAbilityScore(): number {
    let rolls: number[] = [];

    for (let i = 0; i < 4; i++) {
      let die = new Die;
      rolls.push(die.roll());
    }

    let sortedRolls = rolls.sort((a, b) => { return a - b });
    let maxRolls = sortedRolls.slice(-3);
    let total = maxRolls.reduce((a,b) => a + b, 0);

    return total;
  }

  public static getModifierFor(abilityValue: number): number {
    return Math.floor((abilityValue - 10) / 2);
  }
}
