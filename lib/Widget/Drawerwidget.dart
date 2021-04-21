import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal/Screen/FilterScreen.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.2,
            
            width: double.infinity,
            color: Colors.redAccent[100],
            child: Center(
              child: Text("Cooking Up!",style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 30
          ),),
            ),),
            Padding(
              padding: const EdgeInsets.only(left:18.0,top: 20),
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed("/main");
                    },
                  child: Row(
                      
                      children: [
                        Icon(Icons.restaurant),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Meal",style: GoogleFonts.quicksand(
                          fontSize: 15,
                          fontWeight: FontWeight.w700
                        ),)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                   InkWell(
                     onTap: (){
                       Navigator.of(context).pushNamed(FilterScren.routname);
                     },
                                        child: Row(
                children: [
                  Icon(Icons.settings),
                     SizedBox(
                      width: 20,
                  ),
                  Text("Filters",style: GoogleFonts.quicksand(
                      fontSize: 15,
                      fontWeight: FontWeight.w700
                  ),)
                ],
              ),
                   )
                ],
              ),
            ),
           
        ],
      ),
    );
  }
}