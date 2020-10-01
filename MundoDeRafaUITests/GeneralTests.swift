//
//  GeneralTests.swift
//  MundoDeRafaUITests
//
//  Created by Jhennyfer Rodrigues de Oliveira on 30/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//
// swiftlint:disable trailing_whitespace
import XCTest
@testable import Mundo_de_Rafa
class GeneralTests: XCTestCase {
    // Onboarding
    func test_buttonTapped_goToMainMenu() {
        let app = XCUIApplication()
        app.launchArguments = ["-reset"]
        app.launch()
        
        let button = app.staticTexts["Próximo"]
        XCTAssertTrue(button.isHittable)
        button.tap()
    }
    
    // Main Menu
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
    
    func test_storyView_whenClickedGoToSceneView() {
        let app = XCUIApplication()
        app.launchArguments = ["-skipOnboarding"]
        app.launch()
        XCUIDevice.shared.orientation = .landscapeRight
        app.buttons["Jogar"].tap()
        
        let collectionViewsQuery = app.collectionViews
        let cell = collectionViewsQuery.children(matching: .cell).element(boundBy: 1)
        
        let emBreveElement = cell.otherElements.containing(.staticText, identifier: "Em breve").element
        emBreveElement.swipeDown()
        emBreveElement.swipeUp()
        
        XCTAssertTrue(cell.isHittable)
        cell.staticTexts["Em breve"].tap()
        
        XCTAssertTrue(collectionViewsQuery.cells.otherElements
                        .containing(.staticText, identifier: "Rafa se preparando para escola").element.isHittable)
        
        collectionViewsQuery.cells.otherElements
            .containing(.staticText, identifier: "Rafa se preparando para escola").element.tap()
        
        let backButtonButton = app.buttons["back button"]
        XCTAssertTrue(backButtonButton.isHittable)
        backButtonButton.tap()
        backButtonButton.tap()
    }
    
}
