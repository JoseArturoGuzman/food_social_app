import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:social_food_app/models/explore_data.dart';
import 'package:social_food_app/models/explore_recipe.dart';
import 'package:social_food_app/models/post.dart';
import 'package:social_food_app/models/simple_recipe.dart';

class ApiService {
  //Cargar una data desde un Archivo(JSON)
  Future<String> _loadAssets(String path) async {
    return rootBundle.loadString(path);
  }

  //Obtener una lista de sample_recipes para mostrar en la aplicacion
  Future<List<SimpleRecipe>> getRecipes() async {
    //Simular una consulta a un api.
    await Future.delayed(Duration(microseconds: 1000));
    // Se trae el json a travez del archivo
    final data = await _loadAssets('assets/sample_data/sample_recipes.json');
    //Convertimos el JSON a un objeto(map)
    final Map<String, dynamic> json = jsonDecode(data);

    // Navegamos en el mapa de recetas y convertimos a objetos de tipo SimpleRecipes.
    if (json["recipes"] != null) {
      final recipes = <SimpleRecipe>[];
      json["recipes"].forEach((value) {
        recipes.add(SimpleRecipe.fromJson(value));
      });
      //Devolvemos  la lista de objetos simple_recipes
      return recipes;
    } else {
      return []; //Retornamos la lista vacia.
    }
  }

  //Obtener  la lista de post
  Future<List<Post>> _getFriendPost() async {
    //Simular una consulta a un api.
    await Future.delayed(Duration(microseconds: 1000));
    // Se trae el json a travez del archivo
    final data =
        await _loadAssets('assets/sample_data/sample_friends_feed.json');
    //Convertimos el JSON a un objeto(map)
    final Map<String, dynamic> json = jsonDecode(data);

    // Navegamos en el mapa de [post] y convertimos a objetos de tipo SimpleRecipes.
    if (json["feed"] != null) {
      final post = <Post>[];
      json["feed"].forEach((value) {
        post.add(Post.fromJson(value));
      });
      //Devolvemos  la lista de objetos simple_recipes
      return post;
    } else {
      return []; //Retornamos la lista vacia.
    }
  }

  //Obtener las recetas a recomendar en un dia
 Future<List<ExploreRecipe>> _getTodayRecipe() async{
    await Future.delayed(Duration(microseconds: 1000));
    //Traemos la data del JSON
   final data = await _loadAssets("assets/sample_data/sample_explore_recipes.json");
   //Convertimos en un mapa el JSON
    final Map<String, dynamic> json = jsonDecode(data);
    // Navegamos en el mapa de explore_recipe y convertimos a objetos de tipo SimpleRecipes.
    if (json["recipes"] == null) {
      return []; //Retornamos la lista vacia.
    }
    final recipes = <ExploreRecipe>[];
    json["recipes"].forEach((value) {
      recipes.add(ExploreRecipe.fromJson(value));
    });
    //Devolvemos  la lista de objetos simple_recipes
    return recipes;

}
  //Obtener las listas de recetas del dia (ExploreRecipes y post)
Future<ExploreData> getExploreData() async{
    final todayRecipes = await _getTodayRecipe();
    final friendPost = await _getFriendPost();

    return ExploreData(todayRecipes, friendPost);
}
}
