import Foundation

// MARK: - Welcome4
struct TeamPlayersResponse : Codable {
    let success: Int
    let players: [Player]
}

// MARK: - Result
struct Player :Codable{
    let playerKey: Int
    let playerName: String
    let playerNumber, playerCountry: String?
    let playerType: PlayerType
    let playerAge, playerMatchPlayed, playerGoals, playerYellowCards: String?
    let playerRedCards, playerMinutes: String?
    let playerInjured: PlayerInjured
    let playerSubstituteOut, playerSubstitutesOnBench, playerAssists: String?
    let playerIsCaptain: String
    let playerShotsTotal, playerGoalsConceded, playerFoulsCommited, playerTackles: String?
    let playerBlocks, playerCrossesTotal, playerInterceptions, playerClearances: String?
    let playerDispossesed, playerSaves, playerInsideBoxSaves, playerDuelsTotal: String?
    let playerDuelsWon, playerDribbleAttempts, playerDribbleSucc, playerPenComm: String?
    let playerPenWon, playerPenScored, playerPenMissed, playerPasses: String?
    let playerPassesAccuracy, playerKeyPasses, playerWoordworks, playerRating: String?
    let teamName: TeamName
    let teamKey: Int
    let playerImage: String?
}

enum PlayerInjured :Codable {
    case no
    case yes
}

enum PlayerType :Codable{
    case coach
    case defenders
    case forwards
    case goalkeepers
    case midfielders
}

enum TeamName :Codable{
    case juventus
}
