import 'package:flutter/material.dart';

final pages = [
  const Center(child: Text('Accueil')),
  const Center(child: Text('Notifications')),
];

Widget getPage(int index) {
  return pages[index];
}
