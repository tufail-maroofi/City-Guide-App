import 'package:flutter/material.dart';
import 'package:city_guide_project/Constants/Cities_Details.dart';
import 'package:city_guide_project/Screens/Cities_Description.dart';

class CitiesListPage extends StatefulWidget {
  @override
  State<CitiesListPage> createState() => _CitiesListPageState();
}

class _CitiesListPageState extends State<CitiesListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cities')),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          final city = cities[index];
          return ListTile(
            leading: Image.asset(
              city.imageUrl,
              width: 100,
              fit: BoxFit.cover,
            ),
            title: Text('${city.name}, ${city.country}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CitiesDescriptionScreen(city: city),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
