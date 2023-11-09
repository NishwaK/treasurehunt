import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class hintScreen extends StatefulWidget {

  const hintScreen({super.key});

  @override
  State<hintScreen> createState() => _hintScreenState();
}

class _hintScreenState extends State<hintScreen> {
  final List<String> hints = [
    "Hint 1: Where stars shimmer in the velvet night, seek the first clue, a glimmering light.",
    "Hint 2: A place where time stands still and dreams take flight, your next step is where day turns into night.",
    "Hint 3: Through nature's embrace, where river and tree unite, follow the stream and let your heart take flight.",
    // Add more hints here
  ];

  int currentHintIndex = 0;
  void showNextHint() {
    setState(() {
      // Increment the index to show the next hint
      currentHintIndex++;

      // Check if all hints have been shown, and loop back to the first hint
      if (currentHintIndex >= hints.length) {
        currentHintIndex = 0;
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
                icon:Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  // Navigate back to the AR treasure screen
                  Navigator.of(context).pop();
                },
              ),
              title: Text('Hint Screen',
                style:GoogleFonts.norican(
                  textStyle: TextStyle(
                    fontSize: 24,
                      color: Colors.white // Set your preferred font size
                 // You can also customize other text styles here.
                  ),
              ),),
              
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/paper4.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child:
         Center(
           child:
         Align(
          alignment: Alignment.centerRight,
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal:18.0),
             child: Text(
              hints[currentHintIndex],
              style: GoogleFonts.norican(
                textStyle: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
                 ),
           ),
         ),
    
    ),));
  }
}