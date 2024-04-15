//
//  Extensions.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 3/18/24.
//

import Foundation
import SwiftUI
import ApolloAPI
import ApolloSQLite
import DNDSchema


extension UIApplication {
    func endEditing(_ force: Bool) {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.endEditing(force)
    }
}
struct ResignKeyBoardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged { _ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}
extension View {
    func resignKeyboardOnDragGesuture() -> some View {
        return modifier(ResignKeyBoardOnDragGesture())
    }
}

extension UISegmentedControl {
    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.setContentHuggingPriority(.defaultLow, for: .vertical)
    }
}

extension Double {
    func makeIntArrayFromZeroToNumber() -> [Int] {
        var intArray: [Int] = []
        for i in 0...Int(self) {
            intArray.append(i)
        }
        return intArray
    }
}
