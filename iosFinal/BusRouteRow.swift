//
//  BusRow.swift
//  iosFinal
//
//  Created by User20 on 2020/6/17.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct BusRouteRow: View {
    @ObservedObject var collectData = CollectData()
    var busRoute: BusRoute
    var isCollect: Int{
        for nowCollect in collectData.collects.indices{
            if collectData.collects[nowCollect].RouteName.Zh_tw == busRoute.RouteName.Zh_tw{
                return 1
            }
        }
        return 0
    }
    @State private var isCollected = 0
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(busRoute.RouteName.Zh_tw)
                Text(busRoute.DepartureStopNameZh + "-" + busRoute.DestinationStopNameZh)
            }
            Spacer()
            if isCollect == 0{
                if isCollected == 0{
                    Image(systemName: "star")
                    .onTapGesture {
                        self.isCollected = 1
                        let tmp = BusRoute(RouteName: self.busRoute.RouteName, DepartureStopNameZh: self.busRoute.DepartureStopNameZh,
                                           DestinationStopNameZh: self.busRoute.DestinationStopNameZh)
                        self.collectData.collects.insert(tmp, at: 0)
                    }
                }else{
                    Image(systemName: "star.fill")
                    .onTapGesture {
                        self.isCollected = 0
                    }
                }
            }
            else{
                if isCollected == 0{
                    Image(systemName: "star")
                    .onTapGesture {
                        self.isCollected = 1
                        let tmp = BusRoute(RouteName: self.busRoute.RouteName, DepartureStopNameZh: self.busRoute.DepartureStopNameZh,
                                           DestinationStopNameZh: self.busRoute.DestinationStopNameZh)
                        self.collectData.collects.insert(tmp, at: 0)
                    }
                }else{
                    Image(systemName: "star.fill")
                    .onTapGesture {
                        self.isCollected = 0
                    }
                }
            }
        }
        
    }
}

struct BusRouteRow_Previews: PreviewProvider {
    static var previews: some View {
        BusRouteRow(collectData: CollectData(), busRoute: BusRoute(RouteName: RouteName(Zh_tw: "104"), DepartureStopNameZh: "a", DestinationStopNameZh: "b"))
    }
}
