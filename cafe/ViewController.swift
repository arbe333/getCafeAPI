import UIKit
import Foundation

struct Cafe: Decodable {
    var id: String?
    var name: String?
    var city: String?
    var wifi: Float?
    var seat: Float?
    var quiet: Float?
    var tasty: Float?
    var cheap: Float?
    var music: Float?
    var url: String?
    var address: String?
    var latitude: String?
    var longitude: String?
    var limited_time: String?
    var socket: String?
    var standing_desk: String?
    var mrt: String?
    var open_time: String?
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlStr = "https://cafenomad.tw/api/v1.2/cafes"
        if let url = URL(string: urlStr) {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let task = URLSession.shared.dataTask(with: url) { (data, responce, error) in
                if let data = data {
                    do {
                        let searchResult = try decoder.decode([Cafe].self, from: data)
                        print(searchResult[0].name!)
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
}
