import 'package:flutter/material.dart';
import 'package:meal/Data/Meal.dart';
import 'package:meal/Screen/FilterScreen.dart';
import 'package:meal/Screen/HomeScreen.dart';
import 'package:meal/Screen/ItemDeatile.dart';
import 'package:meal/Screen/Tab_bar.dart';

import './Screen/categoriesmeal.dart';
import 'Data/Dummy_data.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String ,bool>_filter ={
    "gluten":false,
    "lactos":false,
    "vegan":false,
    "vegetarian":false,
  };
  List<Meal> _availableMeal = Dummy_Meal;
List<Meal>_favoriteMeal =[];
  void _setFilter(Map<String,bool>filterData) {
    setState(() {
      _filter =filterData;
      _availableMeal =Dummy_Meal.where((meal){
       if(_filter["gluten"] && !meal.isGlutenFree){
         return false;
       } if(_filter["lactos"] && !meal.isLactoseFree){
         return false;
       } if(_filter["vegan"] && !meal.isVegan){
         return false;
       } if(_filter["vegetarian"] && !meal.isVegetarian){
         return false;
       }
       return true;
      } ).toList();
    });
  }
  bool _isMealFavorite(String id){
    return _favoriteMeal.any((element) => element.id==id);
  }
  void _toggoleFavorite(String mealId){
    final existingIndex =_favoriteMeal.indexWhere((meal) => meal.id==mealId);
    if(existingIndex >=0){
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
   }else{
     setState(() {
       _favoriteMeal.add(
         Dummy_Meal.firstWhere((element) => element.id==mealId)
       );
     });
   }
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      primaryColor: Colors.amber,
      accentColor: Colors.pink,
      canvasColor: Color.fromRGBO(225, 254, 229, 1),
      fontFamily: "GoogleFonts.quicksand()",
      textTheme: ThemeData.light().textTheme

      ),
      home: Categoriesmeal(),

      initialRoute: "/main",//default is "/"
      routes: {
        "/main":(ctx)=>TabBarScreen(_favoriteMeal),  
        MealImage.routname:(context)=>MealImage(_availableMeal),
        ItemDeatil.routname:(context)=>ItemDeatil(_toggoleFavorite,_isMealFavorite),
        FilterScren.routname:(context)=>FilterScren(_setFilter,_filter),
      },
    );
  }
}
