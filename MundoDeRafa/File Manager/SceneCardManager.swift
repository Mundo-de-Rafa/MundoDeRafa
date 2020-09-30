//
//  SceneCardManager.swift
//  MundoDeRafa
//
//  Created by Felipe Santana on 28/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import Foundation

func createSceneModelNewFile(data: [SceneModel]) {
    
    if let data = try? JSONEncoder().encode(data) {
        
        FileController().createFile(with: data, name: "SceneModel.Json")
        
    }
    
}

func readSceneModelsFromFile() -> [SceneModel]? {
    
    if let data = FileController().retrieveFile(at: "SceneModel.Json") {
        
        let allScenesModels = try? JSONDecoder().decode([SceneModel].self, from: data)
        
        return allScenesModels
    }
    
    return nil
}

func updateSceneModelsDataFile(data: [SceneModel]) {
    
    if let data = try? JSONEncoder().encode(data) {
        
        FileController().updateFile(at: "SceneModel.Json", data: data)
        
    }
    
}
