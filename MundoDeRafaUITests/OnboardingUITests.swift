//
//  OnboardingUITests.swift
//  MundoDeRafaUITests
//
//  Created by Albert Rayneer on 23/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import XCTest
@testable import Mundo_de_Rafa

class OnboardingUITests: XCTestCase {

    func test_buttonTapped_goToMainMenu() {
        let app = XCUIApplication()
        app.launchArguments = ["-reset"]
        app.launch()

        let button = app.staticTexts["Próximo"]
        XCTAssertTrue(button.isHittable)
        button.tap()
    }
}
