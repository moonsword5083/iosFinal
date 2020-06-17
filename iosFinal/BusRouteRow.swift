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
        Text(busRoute.RouteName.Zh_tw)
        /*VStack{
            Text(bus.RouteName.Zh_tw)
            Text("Direction: \(bus.Direction)")
            Text("StopStatus: \(bus.StopStatus)")
            if(bus.EstimateTime != nil){
                Text("\((bus.EstimateTime ?? 0) / 60)min" )
            }
            Text(bus.StopName.Zh_tw)
        }*/
    }
}

struct BusRouteRow_Previews: PreviewProvider {
    static var previews: some View {
        BusRouteRow(busRoute: BusRoute(RouteName: RouteName(Zh_tw: "104")))
    }
}
