import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    // data = ModalRoute.of(context)?.settings.arguments as Map;
    // print(data);

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    // setting background
    String bgImg = data['isDaytime'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDaytime'] ? Colors.blue[400] : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context,'/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'flag': result['flag'],
                        'isDaytime': result['isDaytime'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/${data['flag']}',
                      width: 25.0,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      data['location'],
                      style: const TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: const TextStyle(
                    fontSize: 60.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
