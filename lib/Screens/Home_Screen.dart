import 'package:flutter/material.dart';
import 'package:city_guide_project/Auth/login_screen.dart';
import 'package:city_guide_project/Screens/user_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreenContent(),
    VerticalImageSlider(),
    UserScreen(),
  ];

  // Method to handle bottom navigation item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Method to handle logout
  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              border: InputBorder.none,
              icon: Icon(Icons.search, color: Color.fromARGB(255, 63, 226, 145)),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(255, 226, 131, 1),
                    Color.fromARGB(255, 63, 226, 145),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('images/city5.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'CITY GUIDE',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_filled, color: Color.fromRGBO(255, 208, 54, 1)),
              title: const Text(
                'Home',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                _onItemTapped(0); // Navigate to Home screen content
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_city, color: Color.fromRGBO(255, 208, 54, 1)),
              title: const Text(
                'Cities',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                _onItemTapped(1); // Navigate to Cities screen
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_2_outlined, color: Color.fromRGBO(255, 208, 54, 1)),
              title: const Text(
                'Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                _onItemTapped(2); // Navigate to Profile screen
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Color.fromRGBO(255, 208, 54, 1)),
              title: const Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onTap: () => _logout(context), // Logout functionality
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex], // Display selected screen based on index
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromRGBO(67, 255, 133, 1),

        animationDuration: Duration(milliseconds: 300),
        onTap: _onItemTapped, // Handle bottom navigation item tap
        items: [
          Icon(Icons.home, color: Colors.black),
          Icon(Icons.location_city, color: Colors.black),
          Icon(Icons.person, color: Colors.black),
        ],
      ),
    );
  }
}

// Home screen content widget
class HomeScreenContent extends StatelessWidget {
  final List<String> horizontalList = [
    'images/city1.jpg',
    'images/city2.jpg',
    'images/city3.jpg',
    'images/city4.jpg',
    'images/city5.jpg',
    'images/city6.jpg',
    'images/city7.jpg',
    'images/8.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(110),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Color(0xFFF65959),
                  ),
                  Text(
                    "Los Angeles, US",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: horizontalList.length,
                  itemBuilder: (context, index) {
                    return CityCard(imageUrl: horizontalList[index]);
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 70.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    HorizantalContainers(text: 'Parks'),
                    HorizantalContainers(text: 'Grounds'),
                    HorizantalContainers(text: 'Populars'),
                    HorizantalContainers(text: 'Libraries'),
                    HorizantalContainers(text: 'Hospitals'),
                    HorizantalContainers(text: 'Restaurants'),
                    HorizantalContainers(text: 'Best Places'),
                    HorizantalContainers(text: 'Most Visited'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Popular Cities Section
              Text(
                'Popular Cities',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
               CityBanner(cityName: 'Quetta', rating: 4.7),
                  CityBanner(cityName: 'Lahore', rating: 4.7),
                  CityBanner(cityName: 'Karachi', rating: 4.6),
                  CityBanner(cityName: 'Peshawar', rating: 4.4),
                  CityBanner(cityName: 'Islamabad', rating: 4.7),
                  CityBanner(cityName: 'Faisalabad', rating: 4.6),
                  CityBanner(cityName: 'Rawalpindi', rating: 4.4),
                  CityBanner(cityName: 'Abbottabad', rating: 4.4),
                  // Add more CityBanner widgets as needed
                ],
              ),
              SizedBox(height: 20),
              // Favorite Cities Section
              Text(
                'Favorite Cities',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  CityBanner(cityName: 'Quetta', rating: 4.7),
                  CityBanner(cityName: 'Lahore', rating: 4.7),  
                  CityBanner(cityName: 'Peshawar', rating: 4.4),
                  CityBanner(cityName: 'Islamabad', rating: 4.7),
                  CityBanner(cityName: 'Abbottabad', rating: 4.4),
                  // Add more CityBanner widgets as needed
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// City card widget
class CityCard extends StatelessWidget {
  final String imageUrl;

  CityCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      margin: EdgeInsets.only(right: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                'City Name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black45,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Icon(
                Icons.bookmark_border,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Horizontal containers widget
class HorizantalContainers extends StatelessWidget {
  final String text;

  const HorizantalContainers({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 63, 226, 145).withOpacity(0.6),
            spreadRadius: 4,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// City banner widget
class CityBanner extends StatelessWidget {
  final String cityName;
  final double rating;

  const CityBanner({Key? key, required this.cityName, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 192, 197, 192),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 14, 146, 36).withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cityName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Text(
                    '$rating',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // Add functionality for the button
            },
            child: Text(
              'Explore',   
                style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            // backgroundColor: Colors.black ,
            fontWeight: FontWeight.bold,
          ),
            ),
          ),
        ],
      ),
    );
  }
}

// Vertical image slider widget
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
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CityImages(imageUrl: verticalList[index]),
              SizedBox(height: 10),
              CityRating(),
              SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}

// City images widget
class CityImages extends StatelessWidget {
  final String imageUrl;

  CityImages({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
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

// City rating widget
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
