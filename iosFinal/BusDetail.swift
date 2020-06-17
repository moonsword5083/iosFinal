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
    var body: some View {
        /*ForEach(busData.bus.indices, id: \.self){ (index) in
            
                Text("a")
        }*/
        List(busData.bus.indices, id: \.self) { (index) in
            if self.busRoute.RouteName.Zh_tw == self.busData.bus[index].RouteName.Zh_tw{
                BusRow(bus: self.busData.bus[index])
            }
        }
        .onAppear {
            self.busData.fetchStation()
        }
    }
}

struct BusDetail_Previews: PreviewProvider {
    static var previews: some View {
        BusDetail(busRoute: BusRoute(RouteName: RouteName(Zh_tw: "104")), busData: BusData())
    }
}
