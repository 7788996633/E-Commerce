import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController cpassC = TextEditingController();
  TextEditingController fnameC = TextEditingController();
  TextEditingController lnameC = TextEditingController();
  final _form = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _passowrdFocusNode = FocusNode();
  final _fnameFocusNode = FocusNode();
  final _confirmPassowrdFocusNode = FocusNode();
  final _lnameFocusNode = FocusNode();
  void myDispose() {
    _emailFocusNode.dispose();
    _passowrdFocusNode.dispose();
    _confirmPassowrdFocusNode.dispose();
    _lnameFocusNode.dispose();
    _fnameFocusNode.dispose();
  }

  void _saveForm() {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }
  }

  // Future<String> sign_upApi (
  //     String email,
  //     String password,
  //     String fname,
  //     String lname,
  //     String cpass,

  //     ) async
  // {
  //   // Base.token ='"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNzljYjhjYjA1YzFhNjkyYzk2NDg4ZDgzYzM4MjllYTQzN2E0NmU5NTQ1YjhhN2JhYzE4MzJmMjUxMWE4ZjBjYTE0YWVkYzhhYjliNjQ2MWYiLCJpYXQiOjE2OTE0MzE2MDQuMTQyMjQ0LCJuYmYiOjE2OTE0MzE2MDQuMTQyMjQ2LCJleHAiOjE3MjMwNTQwMDQuMDk5NTQzLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.hFLlsQNVHYzbKbxS3efVgSTHTdg9_wcgSsi-Lq5Op8rak2sUgYtGv6_VSyJsifcaGZB8JqDMZm0ZUHuM3FzRvx6sskkJ1-sixWsmhMB5dSI5ZGSWmx7WPjmfByM3RD5oVmuYDa4rH3WsiFxyl3H9hB5CbOQAzmWR5u1Uqeircv9E6QI4o9POjUtwuuE4OiT-jy0rkAI6fNqrDKS_8BeEHrTOKsHZEdG24lprEdueqmCYFShMryHKemhonDta2eBq7lkCDOxGtCaxahantUFPISZgCpUeB3N4jvah7tSNVWTAja3nwLQLDjeaLvGW6Ic4VyMUy6ox0uvAdFrrFIvZKh9nYmIV6pEZGLzKtRcA36fSKFvFVVia0Pb_hUAVT0Nk9-7I42dLEGv7fbNfun33pSGP7V9aU7l_JpdtdlWO8ckOAqPMQts6g_3WUGw-9g4lif4dnQJgmBN9xG_AuIbfRPxo1jgrrWi9BfPQJnocM8fiHRf_kW9SNWJPYDZVpPEDaNRkDI0RkF3UrrEqb0VmSMDZafXHbKIu1ptXiAhQAT41fYNqeAxz5SMfjzR1l5xwT3SoDvUl-NFnpIeE-ycVEi_p3JryWtYNn5YrlsZ4eb5bJpTCcbKK2KCvvAZywzL4Dq6sevjsZ7VYDv8AodAGVxV6SR_axDBYbOHYYhiBE9o"';
  //   var response = await http.post(
  //     Uri.parse(Base.base+'/api/auth/register'),
  //     body: <String,String>
  //     {
  //       'First_name':fname,
  //       'Last_name':lname,
  //       'email':email,
  //       'password':password,
  //       'password_confirmation':cpass,
  //       'type':'1',
  //       'gender':'1',

  //     },

  //   );
  //   print(response.statusCode);
  //   if(response.statusCode==200)
  //   {
  //     Navigator.push(context, MaterialPageRoute(builder:(context) => HomePageScreen(),));
  //     final accesstoken1 =response.body ;
  //     print(accesstoken1);
  //     return accesstoken1;

  //   }
  //   else {
  //     throw Exception("nooooooooo");

  //   }
  // }
  @override
  Widget build(BuildContext context) {
    final colors = Provider.of<MyColors>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.appBarColor,
        title: Text(
          "SignUp page",
          style: TextStyle(color: colors.textColor),
        ),
      ),
      backgroundColor: colors.backGroundColor,
      body: Form(
        key: _form,
        child: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Welcome to our App",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Enter your informations in the next boxs",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                focusNode: _fnameFocusNode,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isNotEmpty && value.length > 5) {
                    return null;
                  } else if (value.isNotEmpty && value.length < 5) {
                    return "Enter valid name";
                  } else if (value.isEmpty) {
                    return "Enter name";
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_lnameFocusNode);
                },
                controller: fnameC,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  hintText: "First Name...",
                  hintStyle: const TextStyle(fontSize: 14),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  label: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 9),
                    child: const Text("Fname"),
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
                focusNode: _lnameFocusNode,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isNotEmpty && value.length > 5) {
                    return null;
                  } else if (value.isNotEmpty && value.length < 5) {
                    return "Enter valid name";
                  } else if (value.isEmpty) {
                    return "Enter name";
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_emailFocusNode);
                },
                controller: lnameC,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  hintText: "Last Name...",
                  hintStyle: const TextStyle(fontSize: 14),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  label: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 9),
                    child: const Text("Lname"),
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
                  FocusScope.of(context)
                      .requestFocus(_confirmPassowrdFocusNode);
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
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                validator: (value) {
                  if (value!.isNotEmpty && value == passC.text) {
                    return null;
                  } else if (value.isNotEmpty && value != passC.text) {
                    return "wrong password";
                  } else if (value.isEmpty) {
                    return "Enter password";
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  _saveForm();
                },
                focusNode: _confirmPassowrdFocusNode,
                controller: cpassC,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: "Confirm Your Password...",
                  hintStyle: const TextStyle(fontSize: 14),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  label: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 9),
                    child: const Text("Confirm"),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                _saveForm();
                // Sign_upApi(emailC.text, passC.text,fnameC.text,lnameC.text,cpassC.text);
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
                child: const Text(
                  "SignUp",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
