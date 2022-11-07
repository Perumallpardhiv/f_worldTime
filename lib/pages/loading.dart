import 'package:flutter/material.dart';
import 'package:f_worldtime2/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading>{

  String time = 'loading';
  Color? truFal;

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
    // print(instance.time);
    setState(() {
      truFal = instance.isDaytime ? Colors.blue[400] : Colors.indigo[700];
    });
  }

  @override
  void initState(){             // Runs only once at starting
    super.initState();
    setupWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: truFal,
      body: const Center(
          child: SpinKitSpinningLines(
            color: Colors.white,
            size: 80.0,
          ),
      ),
    );
  }
}
