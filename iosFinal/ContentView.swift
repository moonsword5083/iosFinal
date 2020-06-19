//
//  ContentView.swift
//  iosFinal
//
//  Created by User20 on 2020/6/17.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var busRouteData = BusRouteData()
    var busData = BusData()
    var collectData = CollectData()
    var body: some View {
        TabView{
            BusList()
                .tabItem{
                    Image(systemName: "car")
                    Text(NSLocalizedString("公車路線", comment: ""))
            }
            CollectList()
                .tabItem{
                    Image(systemName: "star")
                    Text(NSLocalizedString("我的最愛", comment: ""))
            }
            VideoView()
                .tabItem{
                    Image(systemName: "video")
                    Text(NSLocalizedString("相關影片", comment: ""))
            }
            ImageView()
                .tabItem{
                    Image(systemName: "list.bullet")
                    Text(NSLocalizedString("附錄", comment: ""))
            }
        }
        .environmentObject(busData)
        .environmentObject(busRouteData)
        .environmentObject(collectData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
