import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.onTap, required this.text, this.height = 70, this.textStyle = const TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black),});

  final void Function() onTap;
  final String text;
  final double height;
  final TextStyle textStyle;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                      onTap: onTap,
                      child: Container(
                        alignment: Alignment.center,
                        height: height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          color: const Color.fromARGB(255, 254, 245, 218)
                        ),
                        child: Text(text, style: textStyle,),
                      ),
                    );
  }
}