import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  final String emailstr;

  LoginPage(this.emailstr);

  @override
  _LoginState createState() => _LoginState();
}


class _LoginState extends State<LoginPage> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.blue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [


              Positioned(
                left: 0,
                right: 0,
                top: 100,
                child: Image.asset(
                  'assets/school.png',
                  //  fit: BoxFit.cover,
                ),
              ),
              // Login form with custom-shaped background
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipPath(
                  clipper: TopCurvedClipper(), // Use the custom clipper here
                  child: Container(
                    color: Colors.white,
                    padding:
                    EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const TextField(

                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (bool? newValue) {
                                // handle check box state change
                              },
                            ),
                            Text('Show Password'),
                            Spacer(), // Use Spacer to push the next widget to the end of the row
                            TextButton(
                              onPressed: () {
                                // Handle "Forgot password"
                              },
                              child: Text('Forgot password?', style: TextStyle(color: Colors.black),),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            // Navigator.of(context).pushNamed(studentActivityPage);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            Colors.blueAccent, // Button background color
                            shape: StadiumBorder(),
                            padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),)
    );
  }
}

class TopCurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0,
        40); // Start from the left corner and draw a line to the point where the curve starts
    path.quadraticBezierTo(
        size.width / 2, 0, size.width, 40); // Create a quadratic bezier curve
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TopCurvedClipper oldClipper) => false;
}