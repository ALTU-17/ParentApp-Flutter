import 'package:flutter/material.dart';
import 'package:flutter_og/student_card.dart';
import 'package:flutter_og/student_profile_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "SASC EvolvU Smart Parent App(2024-2025)",
          style: TextStyle(fontSize: 14.sp, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink, Colors.blue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  StudentCard(), // Ensure this widget is correctly designed as per your UI requirements
                  SizedBox(height: 2.h),
                  Text(
                    "Student Activity",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(), // Disables GridView's scrolling
                    shrinkWrap: true, // Needed to make GridView work inside SingleChildScrollView
                    crossAxisCount: 3,
                    crossAxisSpacing: 2.3,
                    mainAxisSpacing: 1.2,
                    padding: const EdgeInsets.all(23),

                    children: List.generate(1, (index) {
                      return Card(
                        color: Colors.white.withOpacity(0.9),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => StudentProfilePage()),
                            );
                          },
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                height: 70.h,
                                'assets/boy.png',
                              ),
                              Text(

                                "Student Profile",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}