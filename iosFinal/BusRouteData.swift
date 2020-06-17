//
//  BusRouteData.swift
//  iosFinal
//
//  Created by User20 on 2020/6/17.
//  Copyright © 2020 ntou. All rights reserved.
//

import Foundation
import CryptoKit

class BusRouteData: ObservableObject {
    @Published var busRoute = [BusRoute]()
    
    func getTimeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ww zzz"
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        let time = dateFormatter.string(from: Date())
        return time
    }
    
    func fetchStation(){
        let query = "https://ptx.transportdata.tw/MOTC/v2/Bus/Route/City/Keelung?$format=JSON"
        if let urlStr = query.addingPercentEncoding(withAllowedCharacters:
            .urlQueryAllowed){
            if let url = URL(string: urlStr) {
                let appID = "0afaa34f53a94610ab6afafa6b4d6840"
                let appKey = "ZZY2IcvWCT-s6MRXtXpUlQpwIjc"
                let xdate = getTimeString()
                let signDate = "x-date: \(xdate)"
                let key = SymmetricKey(data: Data(appKey.utf8))
                let hmac = HMAC<SHA256>.authenticationCode(for: Data(signDate.utf8), using: key)
                let base64HmacString = Data(hmac).base64EncodedString()
                let authorization = """
                hmac username="\(appID)", algorithm="hmac-sha256", headers="x-date", signature="\(base64HmacString)"
                """
                var request = URLRequest(url: url)
                request.setValue(xdate, forHTTPHeaderField: "x-date")
                request.setValue(authorization, forHTTPHeaderField: "Authorization")
                request.setValue("gzip", forHTTPHeaderField: "Accept-Encoding")//減少傳輸量
                URLSession.shared.dataTask(with: request) { (data, response, error) in
                    let decoder = JSONDecoder()
                    if let data = data, let stationResults = try? decoder.decode([BusRoute].self, from: data) {
                        self.busRoute = stationResults
                    }
                    else{
                        print("error")
                    }
                }.resume()
            }
        }
        
    }
}
