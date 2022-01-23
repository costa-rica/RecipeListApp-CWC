//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Nick on 1/13/22.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe
    @State var selectedServingSize = 2
    var body: some View {
        
        ScrollView {
            
            VStack (alignment: .leading){
                // MARK: Recipe Image
                Image(recipe.image).resizable().scaledToFill()
                
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(.largeTitle)
                
                // MARK: Serving size picker
                VStack (alignment: .leading){
                    Text("Select your serving size:")
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding()

                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients").font(.headline).padding([.bottom,.top], 5)
                    //RecipeModel doesn't need to be
                    ForEach (recipe.ingredients) {item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
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
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //Create a dummy recipe adn pass it into the daetail view so we can se a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe:model.recipes[0])
    }
}
