//
//  CollectList.swift
//  iosFinal
//
//  Created by User20 on 2020/6/19.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct CollectList: View {
    @EnvironmentObject var collectData: CollectData
    @EnvironmentObject var busData: BusData
    @State private var showEditCollect = false
    @State private var showAlert = false
    @State private var searchText = ""
    var lan = Bundle.main.preferredLocalizations.first
    var filterWordsEn: [BusRoute] {
     return collectData.collects.filter({searchText.isEmpty ? true : $0.RouteName.En.contains(searchText)})
    }
    var filterWordsZh: [BusRoute] {
     return collectData.collects.filter({searchText.isEmpty ? true : $0.RouteName.Zh_tw.contains(searchText)})
    }
    var body: some View {
        NavigationView{
            List{
                SearchBar(text: $searchText)
                if self.lan == "en"{
                    ForEach(filterWordsEn){(collect) in
                        NavigationLink(destination: BusDetail(busRoute: collect)){
                            BusRouteRow(busRoute: collect)
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
                else{
                    ForEach(filterWordsZh){(collect) in
                        NavigationLink(destination: BusDetail(busRoute: collect)){
                            BusRouteRow(busRoute: collect)
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
            }
            .navigationBarItems(leading: EditButton())
            .navigationBarTitle(NSLocalizedString("收藏公車路線", comment: ""))
        }
    }
}

struct CollectList_Previews: PreviewProvider {
    static var previews: some View {
        CollectList()
    }
}
