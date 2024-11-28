import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:social_food_app/food_themes.dart';
import 'package:social_food_app/models/explore_recipe.dart';

class Card1 extends StatelessWidget {
  const Card1({super.key, required this.recipe});
  final String category = 'Editor\'s Choice';
  final String title = 'Art of Dough';
  final String description = 'Learn to make a Choice ';
  final String chef = 'Ray Wenderlich';

  final ExploreRecipe recipe;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
             image: AssetImage(recipe.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(35),
        ),
        constraints: BoxConstraints.expand(
          width: 350,
          height: 350,
        ),
        child: Stack(
          children: [
            Text(recipe.cardType, style: FoodTheme.darkTextTheme.bodyLarge),
            Positioned(
                top: 20,
                left: 15,
                child:
                    Text(recipe.title, style: FoodTheme.darkTextTheme.titleLarge)),
            Positioned(
                bottom: 30,
                right: 0,
                child: Text(recipe.description, style: FoodTheme.darkTextTheme.bodyLarge)),
            Positioned(
                bottom: 10,
                right: 0,
                child: Text(recipe.authorName, style: FoodTheme.darkTextTheme.bodyLarge)),
            
          ],
         
          
        ),
        
      ),
    );
  }
}
