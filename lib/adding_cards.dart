import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:humming_art/Gallery/gallery_screen.dart';
import 'package:humming_art/components/bg_for_screens.dart';
import 'package:humming_art/components/sign_button.dart';
import 'package:image_picker/image_picker.dart';
import 'components/TextFields/text_field.dart';


class AddingCardScreen extends StatefulWidget {
  const AddingCardScreen({super.key,});

  @override
  State<AddingCardScreen> createState() => _AddingCardScreenState();
}

class _AddingCardScreenState extends State<AddingCardScreen> {
  final _nameController = TextEditingController();
  final _authorController = TextEditingController();
  final _priceController = TextEditingController();
  File? image;



Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) return;
    final imageTemp = File(image.path);
    setState(() => this.image = imageTemp);
}


Future<String?> uploadImage() async {
  if(image==null) {
    return null;
  }
  try{
    final ref = FirebaseStorage.instance.ref().child('images').child('${DateTime.now()}jpg');
    await ref.putFile(image!);
    return await ref.getDownloadURL();
  } catch (e) {return null;}
}


void addProductWithPhoto({required String name, required String author, required int price, required String uid}) async {
  String? imageURL = await uploadImage();
  FirebaseFirestore.instance.collection('products').add({
    'name': name,
    'author': author,
    'price': price,
    'imageURL': imageURL,
    'uid': uid,
  });
  imageURL = null;
}



@override
  void dispose() {
    _nameController.dispose();
    _authorController.dispose();
    _priceController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BGforScreens(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,

          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            title: const Text('Adding card'),
          ),

          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CommonButton(onTap:() {
              if (_nameController.text.isNotEmpty || _authorController.text.isNotEmpty || _priceController.text.isNotEmpty || FirebaseAuth.instance.currentUser!.uid.isNotEmpty || image != null) {
                addProductWithPhoto(
                name: _nameController.text.trim(),
                author: _authorController.text.trim(),
                price: int.parse(_priceController.text.trim()),
                uid: FirebaseAuth.instance.currentUser!.uid,
              );
              () {Navigator.push(context, 
                        MaterialPageRoute(builder: (context) {
                          return Gallery();
                            })
                          );
                        };
              } else if(_nameController.text.isEmpty || _authorController.text.isEmpty || _priceController.text.isEmpty || FirebaseAuth.instance.currentUser!.uid.isEmpty || image == null) {
                showDialog(context: context, builder:(BuildContext context) => const AlertDialog(
                  title: Center(child: Text('Not all data is filled')),
                  ),
                );
              } else {
                showDialog(context: context, builder:(BuildContext context) => const AlertDialog(
                  title: Center(child: Text('Error')),
                  ),
                );
              }
            },
            text: 'Create card'),
          ),

          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 40,),
                  GestureDetector(
                    onTap:()=> pickImage(),
                    child: Container(
                        alignment: Alignment.center,
                        height: 300,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(27, 27, 27, 100),
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(width: 1, color: const Color.fromARGB(255, 35, 35, 35))
                          ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: image != null ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: const Offset(2, 2),
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.file(image!, fit: BoxFit.cover,)
                    ),
                ),
              ) : const Icon(Icons.image, size: 150, color: Color.fromARGB(41, 255, 255, 255),)
                        ),
                      ),
                  ),
                const SizedBox(height: 40,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ComonTextField(
                        hintText: 'name',
                        controller: _nameController,
                        icon: Icons.drive_file_rename_outline,
                      ),
                      const SizedBox(height: 20,),
                  
                      ComonTextField(
                        hintText: 'author',
                        controller: _authorController,
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 20,),
                  
                      ComonTextField(
                        hintText: 'price',
                        controller: _priceController,
                        icon: Icons.attach_money,
                        kType: TextInputType.number,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
        ),
      );
  }
}