import 'package:flutter/material.dart';
import 'package:humming_art/components/bg_for_screens.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../components/card.dart';

class Gallery extends StatelessWidget {
  Gallery({super.key});

  final List<Map> myProducts =
    List.generate(10, (index) => {"id": index, "name": "Product $index"}).toList();
    

  @override
  Widget build(BuildContext context) {
    return BGforScreens(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Gallery'),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: const Color.fromARGB(255, 36, 27, 17),
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            //TODO  add navigation to screens in bottom nav bar
          },
          items: const [
            Icon(Icons.person),
            Icon(Icons.image),
            Icon(Icons.gavel),
          ]
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          // implement GridView.builder
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio:2/3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 35),
              itemCount: 8,
              itemBuilder: (BuildContext ctx, index) {
                return const MyCard();
              }),
        ),
      ),
    );
  }
}