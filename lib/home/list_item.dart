import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

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
    timeago.setLocaleMessages('fr', timeago.FrMessages());

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(profileImageUrl),
                    ),
                    title: Text('$firstName $name'),
                    subtitle: Text(timeago.format(publishedDate, locale: 'fr')),
                    trailing: TextButton(
                      onPressed: () {},
                      child: const Text("Suivre"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(description),
                  ),
                  if (illustrationImages != null &&
                      illustrationImages!.isNotEmpty)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Image.network(
                        illustrationImages!.first,
                        fit: BoxFit.cover,
                      ),
                    ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("15"),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(Icons.thumb_up),
                          ],
                        ),
                        Text("1 commentaire"),
                      ],
                    ),
                  ),
                  const Divider(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.thumb_up_outlined),
                          SizedBox(
                            width: 8,
                          ),
                          Text("J'aime")
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.comment),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Commenter")
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
