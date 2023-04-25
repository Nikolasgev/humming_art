import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:humming_art/components/bg_for_screens.dart';
import 'package:humming_art/components/sign_button.dart';
import 'package:humming_art/components/text_field.dart';
import 'forgot_pw_screen.dart';

class SignInScreen extends StatefulWidget {
  final VoidCallback showSignUpScreen;
  const SignInScreen({super.key,required this.showSignUpScreen});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  @override
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passwordController.text.trim()
      );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BGforScreens(image: AssetImage("assets/images/bg_login_scree.png"), 
    child: 
    Scaffold(
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
                  SizedBox(
                    width: 300,
                    child: Text('Welcome back!', style: TextStyle(fontSize: 50, color: Colors.white), )
                    ),
                  SizedBox(height: 10,),

                  Text('Glad to see you again!', style: TextStyle(fontSize: 12, color: Colors.white),),

                  SizedBox(height: 20,),

                  Text('Not a member?', style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 202, 194, 194)),),

                  SizedBox(height: 10,),

                  GestureDetector(
                    onTap: widget.showSignUpScreen,
                    child: Container(
                      width: 150,
                      height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 139, 135, 124), 
                    ), 
                      child: Text('Register now!'),
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

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {Navigator.push(context, 
                        MaterialPageRoute(builder: (context) {
                          return ForgotPaswordScreen();
                            })
                          );
                        },
                        child: Text('Forgot your password?', style: TextStyle(color: Colors.grey, fontSize: 16), )
                        ),
                    ],
                  ),
                )
              ],
            ),
    
            SignButton(onTap: signIn, text: 'Sign In')
            
          ],
        ),
      ),
    )
    );
  }
}