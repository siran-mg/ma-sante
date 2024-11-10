import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ma_sante/view_models/navigation_view_model.dart';

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
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
        BottomNavigationBarItem(
          icon: Badge(
            isLabelVisible: true,
            label: Text("5"),
            child: Icon(Icons.notifications_none_outlined),
          ),
          label: 'Notifications',
        ),
      ],
    );
  }
}
