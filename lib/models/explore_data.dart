
import 'package:social_food_app/models/post.dart';

import 'explore_recipe.dart';

class ExploreData{
  final List<ExploreRecipe> todayRecipes;
  final List<Post> friendPost;

  ExploreData(
      this.todayRecipes,
      this.friendPost,
      );
}