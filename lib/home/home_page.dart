import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
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
              profileImageUrl:
                  'https://picsum.photos/200/300?random=${random.nextInt(100)}',
              name: 'Nom',
              firstName: 'Prénom',
              description: loremIpsum(words: random.nextInt(20)),
              illustrationImages: [
                'https://picsum.photos/200/300?random=${random.nextInt(100)}'
              ],
              publishedDate:
                  DateTime.now().subtract(Duration(days: random.nextInt(30))),
            ),
          ),
        ],
      ),
    );
  }
}
