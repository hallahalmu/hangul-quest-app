import 'dart:math';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, dynamic>> allQuestions = [
    {"letter": "ㄱ", "options": ["g/k", "n", "r/l"], "answer": "g/k"},
    {"letter": "ㄴ", "options": ["g/k", "n", "r/l"], "answer": "n"},
    {"letter": "ㄷ", "options": ["d/t", "m", "s"], "answer": "d/t"},
    {"letter": "ㅈ", "options": ["j", "k", "p"], "answer": "j"},
    {"letter": "ㅊ", "options": ["ch", "h", "r"], "answer": "ch"},
    {"letter": "ㅗ", "options": ["u", "o", "i"], "answer": "o"},
    {"letter": "ㅛ", "options": ["yo", "yu", "ya"], "answer": "yo"},
    {"letter": "ㅜ", "options": ["u", "eo", "e"], "answer": "u"},
    {"letter": "ㅍ", "options": ["p", "b", "m"], "answer": "p"},
    {"letter": "ㅎ", "options": ["h", "ch", "k"], "answer": "h"},
  ];

  late List<Map<String, dynamic>> questions;
  int current = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _shuffleQuestions();
  }

  void _shuffleQuestions() {
    final random = Random();
    questions = List.of(allQuestions)..shuffle(random);
    current = 0;
    score = 0;
  }

  void checkAnswer(String choice) {
    if (choice == questions[current]["answer"]) score += 10;
    setState(() {
      if (current < questions.length - 1) {
        current++;
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Quiz Completed!'),
            content: Text('Your score: $score'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() => _shuffleQuestions());
                },
                child: const Text('Retry'),
              )
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[current];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Time'),
        backgroundColor: const Color(0xFF2056D1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('How is "${question["letter"]}" pronounced?',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center),
            const SizedBox(height: 30),
            ...List.generate(
              question["options"].length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                  onPressed: () => checkAnswer(question["options"][index]),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2056D1),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: Text(
                    question["options"][index],
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text('Score: $score',
                style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF2056D1),
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
