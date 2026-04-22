module Tournament
  require 'ostruct'
  HEADER = 'Team                           | MP |  W |  D |  L |  P'
  ENTRY = '%-31<name>s|%3<matches_played>p |%3<wins>p |%3<draws>p |%3<losses>p |%3<points>p'

  def self.get_teams(matches)
    teams = matches.each_with_object([]) do |line_entries, teams|
      teams << line_entries[0]
      teams << line_entries[1]
    end
    teams.uniq.sort.reverse

  end

  def self.points(wins, draws)
    3 * wins + draws

  end
  
  def self.tally(match_list)
    output = HEADER + "\n"
    matches = match_list.split("\n").select { |a_match| a_match != '' }
    if matches != [] then
      matches = matches.map { |a_match| a_match.split(';')}
      teams = get_teams(matches)
      matches_played = {}
      team_attributes = teams.each_with_object([]) { |team, team_attributes|
        team_attributes << {
          name: team,
          matches_played: matches.flatten.count { |a_team| a_team == team },
          wins: matches.count { |a_match|
            a_match[0] == team && a_match[2] == 'win' || (a_match[1] == team && a_match[2] == 'loss')
          },
          draws: matches.count { |a_match|
            a_match.include?(team) && a_match[2] == 'draw'
          },
          losses: matches.count { |a_match|
            a_match[1] == team && a_match[2] == 'win' || (a_match[0] == team && a_match[2] == 'loss')
          }
        }
      }
      team_attributes = team_attributes.map{ |attribute_set|
        {**attribute_set, points: points(attribute_set[:wins], attribute_set[:draws])}
      }.map { |new_attribute_set| OpenStruct.new(new_attribute_set)}.
       sort_by(&:points).reverse
      team_attributes.each { |attribute_set|
        output << ENTRY % {name: attribute_set.name, matches_played: attribute_set.matches_played, wins: attribute_set.wins, draws: attribute_set.draws, losses: attribute_set.losses, points: attribute_set.points} + "\n"
      }
    end
    output
  end

end
