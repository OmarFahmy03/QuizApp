import 'package:day18_quiz/guess.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController playerNameController = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(children: [
          Align(
            alignment: Alignment(0, -.6),
            child: Text(
              'QUIZ',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, -.35),
            child: SizedBox(
              width: 200,
              height: 200,
              child: ClipOval(
                child: Image(
                  image: AssetImage('images/quiz.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.35),
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color: Color.fromARGB(29, 4, 151, 114), 
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Please Enter Your Name',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: playerNameController,
                      decoration: InputDecoration(
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      String name = playerNameController.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => guessMenu(playerName: name),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 72, 214, 108),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'START QUIZ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.05),
            child: Container(
              width: 150,
              height: 30,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 72, 214, 108),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'WELCOME',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
