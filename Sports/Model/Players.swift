/* 
Copyright (c) 2025 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Players : Codable {
	let player_player_key : Int?
	let player_image : String?
	let player_name : String?
	let player_number : String?
	let player_country : String?
	let player_type : String?
	let player_age : String?
	let player_match_played : String?
	let player_goals : String?
	let player_yellow_cards : String?
	let player_red_cards : String?
	let player_injured : String?
	let player_substitute_out : String?
	let player_substitutes_on_bench : String?
	let player_assists : String?
	let player_birthdate : String?
	let player_is_captain : String?
	let player_shots_total : String?
	let player_goals_conceded : String?
	let player_fouls_committed : String?
	let player_tackles : String?
	let player_blocks : String?
	let player_crosses_total : String?
	let player_interceptions : String?
	let player_clearances : String?
	let player_dispossesed : String?
	let player_saves : String?
	let player_inside_box_saves : String?
	let player_duels_total : String?
	let player_duels_won : String?
	let player_dribble_attempts : String?
	let player_dribble_succ : String?
	let player_pen_comm : String?
	let player_pen_won : String?
	let player_pen_scored : String?
	let player_pen_missed : String?
	let player_passes : String?
	let player_passes_accuracy : String?
	let player_player_key_passes_passes : String?
	let player_woordworks : String?
	let player_rating : String?

    enum CodingKeys: String, CodingKey {

		case player_key = "player_key"
		case player_image = "player_image"
		case player_name = "player_name"
		case player_number = "player_number"
		case player_country = "player_country"
		case player_type = "player_type"
		case player_age = "player_age"
		case player_match_played = "player_match_played"
		case player_goals = "player_goals"
		case player_yellow_cards = "player_yellow_cards"
		case player_red_cards = "player_red_cards"
		case player_injured = "player_injured"
		case player_substitute_out = "player_substitute_out"
		case player_substitutes_on_bench = "player_substitutes_on_bench"
		case player_assists = "player_assists"
		case player_birthdate = "player_birthdate"
		case player_is_captain = "player_is_captain"
		case player_shots_total = "player_shots_total"
		case player_goals_conceded = "player_goals_conceded"
		case player_fouls_committed = "player_fouls_committed"
		case player_tackles = "player_tackles"
		case player_blocks = "player_blocks"
		case player_crosses_total = "player_crosses_total"
		case player_interceptions = "player_interceptions"
		case player_clearances = "player_clearances"
		case player_dispossesed = "player_dispossesed"
		case player_saves = "player_saves"
		case player_inside_box_saves = "player_inside_box_saves"
		case player_duels_total = "player_duels_total"
		case player_duels_won = "player_duels_won"
		case player_dribble_attempts = "player_dribble_attempts"
		case player_dribble_succ = "player_dribble_succ"
		case player_pen_comm = "player_pen_comm"
		case player_pen_won = "player_pen_won"
		case player_pen_scored = "player_pen_scored"
		case player_pen_missed = "player_pen_missed"
		case player_passes = "player_passes"
		case player_passes_accuracy = "player_passes_accuracy"
		case player_key_passes = "player_key_passes"
		case player_woordworks = "player_woordworks"
		case player_rating = "player_rating"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		player_key = try values.decodeIfPresent(Int.self, forKey: .player_key)
		player_image = try values.decodeIfPresent(String.self, forKey: .player_image)
		player_name = try values.decodeIfPresent(String.self, forKey: .player_name)
		player_number = try values.decodeIfPresent(String.self, forKey: .player_number)
		player_country = try values.decodeIfPresent(String.self, forKey: .player_country)
		player_type = try values.decodeIfPresent(String.self, forKey: .player_type)
		player_age = try values.decodeIfPresent(String.self, forKey: .player_age)
		player_match_played = try values.decodeIfPresent(String.self, forKey: .player_match_played)
		player_goals = try values.decodeIfPresent(String.self, forKey: .player_goals)
		player_yellow_cards = try values.decodeIfPresent(String.self, forKey: .player_yellow_cards)
		player_red_cards = try values.decodeIfPresent(String.self, forKey: .player_red_cards)
		player_injured = try values.decodeIfPresent(String.self, forKey: .player_injured)
		player_substitute_out = try values.decodeIfPresent(String.self, forKey: .player_substitute_out)
		player_substitutes_on_bench = try values.decodeIfPresent(String.self, forKey: .player_substitutes_on_bench)
		player_assists = try values.decodeIfPresent(String.self, forKey: .player_assists)
		player_birthdate = try values.decodeIfPresent(String.self, forKey: .player_birthdate)
		player_is_captain = try values.decodeIfPresent(String.self, forKey: .player_is_captain)
		player_shots_total = try values.decodeIfPresent(String.self, forKey: .player_shots_total)
		player_goals_conceded = try values.decodeIfPresent(String.self, forKey: .player_goals_conceded)
		player_fouls_committed = try values.decodeIfPresent(String.self, forKey: .player_fouls_committed)
		player_tackles = try values.decodeIfPresent(String.self, forKey: .player_tackles)
		player_blocks = try values.decodeIfPresent(String.self, forKey: .player_blocks)
		player_crosses_total = try values.decodeIfPresent(String.self, forKey: .player_crosses_total)
		player_interceptions = try values.decodeIfPresent(String.self, forKey: .player_interceptions)
		player_clearances = try values.decodeIfPresent(String.self, forKey: .player_clearances)
		player_dispossesed = try values.decodeIfPresent(String.self, forKey: .player_dispossesed)
		player_saves = try values.decodeIfPresent(String.self, forKey: .player_saves)
		player_inside_box_saves = try values.decodeIfPresent(String.self, forKey: .player_inside_box_saves)
		player_duels_total = try values.decodeIfPresent(String.self, forKey: .player_duels_total)
		player_duels_won = try values.decodeIfPresent(String.self, forKey: .player_duels_won)
		player_dribble_attempts = try values.decodeIfPresent(String.self, forKey: .player_dribble_attempts)
		player_dribble_succ = try values.decodeIfPresent(String.self, forKey: .player_dribble_succ)
		player_pen_comm = try values.decodeIfPresent(String.self, forKey: .player_pen_comm)
		player_pen_won = try values.decodeIfPresent(String.self, forKey: .player_pen_won)
		player_pen_scored = try values.decodeIfPresent(String.self, forKey: .player_pen_scored)
		player_pen_missed = try values.decodeIfPresent(String.self, forKey: .player_pen_missed)
		player_passes = try values.decodeIfPresent(String.self, forKey: .player_passes)
		player_passes_accuracy = try values.decodeIfPresent(String.self, forKey: .player_passes_accuracy)
		player_key_passes = try values.decodeIfPresent(String.self, forKey: .player_key_passes)
		player_woordworks = try values.decodeIfPresent(String.self, forKey: .player_woordworks)
		player_rating = try values.decodeIfPresent(String.self, forKey: .player_rating)
	}

}
