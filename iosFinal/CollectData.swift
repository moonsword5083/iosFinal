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
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let url = documentsDirectory.appendingPathComponent("collectBus")
        
        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([BusRoute].self, from: data) {
                collects = decodedData
            }
        }
        
        cancellable = $collects
            .sink { (value) in
                let encoder = JSONEncoder()
                do {
                    let data = try encoder.encode(value)
                    try? data.write(to: url)
                } catch {
                    
                }
        }
    }
}
