import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:location_app/weather.dart';

class DetailPage extends StatelessWidget {
  final String title;
  DetailPage(this.title);

  Future<Weather> getWeather(String city) async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=c4a921728a252cf1f5c18756b8c5a75c&units=metric');
    var response = await http.get(
      url,
    );
    return Weather.fromBody(json.decode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<Weather>(
          future: getWeather(title),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  ListTile(
                      title: Text(
                          snapshot.data!.temperature.toString() + " grader"),
                      leading: Image.network(
                          'https://www.freeiconspng.com/thumbs/temperature-icon-png/temperature-icon-png-1.png',
                          height: 42.0)),
                  ListTile(
                    title: Text(snapshot.data!.description),
                    leading: Image.network(
                        'http://openweathermap.org/img/wn/${snapshot.data!.icon}@2x.png'),
                  )
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
