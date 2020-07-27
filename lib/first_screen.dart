import 'package:flutter/material.dart';
import 'login_page.dart';
import 'sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'qrscanner.dart';

class FirstScreen extends StatelessWidget {
  var myDatabase = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('IT Interns are the best!!')),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Krea\'s Official App!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 40.0,
                  color: Colors.black),
            ),
            SizedBox(height: 30.0),
            Container(
              child: Image.asset('assets/krea.png'),
            ),
            SizedBox(
              height: 50.0,
              width: 250.0,
              child: Divider(color: Colors.blueAccent),
            ),
            Icon(
              Icons.face,
              size: 120,
            ),
            Text(
              'Akshay Jain',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Krea_StudentLife_Level_100',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.normal,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 20.0),
            RaisedButton(
                onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }))),
            FloatingActionButton.extended(
              onPressed: () {
                signOutGoogle();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }), ModalRoute.withName('/'));
              },
              backgroundColor: Colors.blue,
              icon: Icon(Icons.lock),
              label: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FirstScreen());
}
