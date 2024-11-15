import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationItem extends StatelessWidget {
  final String photoProfile;
  final String user;
  final String object;
  final DateTime date;
  final bool? seen;

  const NotificationItem({
    super.key,
    required this.photoProfile,
    required this.user,
    required this.object,
    required this.date,
    this.seen = false,
  });

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('fr', timeago.FrMessages());

    return Card(
      surfaceTintColor:
          seen == false ? null : Theme.of(context).colorScheme.surfaceTint,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            photoProfile,
          ),
        ),
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: user,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: ' $object')
            ],
          ),
        ),
        subtitle: Text(timeago.format(date, locale: 'fr')),
      ),
    );
  }
}
