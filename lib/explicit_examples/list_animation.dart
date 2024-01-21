import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({super.key});

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late List<Animation<Offset>> slideAnimation = [];
  final int itemCount = 5;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          seconds: 5,
        ));

        
    slideAnimation = List.generate(itemCount, (index) {
      return Tween(begin: const Offset(-1, 0), end: Offset.zero).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval(index * (1 / itemCount), 1),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Animation'),
      ),
      body: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return SlideTransition(
            position: slideAnimation[index],
            child: ListTile(
              title: Text('Hello World, Rivaan. ${index.toString()}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.done),
      ),
    );
  }
}
