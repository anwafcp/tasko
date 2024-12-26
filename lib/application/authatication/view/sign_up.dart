import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/application/authatication/controller/auth_countroller.dart';
import 'package:task_app/application/authatication/view/sign_in.dart';
import 'package:task_app/application/taks/view/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> formskey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fName = TextEditingController();
  TextEditingController sName = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signups = Provider.of<AuthCountroller>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formskey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 45),
                    child: Text(
                      "Do Your Task",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "First name is empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "first Name",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "last name is empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "last Name",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "number  is empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_android),
                        hintText: "number",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "e-mail  is empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "e mail",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is empty";
                      } else if (value.length > 8) {
                        return "Password is too long";
                      } else if (value.length < 8) {
                        return "Password is too short";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.visibility_off),
                        hintText: "Password",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Already a member?",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInPage(),
                                ));
                          },
                          child: Text("Sign in",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700)))
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          minimumSize: Size(200, 50),
                          side: BorderSide(
                            width: 3,
                          )),
                      onPressed: () {
                        if (formskey.currentState!.validate()) {
                          signups.signUp(
                            email: email.text.trim(),
                            password: password.text.trim(),
                            phoneNumber: phone.text.trim(),
                            firstName: fName.text.trim(),
                            secondName: sName.text.trim(),
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ));
                        }
                      },
                      child: Text("Sign Up",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700)))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
