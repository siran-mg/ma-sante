import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 240,
        child: CarouselView(
          itemExtent: 200,
          elevation: 4,
          padding: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          children: List.generate(
            10,
            (index) => Image.network(
              'https://picsum.photos/200/300?random=$index',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
