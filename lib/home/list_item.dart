import 'package:flutter/material.dart';
import 'package:ma_sante/home/post_card.dart';

class ListItem extends StatelessWidget {
  final String profileImageUrl;
  final String name;
  final String firstName;
  final String description;
  final DateTime publishedDate;
  final List<String>? illustrationImages;

  const ListItem({
    super.key,
    required this.profileImageUrl,
    required this.name,
    required this.firstName,
    required this.description,
    required this.publishedDate,
    this.illustrationImages = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PostCard(
        profileImageUrl: profileImageUrl,
        firstName: firstName,
        name: name,
        publishedDate: publishedDate,
        description: description,
        illustrationImages: illustrationImages,
      ),
    );
  }
}
