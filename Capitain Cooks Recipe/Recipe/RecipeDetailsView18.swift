

import SwiftUI

struct RecipeDetailsView18: View {
    let dish: Dish
       @State private var rating: Int = 0
       @Environment(\.dismiss) var dismiss
       @State private var showFeedbackAlert = false
       @State private var isSaved = false
       @Binding var savedDishes: [Dish]
       @State private var showSaveMessage = false

       var body: some View {
           ScrollView {
               VStack(alignment: .leading, spacing: 16) {
                  
                   HStack {
                       Button {
                           self.dismiss()
                       } label: {
                           Image(systemName: "arrow.left")
                               .font(.title2)
                               .foregroundColor(.white)
                               .padding()
                       }

                       Spacer()

                       Text("Details")
                           .font(.headline)
                           .foregroundColor(.white)

                       Spacer()

                       Button {
                           if isSaved {
                               savedDishes.removeAll { $0.id == dish.id }
                           } else {
                               savedDishes.append(dish)
                               showSaveMessage = true
                           }
                           isSaved.toggle()
                       } label: {
                           Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                               .font(.title2)
                               .foregroundColor(.white)
                               .padding()
                       }
                   }
                   .padding(.top, 40)
                   .background(Color("backg"))
                   .alert(isPresented: $showSaveMessage) {
                       Alert(
                           title: Text("Recipe Saved"),
                           message: Text("The recipe \"\(dish.name)\" has been added to your saved recipes."),
                           dismissButton: .default(Text("OK"))
                       )
                   }

                  
                   Image(dish.imageName)
                       .resizable()
                       .scaledToFill()
                       .frame(width: UIScreen.main.bounds.width)
                       .frame(height: 250)
                       .clipped()

                  
                   Text(dish.name)
                       .font(.largeTitle)
                       .bold()
                       .foregroundColor(.white)
                       .padding(.horizontal)

                 
                   HStack(spacing: 16) {
                       RecipeInfoView(icon: "g1", text: dish.time)
                       RecipeInfoView(icon: "g2", text: dish.kcal)
                       RecipeInfoView(icon: "g3", text: dish.difficulty)
                   }
                   .padding(.horizontal)

                  
                   HStack(spacing: 16) {
                       NutritionInfoView(value: "3g", nutrient: "protein", icone: "q1")
                       NutritionInfoView(value: "9g", nutrient: "fat", icone: "q2")
                       NutritionInfoView(value: "29g", nutrient: "carbo", icone: "q3")
                   }
                   .padding(.horizontal)

                   
                   VStack(alignment: .leading, spacing: 10) {
                       Text("Ingredients:")
                           .font(.headline)
                           .foregroundColor(.white)

                       VStack(alignment: .leading, spacing: 8) {
                           Text("• 1 cup (120g) all-purpose flour")
                           Text("• ½ cup (100g) sugar")
                           Text("• ¼ cup (60ml) vegetable oil")
                           Text("• 2 large eggs")
                           Text("• ½ cup (120ml) milk")
                           Text("• 2 tbsp (15g) cocoa powder")
                           Text("• 1 tsp (5g) baking powder")
                           Text("• 1 cup (150g) cherries (fresh or canned)")
                           Text("• 1 cup (240ml) whipped cream")
                           Text("• Chocolate shavings for garnish")
                       }
                       .foregroundColor(.white)
                   }
                   .padding()
                   .background(Color("pink"))
                   .cornerRadius(15)
                   .padding(.horizontal)

                  
                   VStack(alignment: .leading, spacing: 8) {
                       Text("Instructions:")
                           .font(.headline)
                           .foregroundColor(.white)

                       Text("""
                       1. Prepare the Batter:
                          Preheat the oven to 350°F (180°C). Mix flour, cocoa, baking powder, sugar, eggs, milk, and oil until smooth.

                       2. Bake the Cupcakes:
                          Pour batter into muffin cupcake molds, filling them 2/3 full. Bake for 18–20 minutes. Let cool.

                       3. Decorate:
                          Top each cupcake with whipped cream, a cherry, and chocolate shavings.
                       """)
                       .foregroundColor(.white)
                   }
                   .padding()
                   .background(Color("color1"))
                   .cornerRadius(15)
                   .padding(.horizontal)

                   
                   VStack(alignment: .leading, spacing: 10) {
                       Text("Rate this recipe")
                           .font(.headline)
                           .foregroundColor(.white)

                       HStack {
                           ForEach(1...5, id: \.self) { index in
                               Button(action: {
                                   rating = index
                               }) {
                                   Image(systemName: index <= rating ? "star.fill" : "star")
                                       .font(.title)
                                       .foregroundColor(index <= rating ? .yellow : .gray)
                               }
                               .buttonStyle(PlainButtonStyle())
                           }
                       }
                   }
                   .padding(.horizontal)

                  
               

                
                   VStack(alignment: .leading, spacing: 10) {
                       Text("Add feedback")
                           .font(.headline)
                           .foregroundColor(.white)

                       TextField("Message", text: .constant(""))
                           .padding()
                           .background(Color.gray.opacity(0.2))
                           .cornerRadius(10)

                       Button(action: {
                           showFeedbackAlert = true
                       }) {
                           Text("Add feedback")
                               .foregroundColor(.white)
                               .bold()
                               .frame(maxWidth: .infinity)
                               .padding()
                               .background(Color("pink"))
                               .cornerRadius(10)
                       }
                   }
                   .padding()
                   .alert(isPresented: $showFeedbackAlert) {
                       Alert(
                           title: Text("Feedback Sent"),
                           message: Text("Thank you for your feedback!"),
                           dismissButton: .default(Text("OK"))
                       )
                   }
               }
               .frame(maxWidth: .infinity)
           }
           .background(Color("backg"))
           .frame(width: UIScreen.main.bounds.width)
           .edgesIgnoringSafeArea(.all)
       }
   }

