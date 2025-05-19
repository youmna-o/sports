/* 
Copyright (c) 2025 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct TeamDetails : Codable {
	let team_team_key : Int?
	let team_name : String?
	let team_logo : String?
	let players : [Players]?
	let coaches : [Coaches]?

	enum CodingKeys: String, CodingKey {

		case team_key = "team_key"
		case team_name = "team_name"
		case team_logo = "team_logo"
		case players = "players"
		case coaches = "coaches"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		team_key = try values.decodeIfPresent(Int.self, forKey: .team_key)
		team_name = try values.decodeIfPresent(String.self, forKey: .team_name)
		team_logo = try values.decodeIfPresent(String.self, forKey: .team_logo)
		players = try values.decodeIfPresent([Players].self, forKey: .players)
		coaches = try values.decodeIfPresent([Coaches].self, forKey: .coaches)
	}

}
