import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, required this.icon, required this.hintText, required this.controller,});

  final IconData icon;
  final String hintText;
  final TextEditingController controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextField();
}

class _PasswordTextField extends State<PasswordTextField> {

  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

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
                                
                                obscureText: _obscureText,
                                style: const TextStyle(color: Colors.white),
                                controller: widget.controller,
                                decoration: InputDecoration(
                                  
                                  hintText: widget.hintText,
                                  suffixIcon: GestureDetector(
          onTap: _toggleObscureText,
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),),
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