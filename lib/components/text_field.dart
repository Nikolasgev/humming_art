import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class ComonTextField extends StatelessWidget {
  const ComonTextField({super.key, required this.icon, required this.hintText, required this.controller});

  final IconData icon;
  final String hintText;
  final TextEditingController controller;

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
                        child: Icon(icon, color: Colors.white, size: 30)
                        ),
    
                        const SizedBox(width: 4,),
    
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(27, 27, 27, 100),
                              borderRadius: BorderRadius.circular(13),
                              border: Border.all(width: 1, color: const Color.fromARGB(255, 35, 35, 35))
                              ),
                            child:  Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                controller: controller,
                                decoration: InputDecoration(
                                  hintText: hintText,
                                  hintStyle: TextStyle(color: Color.fromRGBO(144, 144, 144, 100),),
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