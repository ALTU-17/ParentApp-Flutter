import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
 // Update the import path accordingly
import 'package:shared_preferences/shared_preferences.dart';

import 'Login.dart';
import 'api.dart';
import 'main.dart';

// class LogUrls {
//
//   final String reg_id;
//   final String user_id;
//   final String academic_yr;
//   final String role_id;
//   final String name;
//
//   LogUrls({required this.reg_id, required this.user_id, required this.academic_yr, required this.role_id, required this.name});
//
//
//   factory LogUrls.fromJson(Map<String, dynamic> json) {
//     return LogUrls(
//         reg_id: json['reg_id'],
//         user_id: json['user_id'],
//         academic_yr: json['academic_yr'],
//         role_id: json['role_id'],
//         name: json['name']
//     );
//   }
//
//   // Method to serialize SchoolInfo object into JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'reg_id': reg_id,
//       'name': name,
//       'user_id': user_id,
//       'academic_yr': academic_yr,
//       'role_id': role_id
//     };
//   }
//
// }

class Login1 extends StatefulWidget {
  final String emailstr;

  Login1(this.emailstr);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login1> {
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  String shortName="";
  bool shouldShowText = false; // Set this based on your condition
  bool shouldShowText2 = false; // Set this based on your condition

  String Acdstr="";


  @override
  void initState() {
    super.initState();
    email = TextEditingController(text: widget.emailstr);
    // checkLoginStatus(); // Check login status when the login screen is initialized
  }

  void log(String ema, String pass) async {
    try {
      // final prefs = await SharedPreferences.getInstance();
      // // Retrieving a string value
      // String? school_info = prefs.getString('school_info');
      //
      // Map<String, dynamic> parsedData = json.decode(school_info!);
      //
      // // Access individual values from the parsed data
      // String schoolId = parsedData['school_id'];
      // String name = parsedData['name'];
      //  shortName = parsedData['short_name'];
      // String url = parsedData['url'];
      // String teacherApkUrl = parsedData['teacherapk_url'];
      // String projectUrl = parsedData['project_url'];
      // String defaultPassword = parsedData['default_password'];
      //
      // print('URL: $teacherApkUrl');

      http.Response response = await http.post(
        Uri.parse("https://sms.arnoldcentralschool.org/SACSv4test/index.php/" + "LoginApi/login"),
        body: {'user_id': ema, 'password': pass},
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        print('Success');



        if(response.body.contains('"error":true')){
          setState(() {
            shouldShowText = true;
          });

        } else{

          setState(() {
            shouldShowText = false;
          });

          // Parse the API response into SchoolInfo object
          // LogUrls logUrls = LogUrls.fromJson(jsonDecode(response.body));
          //
          // // Convert SchoolInfo object to JSON
          // String logDetJson = jsonEncode(logUrls.toJson());
          // Map<String, dynamic> logUrls11 = jsonDecode(logDetJson);
          //
          // // Extract the academic_yr field
          // String academicYr = logUrls11['academic_yr'];
          // print('logDetJson===>  $academicYr');
          //
          // // Store JSON string in shared preferences
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // prefs.setString('logUrls', logDetJson);

          // Store login status in SharedPreferences
          storeLoginStatus(true);
          // Navigate to QRScannerPage after successful login
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => NewLogin()),
          );


        }


      } else {

        setState(() {
          shouldShowText = true;
        });

        print('Failed');
        // Handle failed login
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  // Store login status in SharedPreferences
  Future<void> storeLoginStatus(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  // Check login status
  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      // If user is already logged in, navigate to QRScannerPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => NewLogin()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/img.png', // Replace with your background image
              fit: BoxFit.cover,
            ),
            Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Image.asset(
                      'assets/logo.png', // Replace with your logo image
                      width: 200,
                      height: 140,
                    ),

                    Image.asset(
                      'assets/school.png', // Replace with your logo image
                      width: 400,
                      height: 300,
                    ),



                    SizedBox(height: 60),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        enabled: false,
                        controller: email,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.person_outline),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.lock_person_outlined),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Checkbox(
                            value: false,
                            onChanged: (bool? newValue) {
                              // handle check box state change
                            },
                          ),
                        ),
                        Text('Show Password',style: TextStyle(fontSize: 14,
                        ),),
                        Spacer(), // Use Spacer to push the next widget to the end of the row
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: TextButton(
                            onPressed: () {
                              // Handle "Forgot password"
                            },
                            child: Text('Forgot password?', style: TextStyle(color: Colors.black),),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 5),
                    Visibility(
                      visible: shouldShowText, // Set this boolean based on your condition
                      child: Text(
                        'Login credentials are wrong. Please try again!',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: shouldShowText2, // Set this boolean based on your condition
                      child: Text(
                        'Please Enter Password!!',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                
                    SizedBox(height: 10),
                    Container(
                      height: 40,
                      width: 180,
                      decoration: BoxDecoration(
                          color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        onPressed: () {

                          if(password.text.toString().isEmpty){
                            setState(() {
                              shouldShowText2 = true;
                            });

                            Fluttertoast.showToast(
                              msg: 'Please Enter Password!!',
                              backgroundColor: Colors.black45,
                              textColor: Colors.white,
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                            );

                          } else {
                            setState(() {
                              shouldShowText2 = false;
                            });
                            log(email.text.toString(), password.text.toString());
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                
                    SizedBox(height: 30),
                    Text(
                      'aceventuraservices@gmail.com',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}