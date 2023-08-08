import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(double size,Color color, FontWeight fw){
  return GoogleFonts.montserrat(
    fontSize: size,
    color: color,
    fontWeight: fw,
  );
}

List selectableTimes = [
  "0",
 "300",
 "600",
 "900",
 "1200",
 "1500",
 "1800",
 "2100",
 "2400",
 "2700",
 "3000",
 "3300"
];

Color renderColor(String currentState){
  if (currentState == "focus"){
    return Color.fromARGB(255, 212, 23, 23);
  }
  else{
    return Color.fromARGB(255, 3, 244, 63);
  }
}