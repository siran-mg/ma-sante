import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ma_sante/common/app_navigation_bar.dart';
import 'package:ma_sante/view_models/navigation_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ma santé',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Ma santé'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          bottomNavigationBar: const AppNavigationBar(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.post_add),
          ),
          body: const Main(),
        ),
      ),
    );
  }
}

class Main extends ConsumerWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(
      navigationViewModelProvider.select((value) => value.currentIndex),
    );

    return menus[currentIndex].content;
  }
}
