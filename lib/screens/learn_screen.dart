import 'package:flutter/material.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> letters = const [
    // Consonants
    {"letter": "ㄱ", "sound": "g/k"},
    {"letter": "ㄴ", "sound": "n"},
    {"letter": "ㄷ", "sound": "d/t"},
    {"letter": "ㄹ", "sound": "r/l"},
    {"letter": "ㅁ", "sound": "m"},
    {"letter": "ㅂ", "sound": "b/p"},
    {"letter": "ㅅ", "sound": "s"},
    {"letter": "ㅇ", "sound": "ng"},
    {"letter": "ㅈ", "sound": "j"},
    {"letter": "ㅊ", "sound": "ch"},
    {"letter": "ㅋ", "sound": "k"},
    {"letter": "ㅌ", "sound": "t"},
    {"letter": "ㅍ", "sound": "p"},
    {"letter": "ㅎ", "sound": "h"},
    // Vowels
    {"letter": "ㅏ", "sound": "a"},
    {"letter": "ㅑ", "sound": "ya"},
    {"letter": "ㅓ", "sound": "eo"},
    {"letter": "ㅕ", "sound": "yeo"},
    {"letter": "ㅗ", "sound": "o"},
    {"letter": "ㅛ", "sound": "yo"},
    {"letter": "ㅜ", "sound": "u"},
    {"letter": "ㅠ", "sound": "yu"},
    {"letter": "ㅡ", "sound": "eu"},
    {"letter": "ㅣ", "sound": "i"},
    {"letter": "ㅐ", "sound": "ae"},
    {"letter": "ㅔ", "sound": "e"},
    {"letter": "ㅚ", "sound": "oe"},
    {"letter": "ㅟ", "sound": "wi"},
    {"letter": "ㅢ", "sound": "ui"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Hangul"),
        backgroundColor: const Color(0xFF2056D1),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemCount: letters.length,
        itemBuilder: (context, index) {
          final item = letters[index];
          return Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFDBE7FF), Color(0xFFEFF4FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.15),
                  blurRadius: 6,
                  offset: const Offset(2, 3),
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item["letter"]!,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2056D1),
                  ),
                ),
                const SizedBox(height: 8),
                Text(item["sound"]!,
                    style: const TextStyle(fontSize: 16, color: Colors.black54))
              ],
            ),
          );
        },
      ),
    );
  }
}
