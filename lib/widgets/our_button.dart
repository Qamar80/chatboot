
import 'package:flutter/material.dart';



   Widget ourButton({
  required VoidCallback onPress,
  required Color color,
  required Color textColor,
  required String title,

    }){
   return ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: color,
   padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 80),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  ),
  onPressed: onPress,
    child:  Text(
       title,
       style: const TextStyle(color: Colors.white, fontSize: 16),
       ),
   );
     }