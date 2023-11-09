import 'package:flutter/material.dart';
import 'package:treasuredemo/ar_treasure_hunt_screen.dart';

class splashPage extends StatefulWidget {
  const splashPage({super.key});

  @override
  State<splashPage> createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {
  @override
  void initState() {
    super.initState();
    // Add a delay of 12 seconds before navigating to the Artreasure page
    Future.delayed(Duration(seconds: 8), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Artreasure(),
        ),
      );
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child:
         Center(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              CircularProgressIndicator(), // Loading indicator
            ],
        ),
         ),
      ),
    );
  }
}