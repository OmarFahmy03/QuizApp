import 'package:flutter/material.dart';

class guessMenu extends StatefulWidget {
  final String playerName;

  const guessMenu({super.key, required this.playerName});

  @override
  _guessMenuState createState() => _guessMenuState();
}

class _guessMenuState extends State<guessMenu> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['Paris', 'London', 'Berlin', 'Madrid'],
      'answer': 'Paris',
    },
    {
      'question': 'What is 2 + 2?',
      'options': ['3', '4', '2', '5'],
      'answer': '4',
    },
    {
      'question': 'Who won the FIFA World Cup in 2018?',
      'options': ['Egypt', 'Russia', 'Germany', 'France'],
      'answer': 'France',
    },
  ];

  int currentQuestionIndex = 0;
  String? selectedOption;
  int correctAnswers = 0; // Track correct answers

  void nextQuestion() {
    if (selectedOption == questions[currentQuestionIndex]['answer']) {
      correctAnswers++; // Increment if the answer is correct
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOption = null; // Reset selected option for the next question
      });
    } else {
      // Navigate to the Winner page and pass playerName and correctAnswers
      Navigator.pushNamed(
        context,
        '/winner',
        arguments: {
          'playerName': widget.playerName,
          'correctAnswers': correctAnswers,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'QUIZ',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Image(image: AssetImage('images/quiz.jpg')),
          SizedBox(height: 20),
          Container(
            width: 300,
            height: 430,
            decoration: BoxDecoration(
              color: Color.fromARGB(184, 101, 196, 72),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${currentQuestionIndex + 1}/${questions.length}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  currentQuestion['question'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                ...currentQuestion['options'].map<Widget>((option) {
                  bool isSelected = selectedOption == option;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = option;
                      });
                    },
                    child: Container(
                      width: 300,
                      height: 50,
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : Colors.white,
                        border: Border.all(
                          color: isSelected ? Colors.blue : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        option,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                Spacer(),
                Center(
                  child: ElevatedButton(
                    onPressed: selectedOption != null ? nextQuestion : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: Text('Next'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
