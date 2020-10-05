//
//  SceneVCTests.swift
//  MundoDeRafaTests
//
//  Created by Felipe Santana on 30/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import XCTest
@testable import Mundo_de_Rafa

//swiftlint:disable trailing_whitespace

class SceneVCTests: XCTestCase {
    
    var scenes: [SceneModel] = []
    let sceneController = ScenesViewController()
    
    override func setUp() {
        
        let sceneCard1 = SceneModel(image: "card_bathroom", title: "Banho de Rafa", isComplete: true, isBlocked: false)
        let sceneCard2 = SceneModel(image: "card_bathroom", title: "Banho de Rafa", isComplete: true, isBlocked: false)
        let sceneCard3 = SceneModel(image: "card_bathroom", title: "Banho de Rafa", isComplete: false, isBlocked: false)
        let sceneCard4 = SceneModel(image: "card_bathroom", title: "Banho de Rafa", isComplete: false, isBlocked: true)
        
        scenes.append(contentsOf: [sceneCard1, sceneCard2, sceneCard3, sceneCard4])

    }
    
    func test_calculateProgress_toBeEqual50() {
        
        let expected = 0.5
        let actual = sceneController.calculateProgress(models: scenes)
        
        XCTAssertEqual(expected, actual)
    }
    
    override func tearDown() {
        
        scenes = []
        
    }

}
