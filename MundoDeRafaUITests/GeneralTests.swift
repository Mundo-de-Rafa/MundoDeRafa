//
//  GeneralTests.swift
//  MundoDeRafaUITests
//
//  Created by Jhennyfer Rodrigues de Oliveira on 30/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//
// swiftlint:disable trailing_space
import XCTest
@testable import Mundo_de_Rafa
class GeneralTests: XCTestCase {
    func test_buttonTapped_goToMainMenu() {
        let app = XCUIApplication()
        app.launchArguments = ["-reset"]
        app.launch()

        let button = app.staticTexts["Próximo"]
        XCTAssertTrue(button.isHittable)
        button.tap()
    }
    
    func test_mainMenu_buttonIsHittable() {
        let app = XCUIApplication()
        app.launchArguments = ["-skipOnboarding"]
        app.launch()
        
        let jogarButton = app.staticTexts["Jogar"]
        XCTAssertTrue(jogarButton.isHittable)
        jogarButton.tap()
        
        let backButton = app.buttons["back button"]
        XCTAssertTrue(backButton.isHittable)
        backButton.tap()

        let soundOffBackWhite = app.buttons["sound off back white"]
        XCTAssertTrue(soundOffBackWhite.isHittable)
        soundOffBackWhite.tap()
        
        let soundOnBackWhite = app.buttons["sound on back white"]
        XCTAssertTrue(soundOnBackWhite.isHittable)
        soundOnBackWhite.tap()
        
        let musicOffBackWhite = app.buttons["music off back white"]
        XCTAssertTrue(musicOffBackWhite.isHittable)
        musicOffBackWhite.tap()
        
        let musicOnBackWhite = app.buttons["music on back white"]
        XCTAssertTrue(musicOnBackWhite.isHittable)
        musicOnBackWhite.tap()
    }
}
