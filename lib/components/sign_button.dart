import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.onTap, required this.text});

  final void Function() onTap;
  final String text;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                      onTap: onTap,
                      child: Container(
                        alignment: Alignment.center,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          color: const Color.fromARGB(255, 254, 245, 218)
                        ),
                        child: Text(text, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black),),
                      ),
                    );
  }
}