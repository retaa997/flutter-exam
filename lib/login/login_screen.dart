import 'package:doctor/fakedata/fakedata.dart';
import 'package:doctor/home/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool hidePw = true;
  bool valErr = false;
  String errortxt = "";

  late final _passwordFieldFocus = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late final _emailFieldFocus = FocusNode()
    ..addListener(() {
      setState(() {});
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Product",
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Arena",
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.w300),
                ),
              ],
            ),
            SizedBox(height: 45),
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      focusNode: _emailFieldFocus,
                      controller: _emailController,
                      cursorColor: Colors.black45,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: valErr ? Colors.red : Colors.black45),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: valErr ? Colors.red : Colors.black45),
                        ),
                        label: Text("E-mail"),
                        labelStyle: TextStyle(
                            color: valErr ? Colors.red : Colors.black45),
                        filled: true,
                        fillColor: _emailFieldFocus.hasFocus
                            ? Colors.black12
                            : Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      focusNode: _passwordFieldFocus,
                      obscureText: hidePw,
                      controller: _passwordController,
                      cursorColor: Colors.black26,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: valErr ? Colors.red : Colors.black45),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: valErr ? Colors.red : Colors.black45),
                        ),
                        filled: true,
                        fillColor: _passwordFieldFocus.hasFocus
                            ? Colors.black12
                            : Colors.white,
                        label: Text("Password"),
                        labelStyle: TextStyle(
                            color: valErr ? Colors.red : Colors.black45),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePw = !hidePw;
                            });
                          },
                          icon: Icon(
                            hidePw ? Icons.visibility : Icons.visibility_off,
                            color: valErr ? Colors.red : Colors.black45,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    if (valErr)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Container(
                          child: Text(
                            errortxt,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_emailController.text == FakeData().email &&
                              _passwordController.text == FakeData().password &&
                              _formKey.currentState!.validate()) {
                            valErr = false;
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                                (route) => false);
                          } else {
                            setState(() {
                              valErr = true;
                              errortxt = "Pogresan email ili password!";
                            });
                          }
                        },
                        child: const Text(
                          "Log In",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
