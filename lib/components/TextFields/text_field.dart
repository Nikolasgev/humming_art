import 'package:flutter/material.dart';

class ComonTextField extends StatefulWidget {
  const ComonTextField({super.key, required this.icon, required this.hintText, required this.controller, this.kType});

  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? kType;

  @override
  State<ComonTextField> createState() => _ComonTextFieldState();
}

class _ComonTextFieldState extends State<ComonTextField> {

  @override
  Widget build(BuildContext context) {
    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(27, 27, 27, 100), 
                          ), 
                        child: Icon(widget.icon, color: Colors.white, size: 30)
                        ),
    
                        const SizedBox(width: 4,),
    
                        Expanded(
                          flex: 1,
                          child: Container(
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
                                keyboardType: widget.kType,
                                style: const TextStyle(color: Colors.white),
                                controller: widget.controller,
                                decoration: InputDecoration(
                                  hintText: widget.hintText,
                                  hintStyle: const TextStyle(color: Color.fromRGBO(144, 144, 144, 100),),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
  }
}