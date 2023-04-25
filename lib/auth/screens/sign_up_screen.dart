import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:humming_art/components/bg_for_screens.dart';
import 'package:humming_art/components/sign_button.dart';
import '../../styles.dart';

import '../../components/text_field.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback showSignInPage;
  const SignUpScreen({super.key, required this.showSignInPage});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passwordController.text.trim(),
      );
    }
    
  }

  bool passwordConfirmed () {
    if (_passwordController.text.trim() == _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return BGforScreens(image: AssetImage("assets/images/bg_login_scree.png"), 
     child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 300,
                    child: Text('Welcome!', style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      ), 
                      )
                    ),
                  SizedBox(height: 10,),

                  Text('New users are always welcome!', style: TextStyle(fontSize: 18, color: Colors.white),),

                  SizedBox(height: 20,),

                  Text('Already a member?', style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 202, 194, 194)),),

                  SizedBox(height: 10,),

                  GestureDetector(
                    onTap: widget.showSignInPage,
                    child: Container(
                      width: 150,
                      height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 139, 135, 124), 
                    ), 
                      child: Text('Sign In'),
                    ),
                  ),

                ],
              ),
            ),
    
    
    
            Column(
              children: [
                ComonTextField(icon: Icons.perm_identity_rounded, hintText: "email", controller: _emailController),
    
            const SizedBox(height: 40,),

                ComonTextField(icon: Icons.lock_outline, hintText: 'password', controller: _passwordController),

                const SizedBox(height: 40,),
    
                ComonTextField(icon: Icons.lock_open_outlined, hintText: 'confirm password', controller: _passwordController),
              ],
            ),
    
            SignButton(onTap: signUp, text: 'Sign Up')
            
          ],
        ),
      ),
    )
    );
     
  }
}