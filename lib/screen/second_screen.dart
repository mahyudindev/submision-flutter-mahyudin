import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SecondScreen(),
  ));
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String greetingMessage = 'Hii Coders';

  @override
  void initState() {
    super.initState();
    _updateGreetingMessage();
  }

  void _updateGreetingMessage() {
    final currentTime = DateTime.now();
    final currentHour = currentTime.hour;

    if (currentHour >= 5 && currentHour < 11) {
      setState(() {
        greetingMessage = 'Hii Coders Selamat Pagii';
      });
    } else if (currentHour >= 11 && currentHour < 15) {
      setState(() {
        greetingMessage = 'Hii Coders Selamat Siang';
      });
    } else if (currentHour >= 15 && currentHour < 18) {
      setState(() {
        greetingMessage = 'Hii Coders Selamat Sore';
      });
    } else if (currentHour >= 18 && currentHour < 22) {
      setState(() {
        greetingMessage = 'Hii Coders Selamat Malam';
      });
    } else {
      setState(() {
        greetingMessage = 'Hii Coders Selamat Begadang';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Selamat Datang',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              greetingMessage,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            buildImageRow(context, ['menu1.png', 'menu2.png', 'menu3.png']),
            buildImageRow(context, ['menu4.png', 'menu5.png', 'menu6.png']),
            buildImageRow(context, ['menu7.png', 'menu8.png', 'menu9.png']),
          ],
        ),
      ),
    );
  }

  Widget buildImageRow(BuildContext context, List<String> imageNames) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: imageNames
          .map((imageName) => buildImageContainer(context, imageName))
          .toList(),
    );
  }

  Widget buildImageContainer(BuildContext context, String imageName) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Image.asset(
        'images/$imageName',
        width: MediaQuery.of(context).size.width / 3 - 16.0,
        height: MediaQuery.of(context).size.width / 3 - 16.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
