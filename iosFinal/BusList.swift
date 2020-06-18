//
//  BusList.swift
//  iosFinal
//
//  Created by User20 on 2020/6/17.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI


struct BusList: View {
    @ObservedObject var busRouteData = BusRouteData()
    @ObservedObject var busData = BusData()
    var body: some View {
        NavigationView{
            List(busRouteData.busRoute, rowContent: { (index) in
                NavigationLink(destination: BusDetail(busRoute: index, busData: self.busData)) {
                    BusRouteRow(busRoute: index)
                }
            })
            .onAppear {
                self.busRouteData.fetchStation()
            }
            .navigationBarTitle(Text("公車路線"))
        }
    }
}

struct BusList_Previews: PreviewProvider {
    static var previews: some View {
        BusList(busRouteData: BusRouteData(), busData: BusData())
    }
}
