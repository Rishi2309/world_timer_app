import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {
  String location; // location name for the UI
  String time;     // the time in that location
  String flag;     // url to an asset flag icon
  String url;      // location url for API endpoint
  bool isDaytime;

  WorldTime({ this.location, this.flag, this.url});

  Future<void> getTime() async {

    try{
      //make request to API endpoint
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      print(response.body);

      //get properties of data
      String datetime = data['datetime'];
      print(data['utc_offset']);
      String offset = data['utc_offset'].substring(1,3);

      //Create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      time = "Location not found";
    }

  }


}