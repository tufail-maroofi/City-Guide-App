import 'package:flutter/material.dart';
class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                     begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                         Color.fromRGBO(255, 226, 131, 1),
                    Color.fromARGB(255, 63, 226, 145),
                      ],
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('Images/city5.jpg'), 
                    ),
                    SizedBox(height: 10),
                    Text(
                      'CITY GUIDE',
                      style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'cityguideapp.com',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildSectionTitle('Support'),
                _buildListTile('FAQs', Icons.help),
                _buildSectionTitle('Account Settings'),
                _buildListTile('Profile', Icons.person),
                _buildListTile('About App', Icons.info),
                _buildListTile('Privacy Policy', Icons.lock),
                _buildListTile('Cities Map', Icons.location_on),
                _buildListTile('Contact Us', Icons.contact_mail),
                _buildListTile('Terms & Conditions', Icons.description),
          
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildListTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
      
      },
    );
  }
}
