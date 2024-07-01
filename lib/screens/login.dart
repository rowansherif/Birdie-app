import 'package:birdie_app/my_code/auth_code.dart';
import 'package:birdie_app/screens/forgetpassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

final _formkey = GlobalKey<FormState>();
final emailController = TextEditingController();
final passwordController = TextEditingController();
bool passToggle = true;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Authcode _authCode = Authcode();
  final _auth = FirebaseAuth.instance;
  bool showspinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: Center(
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
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15),
                          label: Text(
                            "User Email",
                            style: TextStyle(color: Colors.blue[400]),
                          ),
                          hintText: "Enter User Email",
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
                            return "Please, Enter E-mail";
                          } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{3}$')
                              .hasMatch(value!)) {
                            return "Enter Valid E-mail";
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
                          } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)) {
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
                            onPressed: () async {
                              setState(() {
                                showspinner = true;
                              });
                              if (_formkey.currentState!.validate()) {
                                try {
                                  final user =
                                      await _auth.signInWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text);
                                  if (user != null) {
                                    print("sucess");
                                    emailController.clear();
                                    passwordController.clear();
                                    Navigator.popAndPushNamed(context, '/home');
                                  }
                                } on FirebaseAuthException catch (e) {
                                   ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(e.code)),
                                  );
                                }
                              }
                              setState(() {
                                showspinner = false;
                              });
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
      ),
    );
  }
}




//-------------------------------------------------------------------------------------------------------
// import 'package:birdie_app/my_code/auth_code.dart';
// import 'package:birdie_app/screens/forgetpassword.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'login_bloc.dart';
// import 'login_event.dart';
// import 'login_state.dart';

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider(
//         create: (context) => LoginBloc(),
//         child: Login(),
//       ),
//     );
//   }
// }

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final Authcode _authCode = Authcode();
//   bool passToggle = true;

//   @override
//   Widget build(BuildContext context) {
//     final _loginBloc = BlocProvider.of<LoginBloc>(context);

//     return BlocListener<LoginBloc, LoginState>(
//       listener: (context, state) {
//         if (state is LoginFailure) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Login failed: ${state.error}'),
//               backgroundColor: Colors.red,
//             ),
//           );
//         } else if (state is LoginSuccess) {
//           Navigator.popAndPushNamed(context, '/home');
//         }
//       },
//       child: BlocBuilder<LoginBloc, LoginState>(
//         builder: (context, state) {
//           return Center(
//             child: SingleChildScrollView(
//               child: SizedBox(
//                 width: double.infinity,
//                 child: Form(
//                   key: _formKey,
//                   child: Container(
//                     margin: EdgeInsets.only(left: 10, right: 10),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image(
//                           image: AssetImage('assets/birdie_logo.png'),
//                           fit: BoxFit.cover,
//                           height: 220,
//                           width: 220,
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         TextFormField(
//                           controller: _usernameController,
//                           decoration: InputDecoration(
//                             contentPadding:
//                                 const EdgeInsets.symmetric(vertical: 15),
//                             label: Text(
//                               "User name",
//                               style: TextStyle(color: Colors.blue[400]),
//                             ),
//                             hintText: "Enter User name",
//                             hintStyle: TextStyle(color: Colors.black26),
//                             prefixIcon: Icon(Icons.person, color: Colors.blue[400]),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.blue,
//                               ),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return "Please, Enter User name";
//                             } else if (!RegExp(r'^[a-z A-z]+$').hasMatch(value)) {
//                               return "Enter Correct User name";
//                             } else if (value.length < 3) {
//                               return "The User name Should be at least 3 letters";
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         TextFormField(
//                           controller: _passwordController,
//                           obscureText: passToggle,
//                           decoration: InputDecoration(
//                             contentPadding:
//                                 const EdgeInsets.symmetric(vertical: 15),
//                             label: Text(
//                               "Password",
//                               style: TextStyle(color: Colors.blue[400]),
//                             ),
//                             hintText: "Enter Password",
//                             hintStyle: TextStyle(color: Colors.black26),
//                             prefixIcon: Icon(Icons.lock, color: Colors.blue[400]),
//                             suffixIcon: InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   passToggle = !passToggle;
//                                 });
//                               },
//                               child: Icon(passToggle
//                                   ? Icons.visibility
//                                   : Icons.visibility_off),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.white,
//                               ),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.blue,
//                               ),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return "Please, Enter Password";
//                             } else if (!RegExp(
//                                     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
//                                 .hasMatch(value)) {
//                               return "Enter Correct Password";
//                             }
//                             return null;
//                           },
//                         ),

//                       SizedBox(height: 24.0),

//                        Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           onPressed: state is! LoginLoading ?() {
//                             if (_formKey.currentState!.validate()) {
//                                   _loginBloc.add(LoginButtonPressed(
//                                     username: _usernameController.text.trim(),
//                                     password: _passwordController.text.trim(),
//                                   ));
//                                 }
//                           } : null,
//                           child: Text(
//                             "Login",
//                             style: TextStyle(fontSize: 15, color: Colors.white),
//                           ),
                          
//                           style: ButtonStyle(
//                             backgroundColor:
//                                 MaterialStateProperty.all(Colors.blue[400]),
//                             padding: MaterialStateProperty.all(
//                                 EdgeInsets.symmetric(
//                                     horizontal: 60, vertical: 10)),
//                             shape: MaterialStateProperty.all(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                         ),
                        
          
//                       SizedBox(height: 12.0),
//                       if (state is LoginLoading) CircularProgressIndicator(),

//                       SizedBox( width: 30,),
//                         ElevatedButton(
//                           onPressed: () {
//                             Navigator.pushNamed(context, '/createaccount');
//                           },
//                           child: Text(
//                             "Create Account",
//                             style: TextStyle(fontSize: 15, color: Colors.white),
//                           ),
//                           style: ButtonStyle(
//                             backgroundColor:
//                                 MaterialStateProperty.all(Colors.blue[400]),
//                             padding: MaterialStateProperty.all(
//                                 EdgeInsets.symmetric(
//                                     horizontal: 20, vertical: 10)),
//                             shape: MaterialStateProperty.all(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 25),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(context,
//                                   MaterialPageRoute(builder: (context) {
//                                 return ForgetPasswordpage();
//                               }));
//                             },
//                             child: Text(
//                               'Forget Password? ',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       "_________________________ or _________________________ ",
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     SizedBox(height: 35),
//                     ElevatedButton(
//                       onPressed: () {
//                         _authCode.SignInWithGoogle();
//                       },
//                       style: ButtonStyle(
//                         minimumSize:
//                             MaterialStateProperty.all<Size>(Size(160, 50)),
//                         //padding: MaterialStateProperty.all(EdgeInsets.only(top: 15, bottom: 15,)),
//                         shape: MaterialStateProperty.all(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image(
//                             image: AssetImage('assets/google_icon.png'),
//                             height: 28,
//                           ),
//                           SizedBox(width: 30),
//                           Text(
//                             'Login with Google',
//                             style: TextStyle(color: Colors.black, fontSize: 16),
//                           ),
//                         ],
//                       ),
//                     ),


//                       ],
//                   ),
//                   ),
//                 ),
//                 ),
//               ),
//           );
//         },
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
// }



