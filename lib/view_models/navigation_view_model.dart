import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_view_model.g.dart';

@immutable
class NavigationData {
  final int currentIndex;

  const NavigationData({this.currentIndex = 0});

  NavigationData copyWith({int? currentIndex}) {
    return NavigationData(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

@riverpod
class NavigationViewModel extends _$NavigationViewModel {
  void setCurrentIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }

  @override
  NavigationData build() => const NavigationData();
}
