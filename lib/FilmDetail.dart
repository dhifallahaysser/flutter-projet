import 'package:flutter/material.dart';

class FilmDetail extends StatelessWidget {
  final String image, title, description, price;

  const FilmDetail({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FF),
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFFFFF7FF),
        foregroundColor: const Color(0xFF333333),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/images/$image", height: 210, fit: BoxFit.cover),
            const SizedBox(height: 45),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.45,
                color: Color(0xFF444444),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 22),
            Text(
              price,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                color: Color(0xFF222222),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.shopping_basket),
                label: const Text("Acheter"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5722),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 14,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
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
