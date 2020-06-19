//
//  ImageView.swift
//  iosFinal
//
//  Created by User20 on 2020/6/18.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct ImageView: View {
    @State private var scale: [CGFloat] = [1, 1, 1, 1, 1]
    @State private var isBig = 0
    var body: some View {
        NavigationView{
            List{
                KFImage(URL(string: "https://mini.eastday.com/game/imgfile/dfgame/202004/22/1587520523_6.jpg")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350)
                    .clipped()
                    .scaleEffect(scale[0])
                    .onLongPressGesture{
                        if self.isBig == 0{
                            self.scale[0] *= 1.2
                            self.isBig = 1
                        }
                        else{
                            self.scale[0] = 1
                            self.isBig = 0
                        }
                    }
                    .animation(.easeInOut(duration: 3))
                KFImage(URL(string: "https://img.nga.178.com/attachments/mon_202005/10/-klbw3Q5-h3fdKvT1kShs-a0.jpg")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350)
                    .clipped()
                    .scaleEffect(scale[1])
                    .onLongPressGesture{
                        self.scale[1] *= 1.2
                    }
                    .animation(.easeInOut(duration: 3))
                KFImage(URL(string: "https://www.steamxo.com/wp-content/uploads/2019/07/uO5aYH041017_719316.jpg")!)
                 .resizable()
                 .scaledToFit()
                 .frame(width: 350)
                 .clipped()
                .scaleEffect(scale[2])
                .onLongPressGesture{
                    self.scale[2] *= 1.2
                }
                .animation(.easeInOut(duration: 3))
                 KFImage(URL(string: "https://5b0988e595225.cdn.sohucs.com/images/20191225/295a819eaf75483dbbc9d5b422a43d6c.jpeg")!)
                 .resizable()
                 .scaledToFit()
                 .frame(width: 350)
                 .clipped()
                .scaleEffect(scale[3])
                .onLongPressGesture{
                    self.scale[3] *= 1.2
                }
                .animation(.easeInOut(duration: 3))
                 KFImage(URL(string: "https://img2.tapimg.com/bbcode/images/16d7ee5956493426931014ab77302a9d.jpg")!)
                 .resizable()
                 .scaledToFit()
                 .frame(width: 350)
                 .clipped()
                .scaleEffect(scale[4])
                .onLongPressGesture{
                    self.scale[4] *= 1.2
                }
                .animation(.easeInOut(duration: 3))
            }
            .navigationBarTitle("劇情cg")
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
