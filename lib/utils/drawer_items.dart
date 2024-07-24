import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/drawer.dart'; 

class DrawerItems{

  final List<Items> items = [ //Lista de elementos del drawer
      Items(
        title: 'Welcome', 
        icon: Icons.home, 
        subtitle: 'Welcome to Reciprocity'),
      Items(
        title: 'Guidelines', 
        icon: Icons.gavel, 
        subtitle: 'Behave yourself'),
      Items(
        title: 'Posts', 
        icon: Icons.description, 
        subtitle: 'The latest posts of the development team'),
      Items(
        title: 'FAQ', 
        icon: Icons.help, 
        subtitle: 'Ask about your doubts'),
      Items(
        title: 'What is new?', 
        icon: Icons.grade, 
        subtitle: 'See the latest updates!'),
    ];
}

class DrawerItemsInicio{

  final List<Items> items = [ //Lista de elementos del drawer de inicio
      Items(
        title: 'Tests', 
        icon: Icons.assignment, 
        subtitle: 'Choose any available exam'),
      Items(
        title: 'Video Meetings', 
        icon: Icons.video_call, 
        subtitle: 'Choose what you will talk about')
    ];
}

