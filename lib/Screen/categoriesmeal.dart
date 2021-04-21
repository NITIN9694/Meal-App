import 'package:flutter/material.dart';
import 'package:meal/Data/Dummy_data.dart';
import 'package:meal/Screen/HomeScreen.dart';
import '../Widget/categoryitem.dart';


class Categoriesmeal extends StatefulWidget {

  
  @override
  _CategoriesmealState createState() => _CategoriesmealState();
}

class _CategoriesmealState extends State<Categoriesmeal> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
    
          body: InkWell(
          child: GridView(
        children:Dummy_Categories.map((e) => Categoryitem(
         e.title,e.color,e.id)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: 200,
             childAspectRatio: 3/2,
            crossAxisSpacing:30,
            mainAxisSpacing: 30, maxCrossAxisExtent: 350,
        ),
      ),
          ),
    );
  }
}