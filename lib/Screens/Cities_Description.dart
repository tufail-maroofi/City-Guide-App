import 'package:flutter/material.dart';
import 'package:city_guide_project/Constants/Cities_Data.dart';

class CitiesDescriptionScreen extends StatelessWidget {
  final Cities_Data city;

  CitiesDescriptionScreen({required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: ShapeDecoration(
                    color: Color(0xFFF3B107),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Image.asset(
                    city.imageUrl,
                    width: double.infinity,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.favorite_border, color: Colors.red),
                      onPressed: () {
                        // Handle favorite button press
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${city.name}, ${city.country}',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 24),
                            SizedBox(width: 4),
                            Text(
                              '4.5', // Replace with actual rating if available
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    city.description ?? 'No description available',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16,
                    
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: city.imageUrls.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          city.imageUrls[index],
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          '${city.name}, ${city.country}',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 8),
                            width: 100,
                            child: Image.asset(
                              city.imageUrls[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(70.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle add to favorite button press
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black, backgroundColor: const Color.fromARGB(255, 112, 240, 116), // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Rounded corners
            ),
            padding: EdgeInsets.symmetric(vertical: 12), // Padding
          ),
          child: Text(
            'Add to Favorite',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
