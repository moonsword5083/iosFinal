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
                    if((bus.EstimateTime ?? 0) < 120){
                        Text(NSLocalizedString("進站中", comment: ""))
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.red)
                            .cornerRadius(35)
                    }else if((bus.EstimateTime ?? 0) < 180){
                        Text("\((bus.EstimateTime ?? 0) / 60)min")
                            .padding()
                            .foregroundColor(Color.red)
                            .background(Color(red: 1.0, green: 0.0, blue: 0.0, opacity: 0.35))
                            .cornerRadius(35)
                    }else{
                        Text("\((bus.EstimateTime ?? 0) / 60)min")
                            .padding()
                            .foregroundColor(Color.black)
                            .background(Color(hue: 0.682, saturation: 1.0, brightness: 1.0, opacity: 0.04))
                            .cornerRadius(35)
                    }
                }
            }else{
                Text(NSLocalizedString("未發車", comment: ""))
                    .padding()
                    .foregroundColor(Color.black)
                    .background(Color(hue: 0.682, saturation: 1.0, brightness: 1.0, opacity: 0.04))
                    .cornerRadius(35)
            }
            if(bus.EstimateTime != nil && (bus.EstimateTime ?? 0) < 120){
                if self.lan == "en"{
                    Text(bus.StopName.En)
                        .font(.headline)
                }else{
                    Text(bus.StopName.Zh_tw)
                        .font(.headline)
                }
            }else{
                if self.lan == "en"{
                    Text(bus.StopName.En)
                }else{
                    Text(bus.StopName.Zh_tw)
                }
            }
        }
    }
}

struct BusRow_Previews: PreviewProvider {
    static var previews: some View {
        BusRow(bus: Bus(RouteName: RouteName(Zh_tw: "104", En: "104"), Direction: 0, EstimateTime: 100, StopStatus: 0, StopName: StopName(Zh_tw: "102", En: "102")))
    }
}
