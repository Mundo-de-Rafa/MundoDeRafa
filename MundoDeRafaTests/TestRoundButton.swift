//
//  RoundButton.swift
//  MundoDeRafaTests
//
//  Created by Jhennyfer Rodrigues de Oliveira on 30/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import XCTest
@testable import Mundo_de_Rafa

class TestRoundButton: XCTestCase {

    func test_calculateCornerRadius_roundButton() {
        let button = RoundButton()
        button.calculatesCornerRadius()
        XCTAssertTrue(button.layer.cornerRadius == button.bounds.height/2)
    }

}
