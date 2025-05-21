import UIKit

class LeaguesDetailsPresenter {
    
    let coreObj = MyCoreDataServices.shared
    
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
                case "tennis":
                    if let tennisResult = res as? TennisResponse {
                        self.myCollection?.renderTennis(result: tennisResult)
                    }
                default:
                    print("Unsupported sport type: \(sportType)")
                }
            }
        }
    }
    func addDataToModel(name:String , image:String,key :String, sportType:String){
        coreObj.addLeague(name: name,image: image,key : key,sportType: sportType)
    }
//    func getDataFromModel(){
//        coreObj.getLeague{  obj in
//            print("recived********")}
//    }
}
