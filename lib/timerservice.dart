import 'dart:async';

import 'package:flutter/material.dart';


class TimerService extends ChangeNotifier {
  Timer? timer ;
  double currentDuration = 1500;
  double selectedTime = 1500;
  bool timerPlaying = false;
  int rounds = 0;
  int goal = 0;
  String currentState = "focus";

  void start(){
    timerPlaying = true;
    timer = Timer.periodic(Duration(seconds:1), (timer) {
      if(currentDuration == 0){
        handleNextRound();
      }else{
       currentDuration-- ; 
       notifyListeners(); 
      }
     });
  }

  void pause(){
    timer?.cancel();
    timerPlaying = false;
    notifyListeners();

  }

  void selectTime(double seconds){
    selectedTime = seconds;
    currentDuration = seconds;
    notifyListeners();
  }

  void reset(){
    timer?.cancel();
    currentState = "focus";
    currentDuration = selectedTime = 1500;
    rounds = goal = 0;
    timerPlaying = false;
    notifyListeners();
  }

  void handleNextRound(){
    if(currentState == "focus" && rounds != 3 ){
      currentState = "break";
      currentDuration = 300;
      selectedTime = 300;
      rounds++;
      goal++;
    }
    else if(currentState == "break"){
      currentState = "focus";
      currentDuration = 1500;
      selectedTime = 1500;
    }
    else if(currentState == "focus" && rounds == 3){
      currentState = "long break";
      currentDuration = 1500;
      selectedTime = 1500;
      rounds++;
      goal++;
    }
    else if (currentState == "long break"){
      currentState = "focus";
      currentDuration = 1500;
      selectedTime = 1500;
      rounds = 0;
    }
    notifyListeners();
  }
}

