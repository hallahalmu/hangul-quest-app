import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({Key? key}) : super(key: key);

  final int learned = 25;
  final int total = 40;
  final int quizScore = 80;
  final int streak = 5;

  @override
  Widget build(BuildContext context) {
    double progress = learned / total;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Progress'),
        backgroundColor: const Color(0xFF2056D1),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Icon(FontAwesomeIcons.userCircle,
                size: 70, color: Color(0xFF2056D1)),
            const SizedBox(height: 10),
            const Text(
              "Your Learning Stats",
              style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFF2056D1),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            _buildCard(Icons.menu_book_rounded, "Letters Learned",
                "$learned / $total", Colors.blue.shade400, progress),
            _buildCard(Icons.quiz_rounded, "Quiz Score", "$quizScore%",
                Colors.purple.shade400, quizScore / 100),
            _buildCard(Icons.local_fire_department_rounded, "Streak",
                "$streak Days 🔥", Colors.orange.shade400, 1),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(IconData icon, String title, String value, Color color,
      double progressPercent) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(width: 10),
              Text(title,
                  style: TextStyle(
                      fontSize: 18,
                      color: color,
                      fontWeight: FontWeight.w600)),
              const Spacer(),
              Text(value,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: progressPercent,
            backgroundColor: Colors.white,
            color: color,
            minHeight: 8,
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }
}
