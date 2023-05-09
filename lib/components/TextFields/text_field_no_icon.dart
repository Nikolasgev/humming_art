import 'package:flutter/material.dart';

class ComonTextFieldNoIcon extends StatefulWidget {
  const ComonTextFieldNoIcon({super.key, required this.hintText, required this.controller,});

  final String hintText;
  final TextEditingController controller;

  @override
  State<ComonTextFieldNoIcon> createState() => _ComonTextFieldNoIconState();
}

class _ComonTextFieldNoIconState extends State<ComonTextFieldNoIcon> {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(27, 27, 27, 100),
        borderRadius: BorderRadius.circular(13),
        border: Border.all(width: 1, color: const Color.fromARGB(255, 35, 35, 35))
        ),
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Color.fromRGBO(144, 144, 144, 100),),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}