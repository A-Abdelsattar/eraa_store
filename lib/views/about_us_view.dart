import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is a sample app This is a sample app This is a sample app This is a sample app.',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/appIcon.png',
              height: 100,
            ),
            SizedBox(height: 20),
            Text(
              'For more information, visit our website:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            GestureDetector(
              child: Text(
                'https://openai.com',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              onTap: () {
                // Add code to open your website in a web browser.
              },
            ),
          ],
        ),
      ),
    );
  }
}