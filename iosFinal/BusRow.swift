//
//  BusRow.swift
//  iosFinal
//
//  Created by User20 on 2020/6/17.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct BusRow: View {
    var bus: Bus
    var lan = Bundle.main.preferredLocalizations.first
    var body: some View {
        HStack{
            if bus.StopStatus == 0{
                if(bus.EstimateTime != nil){
                    if((bus.EstimateTime ?? 0) < 180){
                        Text(NSLocalizedString("進站中", comment: ""))
                    }else{
                        Text("\((bus.EstimateTime ?? 0) / 60)min")
                    }
                }
            }else{
                Text(NSLocalizedString("未發車", comment: ""))
            }
            if self.lan == "en"{
                Text(bus.StopName.En)
            }else{
                Text(bus.StopName.Zh_tw)
            }
        }
    }
}

struct BusRow_Previews: PreviewProvider {
    static var previews: some View {
        BusRow(bus: Bus(RouteName: RouteName(Zh_tw: "104", En: "104"), Direction: 0, EstimateTime: 100, StopStatus: 0, StopName: StopName(Zh_tw: "102", En: "102")))
    }
}
