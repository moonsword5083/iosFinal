//
//  BusList.swift
//  iosFinal
//
//  Created by User20 on 2020/6/17.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct BusList: View{
    @EnvironmentObject var collectData: CollectData
    @EnvironmentObject var busRouteData: BusRouteData
    @EnvironmentObject var busData: BusData
    @State private var searchText = ""
    var filterWords: [BusRoute] {
        return busRouteData.busRoute.filter({searchText.isEmpty ? true : $0.RouteName.Zh_tw.contains(searchText)})
       }
    var body: some View {
        NavigationView{
            List{
                SearchBar(text: $searchText)
                ForEach(filterWords){(route) in
                    NavigationLink(destination: BusDetail(busRoute: route)){
                        BusRouteRow(busRoute: route)
                    }
                }
            }
            /*List(busRouteData.busRoute, rowContent: { (index) in
                NavigationLink(destination: BusDetail(busRoute: index, busData: self.busData)) {
                    BusRouteRow(collectData: self.collectData, busRoute: index)
                }
            })*/
            .onAppear {
                self.busRouteData.fetchStation()
            }
            .navigationBarTitle(Text(NSLocalizedString("公車路線", comment: "")))
        }
    }
}

struct BusList_Previews: PreviewProvider {
    static var previews: some View {
        BusList()
    }
}
