//
//  FileController.swift
//  MundoDeRafa
//
//  Created by Felipe Santana on 28/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import Foundation

class FileController {
    
    let manager = FileManager.default
    let mainPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    func constructPath(named: String, from path: String? = nil) -> URL {
        
        let contentPath = mainPath
        if let path = path {
            
            return contentPath.appendingPathComponent(path).appendingPathComponent(named)
            
        } else {
            
            return contentPath.appendingPathComponent(named)
            
        }
        
    }
    
    func createFile(with data: Data, name: String) {
        
        let contentPath = constructPath(named: name)
        manager.createFile(atPath: contentPath.path, contents: data, attributes: nil)
        
    }
    
    func updateFile(at path: String, data: Data) {
        
        let contentPath = constructPath(named: path)
        do {
        
            try data.write(to: contentPath)
        
        } catch let error {
            
            print(error.localizedDescription)
        
        }
        
    }
    
    func retrieveFile(at path: String) -> Data? {
        
        let contentPath = constructPath(named: path)
        let data = try? Data(contentsOf: contentPath)
        
        return data
        
    }
    
    func directoryExists(with name: String, at path: String? = nil) -> Bool {
            let dirPath = constructPath(named: name, from: path)
            var isDirectory = ObjCBool(true)
            return manager.fileExists(atPath: dirPath.path, isDirectory: &isDirectory) /*&& isDirectory.boolValue*/
            
    }
    
}
