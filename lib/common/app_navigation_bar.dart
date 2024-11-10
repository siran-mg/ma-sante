import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ma_sante/view_models/navigation_view_model.dart';

class MenuItem {
  final String title;
  final Widget icon;
  final Widget content;

  const MenuItem({
    required this.title,
    required this.icon,
    required this.content,
  });
}

final menus = [
  const MenuItem(
    title: 'Accueil',
    icon: Icon(Icons.home),
    content: Text('Accueil'),
  ),
  const MenuItem(
    title: 'Rechercher',
    icon: Icon(Icons.search),
    content: Text('Rechercher'),
  ),
  const MenuItem(
    title: 'Notifications',
    icon: Badge(child: Icon(Icons.notifications)),
    content: Text('Notifications'),
  ),
];

class AppNavigationBar extends ConsumerWidget {
  const AppNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(
      navigationViewModelProvider.select((value) => value.currentIndex),
    );
    return BottomNavigationBar(
      onTap: (value) =>
          ref.read(navigationViewModelProvider.notifier).setCurrentIndex(value),
      currentIndex: currentIndex,
      items: menus
          .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.title))
          .toList(),
    );
  }
}
