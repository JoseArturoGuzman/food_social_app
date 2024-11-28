import 'package:flutter/material.dart';
import 'package:social_food_app/food_themes.dart';
import 'package:social_food_app/models/explore_recipe.dart';

class Card3 extends StatelessWidget {
  const Card3({super.key, required this.recipe});

  final ExploreRecipe recipe;
  List<Widget> createTagChips(){
    final chips = <Widget>[];
    recipe.tags.take(6).forEach((element) {
      final chip = Chip(label: Text(element, style: FoodTheme.darkTextTheme.bodyLarge,),
        backgroundColor: Colors.black.withOpacity(0.7),

      );
    chips.add(chip);
      },
    );
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints.expand(width: 350, height: 400),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(recipe.backgroundImage),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(35),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Save Post',
                    style: FoodTheme.darkTextTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            Center(
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 12,
                runSpacing: 12,
                children:
                  createTagChips(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
