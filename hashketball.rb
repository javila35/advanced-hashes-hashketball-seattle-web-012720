require 'pry'

def game_hash
    hash = {
        :home => {
            :team_name => "Brooklyn Nets",
            :colors => ["Black", "White"],
            :players => [
                {
                :player_name => "Alan Anderson",
                :number => 0,
                :shoe => 16,
                :points => 22,
                :rebounds => 12,
                :assists => 12,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 1
                },
                {
                :player_name => "Reggie Evans",
                :number => 30,
                :shoe => 14,
                :points => 12,
                :rebounds => 12,
                :assists => 12,
                :steals =>12,
                :blocks => 12,
                :slam_dunks => 7
                },{
                :player_name => "Brook Lopez",
                :number => 11,
                :shoe => 17,
                :points => 17,
                :rebounds => 19,
                :assists => 10,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 15
                },{
                :player_name => "Mason Plumlee",
                :number => 1,
                :shoe => 19,
                :points => 26,
                :rebounds => 11,
                :assists => 6, 
                :steals => 3,
                :blocks => 8,
                :slam_dunks => 5
                },{
                :player_name => "Jason Terry",
                :number => 31,
                :shoe => 15,
                :points => 19,
                :rebounds => 2,
                :assists => 2,
                :steals => 4,
                :blocks => 11,
                :slam_dunks => 1
                }
            ]
        },
        :away => {
            :team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            :players => [
                {
                :player_name => "Jeff Adrien",
                :number => 4,
                :shoe => 18,
                :points => 10,
                :rebounds => 1,
                :assists => 1,
                :steals => 2,
                :blocks => 7,
                :slam_dunks => 2
                },
                {
                :player_name => "Bismack Biyombo",
                :number => 0,
                :shoe => 16,
                :points => 12,
                :rebounds => 4,
                :assists => 7,
                :steals => 22,
                :blocks => 15,
                :slam_dunks => 10
                },{
                :player_name => "DeSagna Diop",
                :number => 2,
                :shoe => 14,
                :points => 24,
                :rebounds => 12,
                :assists => 12,
                :steals => 4,
                :blocks => 5,
                :slam_dunks => 5
                },{
                :player_name => "Ben Gordon",
                :number => 8,
                :shoe => 15,
                :points => 33,
                :rebounds => 3,
                :assists => 2,
                :steals => 1,
                :blocks => 1,
                :slam_dunks => 0
                },{
                :player_name => "Kemba Walker",
                :number => 33,
                :shoe => 15,
                :points => 6,
                :rebounds => 12,
                :assists => 12,
                :steals => 7,
                :blocks => 5,
                :slam_dunks => 12
                }
                ]
        }
    }
end

def get_player_details(name, attribute)
    game_hash.each do |teams, team_hash|
      team_hash[:players].each do |player_details|
        return player_details[attribute] if player_details[:player_name].include?(name)
      end
    end 
    false
  end 

def num_points_scored(name)
  get_player_details(name, :points)
end 

def shoe_size(name)
  get_player_details(name, :shoe)
end

def get_team_attributes(team, attribute)
  game_hash.each do |teams, team_hash|
    return team_hash[attribute] if team_hash[:team_name].include?(team) 
  end
end

def team_colors(team)
  get_team_attributes(team, :colors)
end

def team_names
  game_hash.each.map {|k,v| v[:team_name]}
end

def player_numbers(team)
  game_hash.each do |teams, team_hash|
    return team_hash[:players].each.map {|v| v[:number]} if team_hash[:team_name].include?(team)
    end
end 

def player_stats(name)
  game_hash.each do |teams, teams_hash|
    teams_hash[:players].each do |players|
      return players.tap {|v| v.delete(:player_name)} if players[:player_name].include?(name)
    end 
  end
end 

def get_players
  game_hash.each.map {|k,v| v[:players]}.flatten
end

def big_shoe_rebounds
  array = get_players
  (array.sort_by {|v| v[:shoe]}.last) [:rebounds]
end 

def most_points_scored
  array = get_players
  (array.sort_by {|v| v[:points]}.last) [:player_name]
end 

def get_team_points(team_hash)
  team_hash[:players].map {|v| v[:points]}.inject(0) {|sum,x| sum + x}
end 

def winning_team 
  hash = game_hash
  home = get_team_points(hash[:home])
  away = get_team_points(hash[:away])
  return (home > away) ? hash[:home][:team_name] : hash[:away][:team_name]
end 