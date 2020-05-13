import 'package:flutter/material.dart';
import 'package:world_timer_app/services/world_timer.dart';



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "loading";
  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'german.png', url: 'Europe/Berlin');
    await instance.getTime();
    print(instance.time);
    setState(() {
      time = instance.time;
    });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: Text(time),
      )
    );
  }
}
