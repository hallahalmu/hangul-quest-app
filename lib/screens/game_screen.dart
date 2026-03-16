import 'package:flutter/material.dart';
import 'dart:math';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<Map<String, String>> letters = [
    {"letter": "ㄱ", "sound": "g/k"},
    {"letter": "ㄴ", "sound": "n"},
    {"letter": "ㄷ", "sound": "d/t"},
    {"letter": "ㅁ", "sound": "m"},
    {"letter": "ㅂ", "sound": "b/p"},
    {"letter": "ㅅ", "sound": "s"},
  ];
  late Map current;
  int score = 0;

  @override
  void initState() {
    super.initState();
    newRound();
  }

  void newRound() {
    final random = Random();
    current = letters[random.nextInt(letters.length)];
  }

  void checkAnswer(String choice) {
    if (choice == current["sound"]) score++;
    setState(() {
      newRound();
    });
  }

  @override
  Widget build(BuildContext context) {
    List options = letters.map((e) => e["sound"]).toList();
    options.shuffle();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Match Game"),
        backgroundColor: const Color(0xFF2056D1),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(current["letter"],
                  style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2056D1))),
              const SizedBox(height: 40),
              ...options.map(
                (o) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () => checkAnswer(o),
                    child: Text(o, style: const TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text("Score: $score",
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}
