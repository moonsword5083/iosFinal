//
//  CollectList.swift
//  iosFinal
//
//  Created by User20 on 2020/6/19.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct CollectList: View {
    @ObservedObject var collectData = CollectData()
    @ObservedObject var busData = BusData()
    @State private var showEditCollect = false
    @State private var showAlert = false
    @State private var searchText = ""
    var filterWords: [BusRoute] {
        return collectData.collects.filter({searchText.isEmpty ? true : $0.RouteName.Zh_tw.contains(searchText)})
       }
    var body: some View {
        NavigationView{
            List{
                SearchBar(text: $searchText)
                ForEach(filterWords){(collect) in
                    NavigationLink(destination: BusDetail(busRoute: collect, busData: self.busData)){
                        BusRouteRow(collectData: self.collectData, busRoute: collect)
                    }
                }
                .onMove { (indexSet, index) in
                    self.collectData.collects.move(fromOffsets: indexSet,
                                    toOffset: index)
                }
                .onDelete{(indexSet) in
                    self.collectData.collects.remove(atOffsets: indexSet)
                }
            }
            .navigationBarItems(leading: EditButton())
            .navigationBarTitle("收藏公車路線")
        }
    }
}

struct CollectList_Previews: PreviewProvider {
    static var previews: some View {
        CollectList(collectData: CollectData())
    }
}
