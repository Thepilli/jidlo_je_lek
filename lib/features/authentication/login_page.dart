import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:stacionar_app/app/app_colors.dart';
import 'package:stacionar_app/app/app_constants.dart';
import 'package:stacionar_app/features/authentication/components/auth_text_field.dart';
import 'package:stacionar_app/features/authentication/components/button.dart';
import 'package:stacionar_app/features/authentication/components/square_tile.dart';
import 'package:stacionar_app/shared/extensions/build_context.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

//sign in function
  void signIn() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    //try to sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextController.text.trim(),
        password: passwordTextController.text.trim(),
      );

      //pop loading circle
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop loading circle
      Navigator.pop(context);
      //display error message
      if (e.code == 'unknown') {
        displayErrorMessage('Email and password field are required');
      } else {
        displayErrorMessage(e.code);
      }
    }
    if (animationType == 'hands_up') {
      setState(() {
        animationType = 'hands_down';
      });
    }
  }

  //display error message dialog
  void displayErrorMessage(String message) {
    AwesomeDialog(
      context: context,
      dialogBackgroundColor: AppColors.primaryLight,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      desc: message,
      btnOkOnPress: () {},
    ).show();
  }

  // anonymous sign-in function
  void loginAnonym() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      // sign in anonymously
      await FirebaseAuth.instance.signInAnonymously();

      // pop loading circle
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop loading circle
      Navigator.pop(context);
      // display error message
      displayErrorMessage(e.code);
    }
  }

  // Teddy
  String animationType = 'idle';
  final passwordFocusNode = FocusNode();
  final usernameFocusNode = FocusNode();
  FocusNode previousFocusNode = FocusNode();

  @override
  void initState() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        setState(() {
          animationType = 'hands_up';
        });
      } else {
        setState(() {
          animationType = 'hands_down';
        });
      }
      previousFocusNode = passwordFocusNode;
      if (previousFocusNode == passwordFocusNode) {
        previousFocusNode = usernameFocusNode;
      } else {
        previousFocusNode = passwordFocusNode;
      }
    });

    usernameFocusNode.addListener(() {
      // Check for the previous focus node and perform actions based on its value
      if (previousFocusNode == passwordFocusNode) {
        if (usernameFocusNode.hasFocus) {
          setState(() {
            animationType = 'hands_down';
          });
        } else {
          if (usernameFocusNode.hasFocus) {
            setState(() {
              animationType = 'idle';
            });
          } else {
            setState(() {
              animationType = 'hands_down';
            });
          }
        }
      }

      // Update the previous focus node with the current focus node
      previousFocusNode = usernameFocusNode;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  const SizedBox(height: jDefaultSize),

                  SizedBox(
                    height: 150,
                    width: 300,
                    child: FlareActor(
                      'assets/animations/Teddy.flr',
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.contain,
                      animation: animationType,
                      callback: (animation) {
                        setState(() {
                          animationType = 'idle';
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: jDefaultSize),

                  // welcome back message
                  Text(
                    Strings.welcomeMessage,
                    style: context.textTheme.bodyLarge,
                  ),

                  const SizedBox(height: jDefaultSize),

                  // email TF
                  AuthTextField(focusNode: usernameFocusNode, controller: emailTextController, label: Strings.emailLabel),
                  const SizedBox(height: jDefaultSizeSmall),

                  // password TF
                  AuthTextField(
                      focusNode: passwordFocusNode,
                      obscureText: true,
                      controller: passwordTextController,
                      label: Strings.passwordLabel),
                  const SizedBox(height: jDefaultSize),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // forgot password?
                        Text(
                          Strings.forgotPasswordText,
                          style: context.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: jDefaultSize),

                  // sign in button
                  MyButton(
                    text: Strings.signInButtonText,
                    onPressed: signIn,
                  ),
                  const SizedBox(height: jDefaultSize),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            Strings.continueWithText,
                            style: context.textTheme.bodySmall,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: jDefaultSize),

                  // google + apple sign in buttons
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // google button
                      SquareTile(imagePath: 'assets/icons/google_logo.png'),

                      SizedBox(width: jDefaultSize),

                      // apple button
                      SquareTile(imagePath: 'assets/icons/apple_logo.png'),
                    ],
                  ),

                  const SizedBox(height: jDefaultSize),

                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(Strings.notMemberText, style: context.textTheme.bodySmall),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          Strings.registerNowText,
                          style: context.textTheme.bodySmall?.copyWith(color: context.primary),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: jDefaultSizeSmall),
                  // wanna give it a try?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.tryItText,
                        style: context.textTheme.bodySmall,
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: loginAnonym,
                        child: Text(
                          Strings.continueAnonymouslyText,
                          style: context.textTheme.bodySmall?.copyWith(color: context.primary),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
