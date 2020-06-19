//
//  ContentView.swift
//  iosFinal
//
//  Created by User20 on 2020/6/17.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var busRouteData = BusRouteData()
    @ObservedObject var busData = BusData()
    @ObservedObject var collectData = CollectData()
    var body: some View {
        TabView{
            BusList(collectData: self.collectData,busRouteData: self.busRouteData, busData: self.busData)
                .tabItem{
                    Image(systemName: "car")
                    Text("公車路線")
            }
            CollectList(collectData: self.collectData, busData: self.busData)
                .tabItem{
                    Image(systemName: "star")
                    Text("我的最愛")
            }
            ImageView()
                .tabItem{
                    Image(systemName: "camera")
                    Text("照片牆")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
