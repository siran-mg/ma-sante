import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ma_sante/common/full_screen_dialog.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/foundation.dart' as foundation;

class PostCard extends StatefulWidget {
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
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  bool _emojiShowing = false;

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
                backgroundImage: NetworkImage(widget.profileImageUrl),
              ),
              title: Text('${widget.firstName} ${widget.name}'),
              subtitle:
                  Text(timeago.format(widget.publishedDate, locale: 'fr')),
              trailing: TextButton(
                onPressed: () {},
                child: const Text("Suivre"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.description),
            ),
            if (widget.illustrationImages != null &&
                widget.illustrationImages!.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Image.network(
                  widget.illustrationImages!.first,
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
            if (widget.displayActions == true) const Divider(),
            if (widget.displayActions == true)
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

  _showCommentDialog(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, setState) {
        return FullScreenDialog(
          title: "Commenter",
          content: PostCard(
            profileImageUrl: widget.profileImageUrl,
            firstName: widget.firstName,
            name: widget.name,
            publishedDate: widget.publishedDate,
            description: widget.description,
            illustrationImages: widget.illustrationImages,
            displayActions: false,
          ),
          actions: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _controller,
                        scrollController: _scrollController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: 'Saisissez votre commentaire',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _emojiShowing = !_emojiShowing;
                              });
                            },
                            icon: const Icon(Icons.emoji_emotions),
                          ),
                          // contentPadding: EdgeInsets.all(8),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://picsum.photos/200/300?random=1",
                              ),
                            ),
                          ),
                        ),
                        autofocus: true,
                        textAlignVertical: TextAlignVertical.center,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.send_sharp),
                    ),
                  ],
                ),
              ],
            )
          ],
        );
      }),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
