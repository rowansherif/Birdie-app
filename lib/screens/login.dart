import 'package:birdie_app/my_code/auth_code.dart';
import 'package:birdie_app/screens/forgetpassword.dart';
import 'package:flutter/material.dart';
import 'package:birdie_app/my_code/auth_code.dart';
final _formkey = GlobalKey<FormState>();
final usernameController = TextEditingController();
final passwordController = TextEditingController();
bool passToggle = true;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Authcode _authCode = Authcode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Form(
              key: _formkey,
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/birdie_logo.png'),
                      fit: BoxFit.cover,
                      height: 220,
                      width: 220,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15),
                        label: Text(
                          "User name",
                          style: TextStyle(color: Colors.blue[400]),
                        ),
                        hintText: "Enter User name",
                        hintStyle: TextStyle(color: Colors.black26),
                        prefixIcon: Icon(Icons.person, color: Colors.blue[400]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please, Enter User name";
                        } else if (!RegExp(r'^[a-z A-z]+$').hasMatch(value!)) {
                          return "Enter Correct User name";
                        } else if (value!.length < 3) {
                          return "The User name Should be at least 3 letters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: passToggle,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15),
                        label: Text(
                          "Password",
                          style: TextStyle(color: Colors.blue[400]),
                        ),
                        hintText: "Enter Password",
                        hintStyle: TextStyle(color: Colors.black26),
                        prefixIcon: Icon(Icons.lock, color: Colors.blue[400]),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Icon(passToggle
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please, Enter Password";
                        } else if (!RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(value!)) {
                          return "Enter Correct Password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              print("sucess");
                              usernameController.clear();
                              passwordController.clear();
                              Navigator.popAndPushNamed(context, '/home');
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue[400]),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal: 60, vertical: 10)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/createaccount');
                          },
                          child: Text(
                            "Create Account",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue[400]),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ForgetPasswordpage();
                              }));
                            },
                            child: Text(
                              'Forget Password? ',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "_________________________ or _________________________ ",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 35),
                    ElevatedButton(
                      onPressed: () {
                        _authCode.SignInWithGoogle();
                      },
                      style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(160, 50)),
                        //padding: MaterialStateProperty.all(EdgeInsets.only(top: 15, bottom: 15,)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/google_icon.png'),
                            height: 28,
                          ),
                          SizedBox(width: 30),
                          Text(
                            'Login with Google',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
