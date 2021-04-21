import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal/Data/Meal.dart';
import 'package:meal/Widget/ItemMeal.dart';

class FavroiteScreen extends StatelessWidget {
  
   final List<Meal>favoritMeal;
   FavroiteScreen(this.favoritMeal);
  @override
  Widget build(BuildContext context) {
    if(favoritMeal.isEmpty){
      return Center(
      child: Text("You have no favorite yet - start adding some!",style: GoogleFonts.quicksand(
      fontWeight: FontWeight.w600,
      fontSize: 20
      ),
    ));
    }
    else{
      return ListView.builder(
        itemCount: favoritMeal.length,
        itemBuilder: (ctx,index){
          return MealItem(
            id: favoritMeal[index].id,
            title: favoritMeal[index].title,
            imageUrl: favoritMeal[index].imageUrl,
            duration: favoritMeal[index].duration,
            affordabilty: favoritMeal[index].affordability,
            complexity: favoritMeal[index].complexity,
          );
        });
    }
  }
}
