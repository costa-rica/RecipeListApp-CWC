//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by Nick on 1/11/22.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        //create insatnce of data service
        let service = DataService()
        self.recipes = service.getLocalData()
    }
}
