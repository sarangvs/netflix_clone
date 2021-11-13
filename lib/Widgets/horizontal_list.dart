import 'package:flutter/material.dart';


class HorizList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 100.0,

      child:  ListView.builder(itemBuilder: (context, index){
        return  Card(child:  Container(width: 80.0,
          child:  const Text('Hello'),alignment: Alignment.center,));
      }, scrollDirection: Axis.horizontal,),
    );
  }
}