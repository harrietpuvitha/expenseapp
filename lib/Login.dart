import 'package:expense_tracker/BottomNavigation.dart';
import 'package:expense_tracker/Welcome.dart';
import 'package:expense_tracker/color.dart';
import 'package:expense_tracker/home1.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordVisible =true;
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_p9,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Welcome()));
          }
        ),
        title: Text('Login'),
        backgroundColor: color_p10,
      ),
      body: SingleChildScrollView(
        child:Form(
          key: formKey,
        child: Column(
          children: [
            SizedBox(height: 50,),
            Padding(padding: EdgeInsets.all(20),
              child: Center(
                  child: Text('Enter Email address you registered',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ),
            ),
               SizedBox(height: 50,),
               Container(
                 decoration: BoxDecoration(
                     color: color_p9,
                     borderRadius: BorderRadius.circular(10),
                     boxShadow: [
                       BoxShadow(

                           blurRadius:40,
                           spreadRadius: 1,
                           offset: Offset(5 ,-5),
                           color: color_p10
                       )
                     ]
                 ),
                 margin: const EdgeInsets.only(left: 10,right: 10),
                 child:TextFormField(
                   controller: email,
                   validator: (value) {
                     if (value!.isEmpty ||! RegExp(r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value)) {
                       return "enter valid email";
                     }
                     // if(value!='abc@gmail.com'){
                     //   return 'Incorrect EmailID';
                     // }
                     else{
                       return null;
                     }
                   },
                   style: TextStyle(color: Colors.white),
                   decoration: InputDecoration(
                     prefixIcon: Icon(Icons.email_outlined,
                     color: color_p8,),
                     hintText: "Email",
                     hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
                     contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                     focusedBorder: UnderlineInputBorder(
                       borderSide: BorderSide(
                         color: Colors.transparent,
                       ),
                     ),
                     border: UnderlineInputBorder(
                       borderSide: BorderSide(
                         color: Colors.transparent,
                       ),
                     ),
                     disabledBorder:  UnderlineInputBorder(
                       borderSide: BorderSide(
                         color: Colors.transparent,
                       ),
                     ),
                     enabledBorder: UnderlineInputBorder(
                       borderSide: BorderSide(
                         color: Colors.transparent,
                       ),
                     ),
                   ),
                 ),
                       ),
            SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(
                  color: color_p9,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        blurRadius:20,
                        spreadRadius: 1,
                        offset: Offset(5 ,10),
                        color: color_p10
                    )
                  ]
              ),
              margin: const EdgeInsets.only(left: 10,right: 10),
              child:TextFormField(
                controller: password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                obscureText: passwordVisible,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outlined,
                    color: color_p8,),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  disabledBorder:  UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(passwordVisible ? Icons.visibility_off: Icons.visibility,
                    color: color_p8,),
                    onPressed: (){
                      setState(() {
                        passwordVisible = ! passwordVisible;
                      });
                    },
                ),

              ),
            ),
            ),
            SizedBox(height: 40,),
            Center(
              child:   Column(

                children: [

                  ElevatedButton(onPressed: (){
                    if(formKey.currentState!.validate()) {
                      print("Email:" + email.text);
                      print("password:" + password.text);

                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNavigation()));
                    }

        else{
          print('Not validated');
        }


                  },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: color_p10,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                          ),
                        )
                    ),
                    child:Container(
                      height: 60,
                      width: 150,
                      child: Center(
                        child: Text('LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),


                ],

              ),
            ),

          ],
        ),
      ),
      ),

    );
  }
}
