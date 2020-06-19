//
//  CollectData.swift
//  iosFinal
//
//  Created by User20 on 2020/6/19.
//  Copyright © 2020 ntou. All rights reserved.
//

import Foundation
import Combine

class CollectData: ObservableObject{
    var cancellable: AnyCancellable?
    @Published var collects = [BusRoute]()
    
    init(){
        if let data = UserDefaults.standard.data(forKey: "characters"){
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([BusRoute].self, from: data){
                collects = decodedData
            }
        }
        cancellable = $collects
            .sink(receiveValue: { (value) in
                let encoder = JSONEncoder()
                do{
                    let data = try? encoder.encode(value)
                    UserDefaults.standard.set(data, forKey: "characters")
                }
                catch{
                    
                }
            })
    }
    
}
