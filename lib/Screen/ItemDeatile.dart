import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal/Data/Dummy_data.dart';


class ItemDeatil extends StatelessWidget {
  static const routname = "/ItemDeatil";
  final Function toggleFavorites;
  final Function isFavorite;
  final bool _tap=false;
  ItemDeatil(this.isFavorite,this.toggleFavorites);
  Widget buildSectiotittle(BuildContext context,String text){
    return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Text(text,style: GoogleFonts.quicksand(
     fontWeight: FontWeight.bold,
     fontSize: 20, 
    ),));
  }
  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }
 
  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;
    final selectedmeal = Dummy_Meal.firstWhere((element) => element.id==mealid);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedmeal.title,style: GoogleFonts.quicksand(),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedmeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectiotittle(context,"Ingredient"),
            buildContainer(
              ListView.builder(
                itemCount: selectedmeal.ingredients.length,
                itemBuilder:(ctx,index)=>Card(
                 child: Text(selectedmeal.ingredients[index]),
                ) )
            ),
            buildSectiotittle(context,"Setps"),
            buildContainer(
              ListView.builder(
                itemCount: selectedmeal.steps.length,
                itemBuilder: (ctx,index)=>Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(child: Text("# ${(index+1)}"),),
                      title: Text(selectedmeal.steps[index]),
                    ),
                    Divider()
                  ],
                ))
            )
          ],
        ),

      ),

      floatingActionButton: FloatingActionButton(child: Icon(
       _tap?Icons.favorite_border_outlined:Icons.favorite,
      ),
      onPressed: ()=>toggleFavorites(mealid),
      ),
    );
  }
}
