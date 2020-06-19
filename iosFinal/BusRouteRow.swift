//
//  BusRow.swift
//  iosFinal
//
//  Created by User20 on 2020/6/17.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct BusRouteRow: View {
    @EnvironmentObject var collectData: CollectData
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
    var lan = Bundle.main.preferredLocalizations.first
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                if lan == "en"{
                    Text(busRoute.RouteName.En)
                    Text(busRoute.DepartureStopNameEn + "-" + busRoute.DestinationStopNameEn)
                }else{
                    Text(busRoute.RouteName.Zh_tw)
                    Text(busRoute.DepartureStopNameZh + "-" + busRoute.DestinationStopNameZh)
                }
            }
            Spacer()
            if isCollected == 0{
                if isCollect == 0{
                    Image(systemName: "star")
                    .onTapGesture {
                        self.isCollected = 1
                        let tmp = BusRoute(RouteName: self.busRoute.RouteName, DepartureStopNameZh: self.busRoute.DepartureStopNameZh, DepartureStopNameEn: self.busRoute.DepartureStopNameEn,
                                           DestinationStopNameZh: self.busRoute.DestinationStopNameZh, DestinationStopNameEn: self.busRoute.DestinationStopNameEn)
                        self.collectData.collects.insert(tmp, at: 0)
                    }
                }else{
                    Image(systemName: "star.fill")
                    .onTapGesture {
                        self.isCollected = 1
                        let index = self.collectData.collects.firstIndex{
                            $0.RouteName.Zh_tw == self.busRoute.RouteName.Zh_tw
                        }!
                        self.collectData.collects.remove(at: index)
                    }
                }
            }
            else{
                if isCollect == 1{
                    Image(systemName: "star.fill")
                    .onTapGesture {
                        self.isCollected = 0
                        let index = self.collectData.collects.firstIndex{
                            $0.RouteName.Zh_tw == self.busRoute.RouteName.Zh_tw
                        }!
                        self.collectData.collects.remove(at: index)
                    }
                }else{
                    Image(systemName: "star")
                    .onTapGesture {
                        self.isCollected = 0
                        let tmp = BusRoute(RouteName: self.busRoute.RouteName, DepartureStopNameZh: self.busRoute.DepartureStopNameZh, DepartureStopNameEn: self.busRoute.DepartureStopNameEn,
                                           DestinationStopNameZh: self.busRoute.DestinationStopNameZh, DestinationStopNameEn: self.busRoute.DestinationStopNameEn)
                        self.collectData.collects.insert(tmp, at: 0)
                    }
                }
            }
        }
    }
}

struct BusRouteRow_Previews: PreviewProvider {
    static var previews: some View {
        BusRouteRow(busRoute: BusRoute(RouteName: RouteName(Zh_tw: "104", En: "104"), DepartureStopNameZh: "a", DepartureStopNameEn: "a", DestinationStopNameZh: "b", DestinationStopNameEn: "b"))
    }
}
