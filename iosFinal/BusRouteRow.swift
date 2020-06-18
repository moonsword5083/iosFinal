//
//  BusRow.swift
//  iosFinal
//
//  Created by User20 on 2020/6/17.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct BusRouteRow: View {
    var busRoute: BusRoute
    var body: some View {
        VStack(alignment: .leading){
            Text(busRoute.RouteName.Zh_tw)
            Text(busRoute.DepartureStopNameZh + "-" + busRoute.DestinationStopNameZh)
        }
    }
}

struct BusRouteRow_Previews: PreviewProvider {
    static var previews: some View {
        BusRouteRow(busRoute: BusRoute(RouteName: RouteName(Zh_tw: "104"), DepartureStopNameZh: "a",
        DestinationStopNameZh: "b"))
    }
}
