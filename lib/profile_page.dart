import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:humming_art/adding_cards.dart';
import 'package:humming_art/components/bg_for_screens.dart';
import 'package:humming_art/components/common_button.dart';

import 'components/card.dart';
import 'components/my_bottom_nav_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return BGforScreens(
      child: SafeArea(
        child: Scaffold(
          backgroundColor:Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            title: const Text('Profile'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 84, 73, 55),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(child: Icon(Icons.person, size: 40,)),
                    ),

                    const SizedBox(width: 20,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.email!, 
                        style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        ),
                      ),
                        Text(user.uid,
                          style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    )
                    
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25, top: 30, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('My cards', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                        color: Color.fromARGB(245, 226, 225, 225)
                        ),),
                    const Divider(height: 10, thickness: 3,),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 20),
                      child: CommonButton(onTap: (){Navigator.push(context, 
                        MaterialPageRoute(builder: (context) {
                          return const AddingCardScreen();
                            })
                          );}, text: 'Add card', height: 45, textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5,),
                        child: 
                          StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection('products').where('uid', isEqualTo: user.uid).snapshots(),
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
                  children: snapshot.data!.docs.map((document) {
                    return MyCard(
                      name: document['name'],
                      author: document['author'],
                      price: document['price'],
                      imageURL: document['imageURL'],
                    );
                  }).toList(),
                );
                          },
                        )
                      ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}