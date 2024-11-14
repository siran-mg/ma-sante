import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ma_sante/search/search_item.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Rechercher un lieu, un mdécin, une spécialité',
                  suffixIcon: InkWell(
                    child: const Icon(Icons.search),
                    onTap: () {},
                  ),
                ),
                autofocus: true,
                textInputAction: TextInputAction.search,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Les plus recherchés",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Divider(),
            ...List.generate(
                10,
                (index) => SearchItem(
                      imageUrl:
                          'https://picsum.photos/200/300?random=${random.nextInt(100)}',
                      name: 'Nom',
                      firstName: 'Prénom',
                      speciality: 'Psychologue',
                      location: 'Lieu de travail',
                    ))
          ],
        ),
      ),
    );
  }
}
