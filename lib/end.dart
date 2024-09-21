import 'package:flutter/material.dart';

class Winner extends StatelessWidget {
  final String playerName; // Holds the player's name
  final int correctAnswers; // Holds the number of correct answers

  const Winner({super.key, required this.playerName, required this.correctAnswers}); // Accept playerName and correctAnswers

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          children: [
            // Background container
            Positioned(
              top: 300,
              left: 50,
              child: Container(
                width: 320,
                height: 200,
                decoration: BoxDecoration(
                  color: Color.fromARGB(29, 4, 151, 114),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            // Text positioned inside the container
            Positioned(
              top: 330,
              left: 70,
              child: Column(
                children: [
                  Text(
                    '$playerName has completed the quiz!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'your score: $correctAnswers/3.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            // Button positioned at the bottom of the container
            Positioned(
              top: 450,
              left: 160,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(184, 101, 196, 72),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text(
                  "Menu",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            // "Congratulations!" label at the top
            Align(
              alignment: Alignment(0, -0.35),
              child: Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromARGB(184, 101, 196, 72),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Congratulations!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
