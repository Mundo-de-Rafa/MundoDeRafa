//
//  File.swift
//  MundoDeRafa
//
//  Created by Jhennyfer Rodrigues de Oliveira on 28/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import Foundation
import UIKit

enum CardState {
    case locked
    case unlocked
}

struct Card {
    let title: String
    let image: UIImage
    let progress: Float
    let state: CardState
}


var cards : [Card] = []
var cardUnlocked = Card(title: "Rafa se preparando para escola", image: UIImage(named: "rafa_at_home") ?? UIImage(), progress: 0.4, state: .unlocked)

let cardLocked = Card(title: "Bloqueado", image: UIImage(named: "locked") ?? UIImage(), progress: 0.0, state: .locked)






