//
//  SafariView.swift
//  iosFinal
//
//  Created by 林柏全 on 2020/6/19.
//  Copyright © 2020 ntou. All rights reserved.
//

import Foundation
import SwiftUI
import SafariServices
struct SafariView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> SFSafariViewController {
         SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        
    }
    
    typealias UIViewControllerType = SFSafariViewController
    
    let url: URL
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(url: URL(string: "https://medium.com/@apppeterpan")!)
    }
}
