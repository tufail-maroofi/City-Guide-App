import 'package:flutter/material.dart';

class VerticalImageSlider extends StatelessWidget {
  final List<String> verticalList = [
    'images/city1.jpg',
    'images/city2.jpg',
    'images/city3.jpg',
    'images/city4.jpg',
    'images/city5.jpg',
    'images/city6.jpg',
    'images/city7.jpg',
    'images/city3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: verticalList.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // City Image
              CityImages(imageUrl: verticalList[index]),
              SizedBox(height: 10),
              // City Name and Rating
              CityRating(),
              SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}

class CityImages extends StatelessWidget {
  final String imageUrl;

  CityImages({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350, // Adjust height as needed
      margin: EdgeInsets.only(bottom: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CityRating extends StatelessWidget {
  const CityRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "City Name",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.more_vert, size: 30),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 20),
            Icon(Icons.star, color: Colors.amber, size: 20),
            Icon(Icons.star, color: Colors.amber, size: 20),
            Icon(Icons.star, color: Colors.amber, size: 20),
            Icon(Icons.star, color: Colors.amber, size: 20),
            Text(
              "4.5",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
