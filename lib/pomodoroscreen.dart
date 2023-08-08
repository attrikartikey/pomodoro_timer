import 'package:flutter/material.dart';
import 'package:pomodoro_timer/widgets/timercard.dart';
import 'package:pomodoro_timer/widgets/timeoptions.dart';
import 'utis.dart';
import 'package:pomodoro_timer/widgets/timecontroller.dart';
import 'package:pomodoro_timer/widgets/progresswidget.dart';
import 'package:provider/provider.dart';
import 'package:pomodoro_timer/timerservice.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Scaffold(
      backgroundColor: renderColor(provider.currentState),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: renderColor(provider.currentState),
        title: Text(
          "pomodoro",
          style: textStyle(25, Colors.white, FontWeight.w700),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            iconSize: 40,
            onPressed: () => Provider.of<TimerService>(context, listen : false).reset(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
          children: [
            SizedBox(height: 15),
            TimerCard(),
            SizedBox(height:40,),
            TimeOptions(),
            SizedBox(height: 40,),
            TimeController(),
            SizedBox(height: 80,),
            ProgressWidget()
          ],
          ),
        ),
      ),
    );
  }
}
