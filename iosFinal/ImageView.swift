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
    @State private var selectImage = Image(systemName: "photo")
    @State private var showSelectPhoto = false
    @State private var showWebpage = false
    var body: some View {
        NavigationView{
            List{
                Button(NSLocalizedString("基隆公車處資訊", comment: "")) {
                            self.showWebpage = true
                        }
                        .sheet(isPresented: $showWebpage) {
                            SafariView(url: URL(string: "http://www.klcba.gov.tw/releaseRedirect.do?unitID=1&pageID=642")!)
                        }
                KFImage(URL(string: "https://media-cdn.tripadvisor.com/media/photo-s/10/f2/5a/d1/788.jpg")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 220)
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
                KFImage(URL(string: "https://pic.pimg.tw/barefooter/494bba21ab9d4.jpg")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 220)
                    .clipped()
                    .scaleEffect(scale[1])
                    .onLongPressGesture{
                        if self.isBig == 0{
                            self.scale[1] *= 1.2
                            self.isBig = 1
                        }
                        else{
                            self.scale[1] = 1
                            self.isBig = 0
                        }
                }
                .animation(.easeInOut(duration: 3))
                KFImage(URL(string: "https://live.staticflickr.com/2751/32971772966_07114fb527_b.jpg")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 220)
                    .clipped()
                    .scaleEffect(scale[2])
                    .onLongPressGesture{
                        if self.isBig == 0{
                            self.scale[2] *= 1.2
                            self.isBig = 1
                        }
                        else{
                            self.scale[2] = 1
                            self.isBig = 0
                        }
                }
                .animation(.easeInOut(duration: 3))
                KFImage(URL(string: "https://pic.pimg.tw/may1215may/1518862107-1379917223_n.jpg")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 220)
                    .clipped()
                    .scaleEffect(scale[3])
                    .onLongPressGesture{
                        if self.isBig == 0{
                            self.scale[3] *= 1.2
                            self.isBig = 1
                        }
                        else{
                            self.scale[3] = 1
                            self.isBig = 0
                        }
                }
                .animation(.easeInOut(duration: 3))
                KFImage(URL(string: "https://f.share.photo.xuite.net/lsg2006/1fff90f/5997657/240260534_l.jpg")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 220)
                    .clipped()
                    .scaleEffect(scale[4])
                    .onLongPressGesture{
                        if self.isBig == 0{
                            self.scale[4] *= 1.2
                            self.isBig = 1
                        }
                        else{
                            self.scale[4] = 1
                            self.isBig = 0
                        }
                }
                .animation(.easeInOut(duration: 3))
                Button(action: {
                    self.showSelectPhoto = true
                }){
                    selectImage
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: 350, height: 220)
                        .clipped()
                }
                .sheet(isPresented: $showSelectPhoto){
                    ImagePickerController(showSelectPhoto: self.$showSelectPhoto, selectImage: self.$selectImage)
                }
            }
            .navigationBarTitle("照片牆")
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
