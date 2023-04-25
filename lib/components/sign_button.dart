import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  const SignButton({super.key, required, required this.onTap, required this.text});

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
                          color: Color.fromARGB(255, 254, 245, 218)
                        ),
                        child: Text(text, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black),),
                      ),
                    );
  }
}