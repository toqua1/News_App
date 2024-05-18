import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget{
  final IconData icon;
  final double size;
  final double iconSize;
  const AppBarIcon({super.key,required this.icon,this.size=40,this.iconSize=25});
  @override
  Widget build (BuildContext context){
    return  Container(
      height:40,
      width:40,

      decoration: BoxDecoration(
        shape:BoxShape.circle,
        color: Colors.grey.withOpacity(0.15),
      ),
      child:Icon(icon,size:iconSize),
    );
  }
}