import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentCard extends StatelessWidget {
  StudentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: 120.h,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox.square(
                dimension: 70.w,
                child:
                Image.asset(
                  'assets/boy.png', // Replace with your actual background image path

                ),
              ),
              Expanded(
                flex: 2,
                child:  Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "GADDIEL",
                      style: TextStyle(fontWeight: FontWeight.bold),

                    ),
                    Text(
                      "RollNo: 16",
                      style: TextStyle(fontSize: 10.sp,color: Colors.red),
                    ),
                  ],
                  //  dense: true,
                ),
              ),
              Transform.rotate(
                child: Container(
                  width: 2.w,
                  height: 70.h,
                  color: Color.fromARGB(255, 175, 167, 167),
                ),
                angle: -math.pi / 180.0,
              ),
              Expanded(
                child:   Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Class",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "8D",
                      style: TextStyle(fontSize: 10.sp,color: Colors.red),
                    ),
                  ],
                  //  dense: true,
                ),
              ),
              Transform.rotate(
                child: Container(
                  width: 2.w,
                  height: 70.h,
                  color: Color.fromARGB(255, 175, 167, 167),
                ),
                angle: -math.pi / 180.0,
              ),

              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Teacher",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "MEENA BISHT",
                          style: TextStyle(fontSize: 10.sp,color: Colors.red),
                        ),
                      ],
                      //  dense: true,
                    ),
                  )),
              //   ListTile(),
              // Column(),
              // Column(),
            ],
          ),
        ),
      ),
    );
  }
}