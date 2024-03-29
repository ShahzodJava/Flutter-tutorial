import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;
  bool? isDaytime;

  WorldTime({required this.location, required this.flag, required this.url});
  
  Future<void> getTime() async {
    try {
      String worldTimeURI = 'http://worldtimeapi.org/api/timezone/$url';
      var response = await get(Uri.parse(worldTimeURI));
      Map data = jsonDecode(response.body);
      // print(data);

      String dataTime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(dataTime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = (now.hour > 6 && now.hour < 20) ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error $e');
      time = 'could not get time data';
    }
  }
}

