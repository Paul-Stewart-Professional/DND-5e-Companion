//
//  UISegmentedControl.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 3/20/24.
//

import SwiftUI
import UIKit

struct CustomSegmentedControl: UIViewRepresentable {
    var items: [String]
    @Binding var selectedSegmentIndex: Int

    func makeUIView(context: Context) -> UISegmentedControl {
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = selectedSegmentIndex
        
        control.backgroundColor = .systemBackground
        control.selectedSegmentTintColor = UIColor.softYellow
        
        control.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
        control.backgroundColor = UIColor.lightBrown
        
        return control
    }

    func updateUIView(_ uiView: UISegmentedControl, context: Context) {
        uiView.selectedSegmentIndex = selectedSegmentIndex
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: CustomSegmentedControl

        init(_ control: CustomSegmentedControl) {
            self.parent = control
        }

        @objc func valueChanged(_ sender: UISegmentedControl) {
            parent.selectedSegmentIndex = sender.selectedSegmentIndex
        }
    }
}
