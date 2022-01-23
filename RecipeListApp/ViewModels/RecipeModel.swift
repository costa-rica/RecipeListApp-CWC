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
    
    //func getPortion
    //num * target serving size
    //den * 6(json file servings portion)
    
    static func getPortion(ingredient: Ingredient, recipeServings:Int, targetServings:Int) -> String {
        var portion = ""
        var numerator = ingredient.num ?? 1
        // ?? 1 assigns 1 to numerator if the ingredient returns nil for num aka numerator
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            //Get single serving size by multiplying denominator by recipe servings
            denominator *= recipeServings
//            above line is same as: denominator = denominator * recipeServings
            
            
            //Get target portion by multiplying numberator by target servings
            numerator *= targetServings
            
            //Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            //Get whole portions if num> demon
            if numerator >= denominator {
                wholePortions = numerator / denominator
                numerator = numerator % denominator
                portion += String(wholePortions)
            }
            
            //Express remainder as fraction
            if numerator > 0 {
                //Assign remainder as fraction to portion string
                portion += wholePortions > 0 ? " " : ""
                //Above is shorthand if statement explaination lesson12 10:10 mark
                portion += "\(numerator)/\(denominator)"
            }
        }
        if var unit = ingredient.unit {
            
//            var suffix = ""
            
            if wholePortions > 1 {
                //Calclulate suffix
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }

            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            //if statement if ing.num is nil and ing.denm is nill return no space otherwise add a space
            return portion + unit
        }
        
        return portion
    }
    
    
    
}
