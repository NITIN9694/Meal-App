import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal/Data/Meal.dart';
import 'package:meal/Screen/ItemDeatile.dart';

class MealItem extends StatelessWidget {
 
 final String imageUrl;
 final String title;
 final int duration;
 final Complexity complexity;
 final Affordabilty affordabilty;
 final String id;
 

 MealItem({
  
   this.id,
   this.title,
   this.imageUrl,
   this.duration,
   this.affordabilty,
   this.complexity
 });

 String get complexitext{
   switch (complexity) {
     case Complexity.Simpel :
       return "Simple";
       break;
        case Complexity.Hard :
       return "Hard";
       break;
        case Complexity.Challenging :
       return "Challenging";
       break;
       
     default:
     return "IDK";
   }
 }

 String get affordabilityText{
   switch (affordabilty) {
     case Affordabilty.Affordable:
       return "Affordable";
       break;
       case Affordabilty.Pricey:
       return "Pricey";
       break;
       case Affordabilty.Luxurious:
       return "Expensive";
     default: 
     return "UNKNOW";
   }
 }
  void selectedMeal(BuildContext context){
   Navigator.of(context).pushNamed(
     ItemDeatil.routname,
     arguments:id,
   );
 }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=>selectedMeal(context),
      child: Card(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)
               ),
               elevation: 4,
               margin: EdgeInsets.all(10),
              child: Column(
          children: [
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(10) ,
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(imageUrl,height: 200,fit: BoxFit.cover,width: double.infinity,),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                   child: Container(
                    
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color: Colors.black54
                     ),
                     child: Center(
                       child: Text(title,style: GoogleFonts.quicksand(color: Colors.white,
                  fontSize: 26,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.fade
              
                ),
                     ),
                   ))],
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0,bottom: 10,left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [ 
                  Row(
                    children: [
                      Icon(Icons.alarm),
                      SizedBox(
                        width: 10,
                      ),
                       Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work  ),
                      SizedBox(
                        width: 10,
                      ),
                       Text(complexitext ),
                    ],
                  ),
                   Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 10,
                      ),
                       Text(affordabilityText ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}