import 'package:flutter/material.dart';

class secondpage extends StatelessWidget {
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
            Text(
              'Hello Kartik',
              style: TextStyle(
                fontFamily: 'Inter',
                height: 16.94 / 14,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            Text(
              "Let's see your heart's streak today",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: FontWeight.w300,
                height: 14.52 / 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column( // Added missing Column here to wrap the containers below
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      'Your SOS request has been raised',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        height: 16.94 / 14,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Ambulance arrival info
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: Color(0xFF664DEF),
                      width: 0.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ambulance Arriving in 6 Minutes',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          height: 16.94 / 14,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Heading towards the patient',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          height: 6.94 / 14,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 16),
                      // Progress bar
                      Row(
                        children: [
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.5,
                              backgroundColor: Colors.grey.shade300,
                              valueColor: AlwaysStoppedAnimation(Colors.purple),
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.location_on, color: Colors.purple),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Doctor video call
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Doctor info
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [

                            SizedBox(width: 10),
                            Text(
                              'Dr. Deepindra',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Video call area
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Icon(Icons.video_call, size: 50, color: Colors.grey),
                        ),
                      ),
                      // Call actions
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.mic, color: Colors.black),
                              onPressed: () {},
                            ),
                            SizedBox(width: 20),
                            IconButton(
                              icon: Icon(Icons.videocam_off, color: Colors.red),
                              onPressed: () {},
                            ),
                            SizedBox(width: 20),
                            IconButton(
                              icon: Icon(Icons.call_end, color: Colors.red),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Bottom buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.share, color: Colors.purple),
                        SizedBox(height: 4),
                        Text('Share Report'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.question_answer, color: Colors.purple),
                        SizedBox(height: 4),
                        Text('Any Queries'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
