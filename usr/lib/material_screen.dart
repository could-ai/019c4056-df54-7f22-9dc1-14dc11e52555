import 'package:flutter/material.dart';

class MaterialScreen extends StatelessWidget {
  const MaterialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String? name = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Materi Belajar'),
        backgroundColor: Colors.green.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo, ${name ?? "Teman"}!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Mari kita pelajari bagaimana makhluk hidup tumbuh dan berkembang.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            _buildMaterialCard(
              context,
              '1. Pertumbuhan Manusia',
              'Manusia tumbuh dari bayi -> balita -> anak-anak -> remaja -> dewasa -> lansia. \n\nAgar tumbuh sehat, kita perlu makan makanan bergizi, olahraga, dan istirahat yang cukup.',
              Icons.face,
              Colors.orange.shade100,
            ),
            const SizedBox(height: 16),
            _buildMaterialCard(
              context,
              '2. Daur Hidup Kupu-Kupu',
              'Kupu-kupu mengalami metamorfosis sempurna:\n\nTelur -> Ulat (Larva) -> Kepompong (Pupa) -> Kupu-kupu Dewasa.',
              Icons.bug_report,
              Colors.blue.shade100,
            ),
            const SizedBox(height: 16),
            _buildMaterialCard(
              context,
              '3. Pertumbuhan Ayam',
              'Ayam berkembang biak dengan cara bertelur.\n\nTelur -> Anak Ayam -> Ayam Dewasa.',
              Icons.egg,
              Colors.yellow.shade100,
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/quiz');
                },
                icon: const Icon(Icons.quiz),
                label: const Text('Kerjakan Latihan Soal'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialCard(BuildContext context, String title, String content, IconData icon, Color color) {
    return Card(
      color: color,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 32, color: Colors.black54),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.black26),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
