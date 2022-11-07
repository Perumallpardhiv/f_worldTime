import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; //location name for the UI
  late String time; //the time in that location
  late String flag; // url for asset flag icon
  late String url; // location url for api endpoint
  late bool isDaytime; // true or false if daytime or not

  // Constructor
  WorldTime({required this.location, required this.flag, required this.url });

  Future<void> getTime() async {
    // var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    // var res = await get(url);
    // print(res.body);
    //
    // // below lines work only after adding 3rd line in imports
    // Map data = jsonDecode(res.body);
    // print(data);
    // print(data['title']);

    try{
      // make the request
      var urll = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      Response res = await get(urll);
      Map data = jsonDecode(res.body);
      // print(data);

      // getting properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0,3);
      String offset2 = data['utc_offset'].substring(4,6);
      // print(datetime);
      // print(offset);
      // print(offset2);

      /* parse is used for converting string to given datatype */

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset), minutes: int.parse(offset2)));
      // print(now);

      // finding it's day or night
      isDaytime = now.hour >=6 && now.hour <19 ? true : false;

      // set the time property
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}
