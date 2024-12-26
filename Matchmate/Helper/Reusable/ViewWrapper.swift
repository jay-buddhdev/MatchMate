//
//  ViewWrapper.swift
//  Matchmate
//
//  Created by Jay Buddhdev on 26/12/24.
//


import UIKit
import SwiftUI

extension UIView {
    var swiftUI: some View {
        ViewWrapper(view: self)
    }
}

private struct ViewWrapper: UIViewRepresentable {
    let view: UIView

    func makeUIView(context: Context) -> UIView {
        view
    }

    func updateUIView(_ uiView: UIView, context: Context) { }
}