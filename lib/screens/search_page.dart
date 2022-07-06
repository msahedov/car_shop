import 'dart:math';

import 'package:car_shop/constants/page_routs.dart';
import 'package:car_shop/objects/car_item_object.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class SearchScreen extends SearchDelegate<CarItemObject>{
  
  ///Variables
  List<CarItemObject> cars=CarItemObject.allCars;
  late final List<String> _history=[];
  


  ///style
  @override
  InputDecorationTheme? get searchFieldDecorationTheme => super.searchFieldDecorationTheme;
 
  @override
  TextStyle? get searchFieldStyle => const TextStyle(fontFamily:descFont,fontSize:20);



///Shows
  @override
  List<Widget>? buildActions(BuildContext context) {
   return [
    IconButton(onPressed: (){query="";}, icon:const Icon(Icons.clear,size: 25,color: Colors.black,))     
   ];
  }

  
  @override
  Widget? buildLeading(BuildContext context) {
    return BackButton(color: Colors.black,onPressed: ()=>Navigator.pop(context));
  }


  @override
  Widget buildResults(BuildContext context) {
   List<CarItemObject> results=cars.where((car) => car.carName.toLowerCase().contains(query) || car.carName.toUpperCase().contains(query) ).toList();
    return ListView.builder(
     itemCount: results.length,//_history.length,
     itemBuilder: (context,index)=>ListTile(
       onTap: ()=>close(context, results[index]),
       leading:Image.asset(results[index].imageName,height: 100,width: 100,fit: BoxFit.contain),title:Text(results[index].carName,style:Theme.of(context).textTheme.headline6),
  ));
  
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   
   return ListView.builder(
     itemCount: _history.length,
     itemBuilder: (context,index)=>ListTile(onTap: (){
       query=_history[index];
       showResults(context);
     },leading:const Icon(Icons.history,size:30),title:Text(_history[index],style:Theme.of(context).textTheme.headline6),
   trailing:Transform.rotate(angle: pi/4,child: IconButton( onPressed: (){
     query=_history[index];
   },icon: const Icon(Icons.arrow_back,size: 30,)))));
  
  }
}