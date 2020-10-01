//
//  GeneralTests.swift
//  MundoDeRafaUITests
//
//  Created by Jhennyfer Rodrigues de Oliveira on 30/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//
// swiftlint:disable trailing_whitespace
// swiftlint:disable line_length
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
        
        // testing buttons
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
        
        // testing collection view
        let collectionViewsQuery = app.collectionViews
        let cell = collectionViewsQuery.children(matching: .cell).element(boundBy: 1)
        
        let emBreveElement = cell.otherElements.containing(.staticText, identifier: "Em breve").element
        emBreveElement.swipeDown()
        emBreveElement.swipeUp()
        
        XCTAssertTrue(emBreveElement.isHittable)
        emBreveElement.staticTexts["Em breve"].tap()
        
        XCTAssertTrue(collectionViewsQuery.cells.otherElements
                        .containing(.staticText, identifier: "Rafa se preparando para escola").element.isHittable)
        
        collectionViewsQuery.cells.otherElements
            .containing(.staticText, identifier: "Rafa se preparando para escola").element.tap()
        
        // testing back button
        let backButtonButton = app.buttons["back button"]
        XCTAssertTrue(backButtonButton.isHittable)
        backButtonButton.tap()
    }
    
    func test_scenesView_whenClickedGoToSceneView() {
        let app = XCUIApplication()
        app.launchArguments = ["-skipOnboarding"]
        app.launch()

        app/*@START_MENU_TOKEN@*/.staticTexts["Jogar"]/*[[".buttons[\"Jogar\"].staticTexts[\"Jogar\"]",".staticTexts[\"Jogar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // testing collection view
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery
            /*@START_MENU_TOKEN@*/.staticTexts["Rafa se preparando para escola"]/*[[".cells.staticTexts[\"Rafa se preparando para escola\"]",".staticTexts[\"Rafa se preparando para escola\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let verticalScrollBar2PagesCollectionView = app.collectionViews.containing(.other, identifier: "Vertical scroll bar, 2 pages").element
        verticalScrollBar2PagesCollectionView/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(verticalScrollBar2PagesCollectionView.isEnabled)
        
        let cellsQuery = collectionViewsQuery.cells
        XCTAssertTrue(cellsQuery.otherElements.containing(.staticText, identifier: "Café da manhã de Rafa").children(matching: .other).element(boundBy: 0).isHittable)
        
        cellsQuery.otherElements.containing(.staticText, identifier: "Café da manhã de Rafa").children(matching: .other).element(boundBy: 0).tap()
        
        verticalScrollBar2PagesCollectionView.swipeUp()
           
        // testing buttons
        let pauseButtonButton = app.buttons["pause button"]
        XCTAssertTrue(pauseButtonButton.isHittable)
        pauseButtonButton.tap()
        
        let playButtonBackGreen = app.buttons["play button back green"]
        XCTAssertTrue(playButtonBackGreen.isHittable)
        playButtonBackGreen.tap()
        pauseButtonButton.tap()
        
        let soundOffBackGreen = app.buttons["sound off back green"]
        XCTAssertTrue(soundOffBackGreen.isHittable)
        soundOffBackGreen.tap()
        
        let soundOnBackGreen = app.buttons["sound on back green"]
        XCTAssertTrue(soundOnBackGreen.isHittable)
        soundOnBackGreen.tap()
        
        let musicOffBackGreen = app.buttons["music off back green"]
        XCTAssertTrue(musicOffBackGreen.isHittable)
        musicOffBackGreen.tap()
        
        let musicOnBackGreen = app.buttons["music on back green"]
        XCTAssertTrue(musicOnBackGreen.isHittable)
        musicOnBackGreen.tap()
    
        let mudarCena = app.staticTexts["Mudar Cena"]
        XCTAssertTrue(mudarCena.isHittable)
        mudarCena.tap()
        
        verticalScrollBar2PagesCollectionView/*@START_MENU_TOKEN@*/.press(forDuration: 1.4);/*[[".tap()",".press(forDuration: 1.4);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
    }
}
