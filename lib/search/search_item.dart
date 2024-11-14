import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String firstName;
  final String speciality;
  final String location;

  const SearchItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.firstName,
    required this.speciality,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 70,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '$firstName $name',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(speciality,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                                Row(children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Text(location,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                ]),
                              ],
                            ),
                            IconButton.filled(
                              onPressed: () {},
                              icon: const Icon(Icons.call),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Row(
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
