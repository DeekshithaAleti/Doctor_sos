import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'secondpage.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: EmergencyHelpScreen(),
  ));
}

class HeartClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double width = size.width;
    double height = size.height;

    path.moveTo(width * 0.5, height * 0.3); // Start from the middle top
    path.cubicTo(width * 0.1, -height * 0.1, -width * 0.1, height * 0.6, width * 0.5, height); // Left side heart
    path.cubicTo(width * 1.1, height * 0.6, width * 0.9, -height * 0.1, width * 0.5, height * 0.3); // Right side heart

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class EmergencyHelpScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<EmergencyHelpScreen> {
  int _selectedIndex=0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; 
    });
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://via.placeholder.com/150', // Replace with user's image URL
            ),
          ),
        ),
    title: const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const Text(
          'Hello Kartik',
          style: TextStyle(fontFamily: 'Inter',
            height: 16.94 / 14,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black),
        ),
        Text(
          "Let's see your heart's streak today",
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            fontWeight: FontWeight.w300,
            height: 14.52 /12,
            color: Colors.grey,
          ),
        ),
        ],
    ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],

      ),
      body: SingleChildScrollView(
        child:  _selectedIndex==0? Padding(

          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              
              Stack(
                clipBehavior: Clip.none,
                children: [
                  
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Color(0xFF664DEF),
                        width: 0.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3), 
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 60.0),
                      child: Column(
                        children: [
                          Text(
                            "Emergency help needed?",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black, 
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4), 
                          Text(
                            "Just hold the button to call",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54, 
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                  // Heart Shaped Button Positioned Partially Outside the Panel
                  Positioned(
                    bottom: -40,
                    left: MediaQuery.of(context).size.width / 2 - 70, 
                    child:

                     ClipPath(
                      clipper: HeartClipper(),
                      child: Container(
                        height: 140, // Increased height for the heart
                        width: 140, // Increased width for the heart
                        color: Colors.red, // Heart color
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(12), // Adjusted padding for the button
                            ),
                            child: Text("SOS", style: TextStyle(fontSize: 18, color: Colors.red)),
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>secondpage()));// Add SOS action

                            },
                          ),
                        ),
                      ),
                    ),

                  ),
                ],
              ),
              SizedBox(height: 60), // Additional space to accommodate the heart shape outside the panel
              // Risk Assessment Panel
              Stack(
                clipBehavior: Clip.none, // Allows the button to be outside the container
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5, // Add elevation to create a shadow effect
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Set the background color to white
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color(0xFF664DEF),
                          width: 0.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // Shadow position
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            // Warning Sign (Using the provided icon)
                            Icon(
                              IconData(0xf4ae, fontFamily: 'MaterialIcons'),
                              color: Colors.purple, // Set the icon color to purple
                              size: 50, // Size of the warning sign
                            ),
                            SizedBox(width: 16),
                            // Risk Assessment Text
                            Text(
                              "Risk Assessment",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            // Circular Progress Bar
                            CircularPercentIndicator(
                              radius: 50.0, // Size of the progress bar
                              lineWidth: 6.0,
                              animation: true,
                              percent: 0.65,
                              center: Text(
                                "65%",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              progressColor: Colors.purple, // Changed color to purple
                              backgroundColor: Colors.grey[300] ?? Colors.grey, // Use a non-null color
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Pill-Shaped Button Positioned Partially Outside the Panel
                  Positioned(
                    bottom: -30, // Positioning the button outside the panel
                    left: MediaQuery.of(context).size.width / 2 - 80, // Centering the button
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30), // Pill shape
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Set the background color to white
                          border: Border.all(color: Colors.purple, width: 2), // Purple border
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextButton(
                          onPressed: () {
                            // Add your calculate action here
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Padding for the button
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Calculate",
                                  style: TextStyle(color: Colors.purple, fontSize: 14), // Purple text
                                ),
                                SizedBox(width: 8), // Space between text and icon
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.purple, // Purple arrow color
                                  size: 18, // Icon size
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Scheduled Appointment',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

         Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.1), // Panel background color (10% purple)
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          // Doctor's Image with Purple Border
                          Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.purple, width: 2), // Purple border
                            //   borderRadius: BorderRadius.circular(10), // Rounded corners for the border
                            // ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10), // Rounded corners for the image
                              child: Image.asset('images/image3.jpeg'), // Replace with doctor's image URL
                                width: 100, // Increased width of the image
                                height: 100, // Increased height of the image
                                fit: BoxFit.cover, // Cover the area
                              ),
                            ),
                          ),
                          SizedBox(width: 16), 
                          // Doctor's Name and Consultation Type
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dr. Ashutosh Misra",e
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4), 
                                // Consultation Type and Time in the same box
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), 
                                  decoration: BoxDecoration(
                                    color: Colors.purple.withOpacity(0.25), 
                                    borderRadius: BorderRadius.circular(20), 
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "General Consultation", 
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white, 
                                        ),
                                      ),
                                      SizedBox(height: 4), 
                                      Text(
                                        "10:30 AM", 
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white, 
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Token Number Rectangle
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.purple.withOpacity(0.5), // Token number rectangle color (50% purple)
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20), 
                                bottomLeft: Radius.circular(20), 
                              ), // Rounded rectangle
                            ),
                            child: Text(
                              "Token No. 5", 
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white, 
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // "Starts in 10 mins" Text in the Top Right Corner
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.purple.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Starts in 10 mins",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'How It Helps',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ):const SizedBox(),
      ),
      bottomNavigationBar: Container(


        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.cyan,   
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit_calendar),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],

        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

