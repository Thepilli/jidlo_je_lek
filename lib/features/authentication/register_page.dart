import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacionar_app/app/app_colors.dart';
import 'package:stacionar_app/app/app_constants.dart';
import 'package:stacionar_app/features/authentication/components/auth_text_field.dart';
import 'package:stacionar_app/features/authentication/components/button.dart';
import 'package:stacionar_app/shared/extensions/build_context.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

//sign in function
  void signUp() async {
//show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

//check if passwords match
    if (passwordTextController.text.trim() != confirmPasswordTextController.text.trim()) {
      //pop loading circle
      Navigator.pop(context);

      //display error message
      displayErrorMessage(Strings.noMatchPasswordText);
    } else {
      //try to create a new user
      try {
        // create a new user
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextController.text.trim(),
          password: passwordTextController.text.trim(),
        );

        //after creating a new user, create a new document in the cloud firestore collection called Users
        FirebaseFirestore.instance.collection('Users').doc(userCredential.user?.uid).set({
          'UserEmail': userCredential.user!.email,

          'username': emailTextController.text.split('@')[0], //initial username
          'bio': 'empty bio...', //initial bio

          //add more fields here when needed
        });

        //pop loading circle
        if (context.mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        //pop loading circle
        Navigator.pop(context);
        //display error message
        displayErrorMessage(e.code);
      }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                const SizedBox(height: jDefaultSize),
                const SizedBox(height: 200, child: Image(image: AssetImage('assets/images/food_meditation.png'))),

                const SizedBox(height: jDefaultSize),

                // welcome back message
                Text(
                  Strings.welcomeRegisterMessage,
                  style: context.textTheme.bodyLarge,
                ),

                const SizedBox(height: jDefaultSize),

                AuthTextField(controller: emailTextController, label: Strings.emailLabel),
                const SizedBox(height: jDefaultSizeSmall),
                AuthTextField(obscureText: true, controller: passwordTextController, label: Strings.passwordLabel),
                const SizedBox(height: jDefaultSizeSmall),
                AuthTextField(obscureText: true, controller: confirmPasswordTextController, label: Strings.confirmPasswordLabel),
                const SizedBox(height: jDefaultSizeSmall),

                MyButton(
                  text: Strings.signUpButtonText,
                  onPressed: signUp,
                ),
                const SizedBox(height: jDefaultSize),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.alreadyHaveAccountText,
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(Strings.loginNowText, style: context.textTheme.bodyMedium?.copyWith(color: context.primary)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
