//
//  Data.swift
//  iosFinal
//
//  Created by User20 on 2020/6/17.
//  Copyright © 2020 ntou. All rights reserved.
//

import Foundation

struct Bus: Codable, Identifiable{
    let id = UUID()
    var RouteName: RouteName
    var Direction: Int
    var EstimateTime: Int?
    var StopStatus: Int
    var StopName: StopName
}

struct RouteName: Codable {
    var Zh_tw: String
}

struct StopName: Codable {
    var Zh_tw: String
}

struct BusRoute: Codable ,Identifiable{
    let id = UUID()
    var RouteName: RouteName
}
