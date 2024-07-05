import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';



class ForgetPasswordpage extends StatefulWidget {
   ForgetPasswordpage
({super.key});

  @override
  State<ForgetPasswordpage> createState() => _ForgetPasswordpageState();
}

class _ForgetPasswordpageState extends State<ForgetPasswordpage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.blue,
        title: Text('Forget Password', style: TextStyle(fontSize: 25, color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            margin:  EdgeInsets.only(left: 10, right: 10),
            child: Column(
            children: [
              SizedBox(height: 100,),
            
              Image(image: AssetImage('assets/birdie_logo.png'),
              fit: BoxFit.cover,
              height: 200,
              width: 250,    
               ),
            
            SizedBox(height: 50,),          
            
            
                     TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 15),
                        label: Text("E-mail",style: TextStyle(color: Colors.blue[600]),),
                        hintText: "Enter Your E-mail",
                        hintStyle: TextStyle(color: Colors.black26),
                        prefixIcon: Icon(Icons.person , color: Colors.blue[600]),
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
                      validator: (value){
                        if(value! .isEmpty){
                          return "Please, Enter E-mail";
                        }
                        else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{3}$').hasMatch(value!)){
                          return "Enter Valid E-mail";
                        }
                        return null;
                      },
                    ),
            
               SizedBox(height: 30,),  
               
              ElevatedButton(onPressed:() async{
                try{
                  await FirebaseAuth.instance.
                  sendPasswordResetEmail(email: emailController.text.trim());
                  showDialog(context: context, builder: (context) {
                  return AlertDialog(
                   content: Text('Pasword link sent! check your E-mail'),
                );
                 },
                );
                  }on FirebaseAuthException  catch(e){
                  print(e);
                  showDialog(
                    context: context, 
                    builder: (context) {
                     return AlertDialog(
                   content: Text(e.message.toString()),
                );
              },
              );
              }
              },
               
                  child: Text("Reset Password",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  style: ButtonStyle(
                    
                    backgroundColor: MaterialStateProperty.all(Colors.blue[600]),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 60, vertical: 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    ),
                    ),
                  ),
                  ),
            ],
            ),
          ),
        ),
      )
    );
  }
}