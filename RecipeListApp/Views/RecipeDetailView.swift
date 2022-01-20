//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Nick on 1/13/22.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe
    var body: some View {
        
        ScrollView {
            
            VStack (alignment: .leading){
                // MARK: Recipe Image
                Image(recipe.image).resizable().scaledToFill()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients").font(.headline).padding([.bottom,.top], 5)
                    
                    ForEach (recipe.ingredients) {item in
                        Text("• " + item.name)
                    }
                }
                .padding(.horizontal)
                //MARK: Divider
                Divider()
                // MARK: Directions
                VStack(alignment: .leading){
                    Text("Directions").font(.headline).padding([.bottom,.top],5)
                    ForEach(0..<recipe.directions.count, id: \.self) {index in
                        Text(String(index+1)+" . "+recipe.directions[index]).padding(.bottom, 5)
                        
                    }
                }
                .padding(.horizontal)
            }
        }.navigationBarTitle(recipe.name)//Adds names to recipe page
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //Create a dummy recipe adn pass it into the daetail view so we can se a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe:model.recipes[0])
    }
}
