import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

class AndroidIdScreen extends StatefulWidget {
  @override
  _AndroidIdScreenState createState() => _AndroidIdScreenState();
}

class _AndroidIdScreenState extends State<AndroidIdScreen> {
  String androidId = 'Loading...';
  String? _token;

  @override
  void initState() {
    super.initState();
    _getToken();
    getAndroidId();
  }

  Future<void> _getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print("TOKEN - $token");
    setState(() {
      _token = token;
    });
  }

  Future<void> getAndroidId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    setState(() {
      androidId = androidInfo.androidId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Android ID Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Android ID: $androidId'),
            if (_token != null) Text('Token: $_token'),
            ElevatedButton(
              onPressed: _getToken,
              child: Text('Get Token'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: AndroidIdScreen(),
  ));
}
