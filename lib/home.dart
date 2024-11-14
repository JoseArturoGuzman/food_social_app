import 'package:flutter/material.dart';
import 'package:social_food_app/screens/explore_screen.dart';
import 'package:social_food_app/screens/recipe_screen.dart';
import 'package:social_food_app/screens/to_buy_screen.dart';

import 'components/Theme_button.dart';

class Home extends StatefulWidget {
  Home({super.key, required this.appTitle, required this.ChangeThemeMode});

  final appTitle;
  final Function ChangeThemeMode;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentsScreen = 0;
  List<Widget> screens = [
    ExploreScreen(),
    RecipesScreen(),
    ToBuyScreen(),
  ];
  void changeScreen(int index){
    setState(() {
      currentsScreen = index;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          widget.appTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          //Button
          ThemeButton(changeTheme: widget.ChangeThemeMode)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentsScreen,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          onTap:(value) {
            changeScreen(value);
          } ,
          items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.explore), label: "EXPLORE"),
        BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard), label: "Recipes"),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), label: "to Buy")
      ]),
      body: screens[currentsScreen],
    );
  }
}
