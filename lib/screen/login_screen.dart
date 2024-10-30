import 'package:flutter/material.dart';
import 'package:project1/screen/sign_up_screen.dart';
import 'package:provider/provider.dart';

import '../provider/colors.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailFocusNode = FocusNode();
  final _passowrdFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  void plogin() async {
    try {
      // String accessToken= await LoginConroller().loginApi(emailC.text,passC.text);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } catch (e) {
      // ignore: avoid_print
      print('noo');
    }
  }

  void myDispose() {
    _emailFocusNode.dispose();
    _passowrdFocusNode.dispose();
  }

  void _saveForm() {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }
    plogin();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Provider.of<MyColors>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.appBarColor,
        title: Text(
          "LogIn page",
          style: TextStyle(color: colors.textColor),
        ),
      ),
      backgroundColor: colors.backGroundColor,
      body: Form(
        key: _form,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
          child: ListView(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Welcome Back",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Here You Can LogIn To Your Account",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isNotEmpty && value.contains("@gmail.com")) {
                      return null;
                    } else if (value.isNotEmpty &&
                        !value.contains("@gmail.com")) {
                      return "Enter valid Email";
                    } else if (value.isEmpty) {
                      return "Enter Email";
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_passowrdFocusNode);
                  },
                  focusNode: _emailFocusNode,
                  controller: emailC,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    hintText: "Enter Your Email...",
                    hintStyle: const TextStyle(fontSize: 14),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    label: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 9),
                      child: const Text("Email"),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isNotEmpty && value.length >= 8) {
                      return null;
                    } else if (value.isNotEmpty && value.length < 8) {
                      return "passowrd must be 8 or more";
                    } else if (value.isEmpty) {
                      return "Enter password";
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    _saveForm();
                  },
                  focusNode: _passowrdFocusNode,
                  controller: passC,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    hintText: "Enter Your Password...",
                    hintStyle: const TextStyle(fontSize: 14),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    label: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 9),
                      child: const Text("Password"),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              InkWell(
                onTap: () {
                  // LoginConroller().loginApi(emailC.text, passC.text);
                  _saveForm();
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: colors.appBarColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                  width: 300,
                  child: Text(
                    "LogIn",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: colors.textColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 100,
                  ),
                  const Text("Dont Have An Account?",
                      textAlign: TextAlign.center),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: const Text("SignUp"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
