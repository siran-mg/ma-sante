import 'package:flutter/material.dart';
import 'package:ma_sante/common/full_screen_dialog.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.profileImageUrl,
    required this.firstName,
    required this.name,
    required this.publishedDate,
    required this.description,
    required this.illustrationImages,
    this.displayActions = true,
  });

  final String profileImageUrl;
  final String firstName;
  final String name;
  final DateTime publishedDate;
  final String description;
  final List<String>? illustrationImages;
  final bool? displayActions;

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('fr', timeago.FrMessages());

    return Card(
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
            if (illustrationImages != null && illustrationImages!.isNotEmpty)
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("15"),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.thumb_up),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("1 commentaire"),
                  )
                ],
              ),
            ),
            if (displayActions == true) const Divider(),
            if (displayActions == true)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.thumb_up_outlined),
                      SizedBox(
                        width: 8,
                      ),
                      Text("J'aime")
                    ],
                  ),
                  TextButton.icon(
                    onPressed: () => _showCommentDialog(context),
                    label: const Text("Commenter"),
                    icon: const Icon(Icons.comment),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }

  _showCommentDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => FullScreenDialog(
        title: "Commenter",
        content: PostCard(
          profileImageUrl: profileImageUrl,
          firstName: firstName,
          name: name,
          publishedDate: publishedDate,
          description: description,
          illustrationImages: illustrationImages,
          displayActions: false,
        ),
      ),
    );
  }
}
