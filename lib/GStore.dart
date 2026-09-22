import 'package:flutter/material.dart';
import 'package:workshop_flutter__4ei3/CardFilmItem.dart';
import 'package:workshop_flutter__4ei3/FilmDetail.dart';

class GStore extends StatefulWidget {
  const GStore({super.key});

  @override
  State<GStore> createState() => _GStoreState();
}

class _GStoreState extends State<GStore> {
  final List<Map<String, String>> films = [
    {
      "image": "iceroad.jpg",
      "title": "Ice Road",
      "description":
          "After a remote diamond mine collapses in northern Canada, an ice driver leads an impossible rescue mission across a frozen ocean.",
      "price": "250 DT",
    },
    {
      "image": "thegrudge.jpg",
      "title": "The grudge",
      "description":
          "A detective investigates a haunted house where a violent curse passes from one victim to another.",
      "price": "220 DT",
    },
    {
      "image": "HouseOfDead.jpg",
      "title": "House Of Dead",
      "description":
          "The House of the Dead and its 2022 remake take place in 1998, following AMS agents Thomas Rogan and G as they raid the mansion of Dr. Curien, a genetic engineer who went insane and has released creatures upon his own research team.",
      "price": "300 DT",
    },
  ];

  void deleteFilm(int index) {
    setState(() {
      films.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("G-STORE"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(films.length, (index) {
            return CardFilmItem(
              image: films[index]["image"]!,
              title: films[index]["title"]!,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilmDetail(
                      image: films[index]["image"]!,
                      title: films[index]["title"]!,
                      description: films[index]["description"]!,
                      price: films[index]["price"]!,
                    ),
                  ),
                );
              },
              onDelete: () => deleteFilm(index),
            );
          }),
        ),
      ),
    );
  }
}
