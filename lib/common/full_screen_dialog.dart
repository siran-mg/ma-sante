import 'package:flutter/material.dart';

class FullScreenDialog extends StatelessWidget {
  const FullScreenDialog({
    super.key,
    required this.title,
    required this.content,
    this.actions,
  });

  final String title;
  final Widget content;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      scrollable: true,
      actions: actions,
      actionsPadding: EdgeInsets.zero,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close_rounded),
          )
        ],
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: content,
      ),
    );
  }
}
