// Ensures returned value is positive (between 0 and |n|-1)
function positiveDivisionRemainder(n: number, divisor: number): number {
  if (divisor === 0) {
    throw new Error('Cannot perform division by zero');
  }

  return ((n % divisor) + divisor) % divisor;
}

export class Clock {
  hour: number;
  minute: number;

  constructor(hour: number, minute: number = 0) { 
    this.minute = 0;
    this.hour = 0;

    let total_minutes = (hour * 60) + minute;
    this.plus(total_minutes);
  }

  public toString(): string {
    let hour = this.formattedHour();
    let minute = this.formattedMinute();

    return `${hour}:${minute}`;
  }

  public plus(minutes: number): Clock {
    let additional_hours = (Math.floor((this.minute + minutes) / 60));

    this.minute = positiveDivisionRemainder(this.minute + minutes, 60);
    this.hour = positiveDivisionRemainder(this.hour + additional_hours, 24);

    return this;
  }

  public minus(minutes: number): Clock {
    let additional_hours = (Math.floor((this.minute - minutes) / 60));

    this.minute = positiveDivisionRemainder(this.minute - minutes, 60);
    this.hour = positiveDivisionRemainder(this.hour + additional_hours, 24);

    return this;
  }

  public equals(other: Clock): boolean {
    return this.hour === other.hour && this.minute === other.minute;
  }

  private formattedHour(): string {
    return String(this.hour % 24).padStart(2, "0");
  }

  private formattedMinute(): string {
    return String(this.minute % 60).padStart(2, "0");
  }
}
