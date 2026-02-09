import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _isFinished = false;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Hewan apa yang mengalami metamorfosis sempurna?',
      'options': ['Ayam', 'Kucing', 'Kupu-kupu', 'Sapi'],
      'answer': 2,
    },
    {
      'question': 'Urutan daur hidup kupu-kupu yang benar adalah...',
      'options': [
        'Telur - Kepompong - Ulat - Kupu-kupu',
        'Telur - Ulat - Kepompong - Kupu-kupu',
        'Kupu-kupu - Ulat - Telur - Kepompong',
        'Ulat - Telur - Kupu-kupu - Kepompong'
      ],
      'answer': 1,
    },
    {
      'question': 'Agar tubuh kita tumbuh sehat, kita harus makan makanan yang...',
      'options': ['Mahal', 'Bergizi', 'Manis', 'Banyak lemak'],
      'answer': 1,
    },
    {
      'question': 'Ayam berkembang biak dengan cara...',
      'options': ['Melahirkan', 'Bertelur', 'Membelah diri', 'Bertunas'],
      'answer': 1,
    },
    {
      'question': 'Tahap setelah telur pada ayam adalah...',
      'options': ['Ayam Dewasa', 'Kepompong', 'Anak Ayam', 'Ulat'],
      'answer': 2,
    },
  ];

  void _answerQuestion(int selectedIndex) {
    if (selectedIndex == _questions[_currentQuestionIndex]['answer']) {
      setState(() {
        _score += 20; // 5 questions, total 100
      });
    }

    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      setState(() {
        _isFinished = true;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      _isFinished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Soal'),
        backgroundColor: Colors.green.shade100,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _isFinished ? _buildResult() : _buildQuestion(),
      ),
    );
  }

  Widget _buildQuestion() {
    final question = _questions[_currentQuestionIndex];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LinearProgressIndicator(
          value: (_currentQuestionIndex + 1) / _questions.length,
          backgroundColor: Colors.grey.shade200,
          color: Colors.green,
          minHeight: 10,
          borderRadius: BorderRadius.circular(5),
        ),
        const SizedBox(height: 20),
        Text(
          'Soal ${_currentQuestionIndex + 1} / ${_questions.length}',
          style: const TextStyle(fontSize: 18, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        Text(
          question['question'],
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        ...List.generate(question['options'].length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: ElevatedButton(
              onPressed: () => _answerQuestion(index),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                alignment: Alignment.centerLeft,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Colors.green, width: 1),
                ),
                elevation: 2,
              ),
              child: Text(
                question['options'][index],
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildResult() {
    String message = '';
    IconData icon = Icons.star;
    Color color = Colors.green;

    if (_score == 100) {
      message = 'Luar Biasa! Kamu Hebat!';
      icon = Icons.emoji_events;
    } else if (_score >= 80) {
      message = 'Bagus Sekali!';
      icon = Icons.thumb_up;
    } else if (_score >= 60) {
      message = 'Cukup Bagus, Belajar Lagi Ya!';
      icon = Icons.sentiment_satisfied;
      color = Colors.orange;
    } else {
      message = 'Jangan Menyerah, Coba Lagi!';
      icon = Icons.sentiment_dissatisfied;
      color = Colors.red;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 100, color: color),
          const SizedBox(height: 20),
          Text(
            'Nilai Kamu',
            style: const TextStyle(fontSize: 24, color: Colors.grey),
          ),
          Text(
            '$_score',
            style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: color),
          ),
          const SizedBox(height: 10),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context); // Back to material
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text('Kembali ke Materi'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _resetQuiz,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text('Coba Lagi'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
