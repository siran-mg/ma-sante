import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ma_sante/home/carousel.dart';
import 'package:ma_sante/home/list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();
    return SingleChildScrollView(
      child: Column(
        children: [
          const Carousel(),
          ...List.generate(
            10,
            (index) => ListItem(
              imageUrl:
                  'https://picsum.photos/200/300?random=${random.nextInt(100)}',
              name: 'Nom',
              firstName: 'Prénom',
              speciality: 'Psychologue',
              location: 'Lieu de travail',
            ),
          ),
        ],
      ),
    );
  }
}
