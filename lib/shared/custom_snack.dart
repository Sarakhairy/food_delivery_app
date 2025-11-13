import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';

SnackBar customSnack(errorMsg) {

 return SnackBar(
   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
   margin: const EdgeInsets.only(bottom: 30, right: 20, left: 20),
   elevation: 10,
   behavior: SnackBarBehavior.floating,
   backgroundColor: Colors.red,
   content: FittedBox(
     child: Row(
       children: [
         const Icon(CupertinoIcons.info, color: Colors.white),
         SizedBox(height: 14,),
         CustomText(
           text: errorMsg,
           color: Colors.white,
           size: 10,
           weight: FontWeight.w600,
         ),
       ],
     ),
   ),
 );
}