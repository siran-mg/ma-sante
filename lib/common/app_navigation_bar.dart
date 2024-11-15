import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ma_sante/home/home_page.dart';
import 'package:ma_sante/notifications/notifications_page.dart';
import 'package:ma_sante/search/search_page.dart';
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
    content: HomePage(),
  ),
  const MenuItem(
    title: 'Rechercher',
    icon: Icon(Icons.search),
    content: SearchPage(),
  ),
  const MenuItem(
    title: 'Notifications',
    icon: Badge(
      label: Text("10"),
      child: Icon(Icons.notifications),
    ),
    content: NotificationsPage(),
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
