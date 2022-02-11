//
//  ContentModel.swift
//  Learning App
//
//  Created by J M on 2/9/22.
//

import Foundation

class ContentModel: ObservableObject {
    @Published var modules = [Module]()
    
    var styleData:Data?
    
    init() {
        getLocalData()
    }
    
    func getLocalData() {
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            let jsonData = try Data(contentsOf: jsonURL!)
            
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            self.modules = modules
        } catch {
            print("Couldn't parse local data \n")
            print(error)
        }
        
        let styleURL = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            let styleData = try Data(contentsOf: styleURL!)
            
            self.styleData = styleData
        } catch {
            print("Couldn't Parse style data \n")
            print(error)
        }
    }
}
