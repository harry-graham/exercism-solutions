class Tournament
  class << self
    def tally(input)
      scoreboard = Scoreboard.new
      scoreboard.add_results!(input)
      scoreboard.formatted_results
    end
  end
end

class Scoreboard
  attr_reader :stats

  def initialize
    @stats = {}
  end

  def add_results!(input)
    input.split("\n").each { |row| add_result!(row) }
  end

  def add_result!(row)
    team_1, team_2, result = row.split(";")
    initialize_team(team_1)
    initialize_team(team_2)

    update_stats!(team_1, team_2, result)
  end

  def formatted_results
    ScoreboardResults.new(self).results
  end

  private

  attr_writer :stats

  def initialize_team(team)
    stats[team] ||= {MP: 0, W: 0, D: 0, L: 0, P: 0}
  end

  def update_stats!(team_1, team_2, result)
    stats[team_1][:MP] += 1
    stats[team_2][:MP] += 1
    case result
    when "win"
      stats[team_1][:W] += 1
      stats[team_1][:P] += 3
      stats[team_2][:L] += 1
    when "draw"
      stats[team_1][:D] += 1
      stats[team_1][:P] += 1
      stats[team_2][:D] += 1
      stats[team_2][:P] += 1
    when "loss"
      stats[team_1][:L] += 1
      stats[team_2][:W] += 1
      stats[team_2][:P] += 3
    end
  end
end

class ScoreboardResults
  HEADINGS = %w[Team MP W D L P]

  attr_reader :scoreboard

  def initialize(scoreboard)
    @scoreboard = scoreboard
  end

  def results
    result = [format_row(HEADINGS)]
    rows_to_format(scoreboard).each do |row|
      result << format_row(row)
    end

    result
      .map { |row| row + "\n" }
      .join
  end

  private

  def format_row(row_values)
    [
      format_team(row_values[0]),
      format_stats_columns(row_values[1..-1])
    ].join(" | ")
  end

  def format_team(val)
    val.ljust(30)
  end

  def format_stats_columns(arr)
    arr.map { |x| x.rjust(2) }
  end

  def rows_to_format(scoreboard)
    scoreboard
      .stats
      .sort_by { |team, stats| [-stats[:P], team] }
      .map { |team, stats| [team] + stats.values.map(&:to_s) }
  end
end
