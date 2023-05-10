import 'package:flutter/material.dart';
import 'package:humming_art/components/bg_for_screens.dart';
import '../components/card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    return BGforScreens(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: const Text('Gallery'),
        ),

        body: 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          child: 
            StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('products').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              return GridView(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio:2/3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 35),
                children: 
                snapshot.data!.docs.map((document) {
                  return MyCard(
                    name: document['name'],
                    author: document['author'],
                    price: document['price'],
                    imageURL: document['imageURL']
                  );
                }).toList(),
              );
            },
          )
        ),
      ),
    );
  }
}

