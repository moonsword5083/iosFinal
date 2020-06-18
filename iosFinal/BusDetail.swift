//
//  BusDetail.swift
//  iosFinal
//
//  Created by User20 on 2020/6/17.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct BusDetail: View {
    var busRoute: BusRoute
    @ObservedObject var busData = BusData()
    @State private var tmp = [Bus]()
    @State private var direct = 0
    var directs = [0, 1]
    var body: some View {
        VStack{
            Picker(selection: self.$direct, label: Text("方向")){
                ForEach(0..<2){(index) in
                    if index == 0{
                        Text("往" + self.busRoute.DestinationStopNameZh)
                    }else{
                        Text("往" + self.busRoute.DepartureStopNameZh)
                    }
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .navigationBarTitle(self.busRoute.RouteName.Zh_tw)
            if direct == 0{
                List{
                    ForEach(busData.bus.indices){(index) in
                        if self.busRoute.RouteName.Zh_tw == self.busData.bus[index].RouteName.Zh_tw && self.busData.bus[index].Direction == 0{
                            BusRow(bus: self.busData.bus[index])
                        }
                    }
                }
                .onAppear {
                    self.busData.fetchStation()
                }
            }else{
                List{
                    ForEach(busData.bus.indices){(index) in
                        if self.busRoute.RouteName.Zh_tw == self.busData.bus[index].RouteName.Zh_tw && self.busData.bus[index].Direction == 1{
                            BusRow(bus: self.busData.bus[index])
                        }
                    }
                }
                .onAppear {
                    self.busData.fetchStation()
                }
            }
        }
    }
}

struct BusDetail_Previews: PreviewProvider {
    static var previews: some View {
        BusDetail(busRoute: BusRoute(RouteName: RouteName(Zh_tw: "104"), DepartureStopNameZh: "a",
        DestinationStopNameZh: "b"), busData: BusData())
    }
}
