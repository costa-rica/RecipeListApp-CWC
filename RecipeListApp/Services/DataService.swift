//
//  DataService.swift
//  RecipeListApp
//
//  Created by Nick on 1/11/22.
//

import Foundation

class DataService {
    func getLocalData() ->[Recipe] {
        //parse local json file
        
        //Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //check if pathString is not nil, otherwise...
        guard pathString != nil else {// <-This replaces the if let path = pathString { optional
            return [Recipe]()
        }
        
        // create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            //create a data object
            let data = try Data(contentsOf: url)
            //decod teh data with a JSON decoder
            let decoder = JSONDecoder()
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                for r in recipeData{
                    r.id = UUID()
                    
                    //Add unique id's to recipe ingredients
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                return recipeData
            }
            catch {
                print("error parsing JSON::", error)
            }
            
            
            //Ad uniq id
            
            //return the recipeies
        }
        catch {
            print("url to data object error:::", error)
        }

        return [Recipe]()

    }
}
