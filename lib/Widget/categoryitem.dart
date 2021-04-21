import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal/Screen/HomeScreen.dart';

class Categoryitem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  Categoryitem(
    
   this.title,
   this.color,
   this.id
     );
     void selectedCategory(BuildContext context){
     Navigator.of(context).pushNamed(
       MealImage.routname,arguments: {"id":id,"title":title   } 
     );
     }
  @override
  Widget build(BuildContext context) {
   
    return 
         Padding(
           padding: const EdgeInsets.only(top:8.0),
           child: InkWell(
             onTap:()=>selectedCategory(context),
             splashColor:Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(12),
                      child: Container(
                height: 100,
             padding: const EdgeInsets.all(20),
             decoration: BoxDecoration(
               boxShadow: [
                 BoxShadow(
                   offset: Offset(1.0,1.0),
                   spreadRadius: 0.0,
                   blurRadius: 0.6,
                   color: Colors.black12
                 )
               ],
               borderRadius: BorderRadius.circular(40),
               gradient: LinearGradient(
                 colors: [
                 color.withOpacity(0.5),
                 color,
                 ],
                 begin: Alignment.topLeft,
                 end: Alignment.bottomRight
               ),
              ),
              child: Center(
                child: Text(title,style: GoogleFonts.quicksand(
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                )),
              ),
      ),
           ),
         );
  }
}