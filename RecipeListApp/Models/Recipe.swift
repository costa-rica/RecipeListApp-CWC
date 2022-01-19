//
//  Recipe.swift
//  RecipeListApp
//
//  Created by Nick on 1/11/22.
//

import Foundation

class Recipe: Identifiable, Decodable {
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var servings:Int
    var ingredients:[String]
    var directions:[String]
}
