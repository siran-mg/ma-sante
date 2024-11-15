import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:ma_sante/notifications/notification_item.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: List.generate(
            10,
            (index) => NotificationItem(
              user: loremIpsum(words: 2),
              photoProfile:
                  'https://picsum.photos/200/300?random=${random.nextInt(100)}',
              object: 'a publié une annonce',
              date: DateTime.now().subtract(Duration(days: random.nextInt(30))),
              seen: index < 5,
            ),
          ),
        ),
      ),
    );
  }
}
