import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentProfilePage extends StatelessWidget {
  const StudentProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
     backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
     
       appBar: AppBar(
        // flexibleSpace:  Text(
        
        //           "Student Profile",
        //           style: TextStyle(
        //             fontSize: 18.sp,
        //             fontWeight: FontWeight.bold,
        //             color: Colors.white,
        //           ),
        //         ),
        toolbarHeight: 50.h,
        title: Text(
          "SASC EvolvU Smart Parent App(2024-2025)",
          style: TextStyle(fontSize: 14.sp, color: Colors.white),
        ),
       backgroundColor: Colors.transparent,
        elevation: 0,
        
      ),

      body: Container(
        height: double.infinity,
        
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 80.h,),
              Text(
                   
               "Student Profile",
               style: TextStyle(
                 fontSize: 18.sp,
                 fontWeight: FontWeight.bold,
                 color: Colors.white,
               ),
                              ),
                              SizedBox(height: 10.h,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  child: Container(
                  
                    color: Colors.transparent,
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                           height: 220.h,
                            width: 200.w,
                            child: Stack(
                              children: [
                                Positioned(
                                  height: 120.w,
                                  left: 0,
                                  right: 0,
                                  
                                  top: 50.h,
                                  child: ClipRRect(
                                    child:
                                    Image.asset( 'assets/boy.png',fit: BoxFit.contain,),
                                    
                                     
                                      
                                    
                                  ),
                                ),
                                Positioned(
                                  left: 130,
                                  bottom: 10,
                                  child: Container(
                                    width: 48.w,
                                    height: 48.h,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 1, 24, 43)
                                          .withOpacity(0.5),
                                      shape: BoxShape.circle,
                                    ),
                                    child:  IconButton(
                    
                                      icon:
                                     Icon (Icons.add),
                                      
                                      iconSize: 24.sp,
                                      color: Colors.white, onPressed: () {  },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your username',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your username',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your username',
                            ),
                          ),
                    
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your username',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your username',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your username',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your username',
                            ),
                          ),
                    
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your username',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your username',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your username',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your username',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your username',
                            ),
                          ),
                    
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your username',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your username',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your username',
                            ),
                          ),
                    
                          TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your username',
                            ),
                          ),
                          // Continue adding more fields or other widgets
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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