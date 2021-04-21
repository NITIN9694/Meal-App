

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal/Data/Dummy_data.dart';
import 'package:meal/Data/Meal.dart';
import 'package:meal/Screen/FavroriteScreen.dart';
import 'package:meal/Screen/categoriesmeal.dart';
import '../Widget/Drawerwidget.dart';
import '../Screen/HomeScreen.dart';
import '../Widget/ItemMeal.dart';


class TabBarScreen extends StatefulWidget {
  final List<Meal>favoriteMeal;
  TabBarScreen(this.favoriteMeal);
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
   List<Map<String,Object>>_page;
 
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _page= [
    {"page":Categoriesmeal(),
    "title":"Categories"
    },
   { "page":FavroiteScreen(widget.favoriteMeal),
   "title":'Your Favorite'
   }
  ];
  }

  int _selectPageIndex =0;
  
   void _selectPage(int index){
     setState(() {
       _selectPageIndex =index;
     });
  }
  TabController tabController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),
    appBar: AppBar(
      
      title: Text(_page[_selectPageIndex]["title"],style: GoogleFonts.quicksand(
        fontWeight: FontWeight.w600
      ),),
       
     ),
    body: _page[_selectPageIndex]["page"],   
    
   bottomNavigationBar:BottomNavigationBar(
     onTap:_selectPage,
     backgroundColor: Theme.of(context).primaryColor,
     currentIndex: _selectPageIndex,
     selectedItemColor: Theme.of(context).accentColor,
     unselectedItemColor: Colors.white,
     
     items: [
       BottomNavigationBarItem(icon: Icon(Icons.category_outlined),
       title: Text("Categories"),
       ),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),
       title: Text("Favorite"),
       )
     ],
   ) ,    
    );
  }
}