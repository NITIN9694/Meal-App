import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterScren extends StatefulWidget {
   static const routname = "/filter";
   final Function savefilter;
   final Map<String, bool>currentFilter;

   FilterScren(this.savefilter,this.currentFilter); 

  @override
  _FilterScrenState createState() => _FilterScrenState();
}

class _FilterScrenState extends State<FilterScren> {


  bool _glutenfree = false;
  bool _vegetrian = false;
  bool _vegan = false;
  bool _loctosFree = false; 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _glutenfree =widget.currentFilter["gluten"]; 
      _vegetrian =widget.currentFilter["vegetarian"]; 
       _vegan=widget.currentFilter["vegan"]; 
      _loctosFree =widget.currentFilter["lactos"]; 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: (){
          
            final selectfilter={
              "gluten":_glutenfree,
              "lactos":_loctosFree,
              "vegan":_vegan,
              "vegetarian":_vegetrian
            };
              widget.savefilter(selectfilter);
          })
        ],
        title: Text("Your Filters",style: GoogleFonts.quicksand(),),
         
      ),
      body: Column(
        children: [  
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(child: Text("Adjust Your meal selection",style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w800,
              fontSize: 20
            ),),),
          ),
          Expanded(child: ListView(children: [
            SwitchListTile(
              title: Text("Gluten-Free",style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w800
              ),),
              value: _glutenfree,
              subtitle: Text("Only include gluten free meal",style: GoogleFonts.quicksand(), ),
               onChanged: (newvalue){
                 setState(() {
                   _glutenfree =newvalue;
                 });
               }),
                 SwitchListTile(
              title: Text("Vegan-Free",style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w800
              ),),
              value: _vegan,
              subtitle: Text("Only include Vegan free meal",style: GoogleFonts.quicksand(

              ), ),
               onChanged: (newvalue){
                 setState(() {
                   _vegan =newvalue;
                 });
               }),
                 SwitchListTile(
              title: Text("Vegetrian-Free",style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w800
              ),),
              value: _vegetrian,
              subtitle: Text("Only include Vegetrian free meal",style: GoogleFonts.quicksand(), ),
               onChanged: (newvalue){
                 setState(() {
                   _vegetrian =newvalue;
                 });
               }),
                 SwitchListTile(
              title: Text("LoctosFree-Free",style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w800
              ),),
              value: _loctosFree,
              subtitle: Text("Only include Loctos free meal",style: GoogleFonts.quicksand(), ),
               onChanged: (newvalue){
                 setState(() {
                   _loctosFree =newvalue;
                 });
               })
          ],))
        ],
      ),
    );
  }
}