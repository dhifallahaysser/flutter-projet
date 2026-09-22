import 'package:flutter/material.dart';

class CardFilmItem extends StatelessWidget {
  final String image, title;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const CardFilmItem({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Image.asset("assets/images/$image"),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 27),
                        IconButton(
                          onPressed: onDelete,
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                          tooltip: "Supprimer",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
