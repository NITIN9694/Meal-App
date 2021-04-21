

import 'package:flutter/material.dart';
import 'package:meal/Data/Dummy_data.dart';
import 'package:meal/Data/Meal.dart';
import 'package:meal/Screen/categoriesmeal.dart';
import 'package:meal/Widget/ItemMeal.dart';

class MealImage extends StatefulWidget {
  static const routname = "/categories";
 final List<Meal>availableMeal;
 MealImage(this.availableMeal);
  @override
  _MealImageState createState() => _MealImageState();
}

class _MealImageState extends State<MealImage> {
  @override
  Widget build(BuildContext context) {
    final routargs =ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categorytitel = routargs["title"];
    final categoryid = routargs["id"];
    final categoryeMeal = widget.availableMeal.where((element) {
      return element.categories.contains(categoryid);
    }).toList();
  return Scaffold( 
      appBar: AppBar(
        title:Text(categorytitel),
      ),
      body:Container(child: ListView.builder(
        itemCount: categoryeMeal.length,
        itemBuilder: (context,index){
         
        return MealItem(
          title: categoryeMeal[index].title,
          imageUrl: categoryeMeal[index].imageUrl,
          duration: categoryeMeal[index].duration,
          affordabilty: categoryeMeal[index].affordability,
          complexity: categoryeMeal[index].complexity,
          id: categoryeMeal[index].id,
          
        );
      }),)
      
    );
  }
}