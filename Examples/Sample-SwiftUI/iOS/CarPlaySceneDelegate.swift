//
//  CarPlaySceneDelegate.swift
//  Sample-SwiftUI
//
//  Minimal CarPlay support to demonstrate Intercom SDK crash
//

import UIKit
import CarPlay
import Intercom

class CarPlaySceneDelegate: UIResponder, CPTemplateApplicationSceneDelegate {

    var interfaceController: CPInterfaceController?

    func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene,
                                   didConnect interfaceController: CPInterfaceController) {
        self.interfaceController = interfaceController

        // Create a simple template to show the app in CarPlay
        let pointOfInterestTemplate = CPPointOfInterestTemplate(
            title: "Sample App",
            pointsOfInterest: [],
            selectedIndex: NSNotFound
        )

        interfaceController.setRootTemplate(pointOfInterestTemplate, animated: false)
    }

    func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene,
                                   didDisconnectInterfaceController interfaceController: CPInterfaceController) {
        self.interfaceController = nil
    }
}
