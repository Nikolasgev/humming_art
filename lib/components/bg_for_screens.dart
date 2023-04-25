import 'package:flutter/material.dart';

class BGforScreens extends StatelessWidget {
  const BGforScreens({super.key, this.image = const AssetImage("assets/images/bg.png"), required this.child, });

  final Widget child;
  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
            image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
            )
          ),
          child:child,
    );
  }
}