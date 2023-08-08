import 'package:flutter/material.dart';
import 'package:pomodoro_timer/utis.dart';
import 'package:provider/provider.dart';
import 'package:pomodoro_timer/timerservice.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${provider.rounds}/4",style: textStyle(30, Colors.white, FontWeight.bold)),
            Text("${provider.goal}/12",style: textStyle(30, Colors.white, FontWeight.bold))
          ],
        ),
        SizedBox(height: 10,),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("round",style: textStyle(25, Colors.white, FontWeight.bold)),
            Text("goal",style: textStyle(25, Colors.white, FontWeight.bold))
          ],
        )
      ],
    );
  }
}