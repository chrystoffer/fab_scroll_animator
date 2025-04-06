import 'package:fab_scroll_animator/fab_scroll_animator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true), home: const MyHomePage(title: 'Flutter Demo Home Page'));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _listViewController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: Scrollbar(
        controller: _listViewController,
        child: ListView.builder(
          controller: _listViewController,
          itemCount: 130,
          itemBuilder: (context, index) {
            return ListTile(title: Text("LLLLoooonnnngggg title $index"));
          },
        ),
      ),
      floatingActionButton: FABScrollAnimator(scrollController: _listViewController, onScroll: (isExtended) => FloatingActionButton.extended(isExtended: isExtended, backgroundColor: Colors.orange, icon: const Icon(Icons.add, color: Colors.white), label: const Text('LLLLoooonnnngggg Text', style: TextStyle(color: Colors.white)), onPressed: () async {})),
    );
  }
}
