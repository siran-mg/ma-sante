import 'package:flutter/material.dart';
import 'package:ma_sante/home/carousel_item.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 350,
        child: CarouselView(
          itemExtent: 300,
          elevation: 4,
          padding: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          children: List.generate(
            10,
            (index) => CarouselItem(
              title: 'Item $index',
              imageUrl: 'https://picsum.photos/200/300?random=$index',
            ),
          ),
        ),
      ),
    );
  }
}
