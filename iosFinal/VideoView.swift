//
//  VedioView.swift
//  iosFinal
//
//  Created by User20 on 2020/6/19.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct VideoView: View {
    @State private var urlString = "https://www.youtube.com/watch?v=5DankT434zc"
    var body: some View {
        VStack {
            WebView(urlString: urlString)
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
