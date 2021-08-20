import 'package:flutter/material.dart';

import 'detail_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  List<String> cityWeather = ["Esbjerg", "Aalborg", "Aarhus"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Proffessionelt udviklet vejrapp"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("Add a city"),
        icon: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: cityWeather.length,
                itemBuilder: (context, index) {
                  String title = cityWeather[index];
                  return ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return DetailPage(title);
                      }));
                    },
                    title: Text(title),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
