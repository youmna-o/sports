import UIKit

class LeaguesDetailsPresenter {
    weak var myCollection : DetailsCollectionViewController!
    
    func attachTableView(collectionView: DetailsCollectionViewController){
        myCollection = collectionView
    }
    
    func getDataFromModel(sportType: String, leaguesKey: String) {
        NetworkService.fetchLeaguesDetails(sportType: sportType, leaguesKey: leaguesKey) { [weak self] res in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch sportType {
                case "football":
                    if let footballResult = res as? LeaguesDetailsResponse {
                        self.myCollection?.renderFootball(result: footballResult)
                    }
                case "cricket":
                    if let cricketResult = res as? CricketResponse {
                        self.myCollection?.renderCricket(result: cricketResult)
                    }
                case "basketball":
                    if let basketResult = res as? BasketballResponse {
                        self.myCollection?.renderBasketball(result: basketResult)
                    }
                default:
                    print("Unsupported sport type: \(sportType)")
                }
            }
        }
    }
}
