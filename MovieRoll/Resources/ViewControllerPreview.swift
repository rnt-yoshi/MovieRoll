//
//  ViewControllerPreview.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 22/07/22.
//

import SwiftUI
import Foundation

let deviceNames: [String] = [
    "iPhone 13 Pro Max"
]

struct ViewControllerPreview: UIViewControllerRepresentable {
    
    var viewControllerBuilder: () -> UIViewController
    
    init(_ viewControllerBuilder: @escaping () -> UIViewController) {
        self.viewControllerBuilder = viewControllerBuilder
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        viewControllerBuilder()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        return
    }
}
