import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pref_demo_3/pages/up_page.dart';

import '../models/user_model.dart';
import '../services/pref_service.dart';
class HomePage extends StatefulWidget {
  static final String id = "home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  void _doLogin() {
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    User user = new User.from(email: email, password: password);
    Prefs.storeUser(user);

    Prefs.loadUser().then((value) => {
      print(user.email),
      print(user.password)
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       color: Colors.grey.shade700,
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // #loginImage
          Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(70),
                    image: DecorationImage(image: AssetImage('assets/images/sh1.png',))
                  ),
                  
                  ),

                 SizedBox(height: 10,),
                Text("Wellcome back!",
                  style: TextStyle(color: Colors.grey.shade300,fontSize: 35,fontWeight: FontWeight.bold),),
                 SizedBox(height: 10,),
                Text("Login to your existant account of Q Allure",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 18
                ),),
                 SizedBox(height: 30,),

                // #email,Password
                Container(
                  margin:  EdgeInsets.only(left: 20,right: 20),
                  padding: EdgeInsets.only(left: 15),
                  height: 60,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.shade300),
                  child: TextField(
                    controller: emailController,
                    style: TextStyle(color: Colors.black,fontSize: 24),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Feather.user,size: 32,color: Colors.blue.shade400,),
                      hintText: "useremail@.mail.com",
                      hintStyle: TextStyle(color: Colors.grey.shade400,fontSize: 24),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  margin:  EdgeInsets.only(left: 20,right: 20),
                  padding: EdgeInsets.only(left: 15),
                  height: 60,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.shade300),
                  child: TextField(
                    controller: passwordController,
                    style: TextStyle(color: Colors.black,fontSize: 24),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Feather.lock,size: 32,color: Colors.blue.shade400,),
                      hintText: "password",
                      hintStyle: TextStyle(color: Colors.grey.shade400,fontSize: 24),
                      border: InputBorder.none,
                    ),
                    obscureText: true,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forgot Password?",style: TextStyle(color: Colors.white70,fontSize: 18),)
                    ],
                  ),
                ),
                SizedBox(width: 20,),

                // #logIN
                Container(
                  decoration:BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade800,
                        spreadRadius: 7,
                        blurRadius: 7,
                        offset: Offset(0, 10), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25)
                  ),
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 100,right: 100),
                  height: 50,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    color: Colors.blue.shade900,
                    onPressed: _doLogin,
                    child: Text("LOG IN",style: TextStyle(color: Colors.white,fontSize:18,fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(height: 70,),
                Text("Or connect using",style: TextStyle(color: Colors.grey.shade300,fontSize: 18),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                      decoration:BoxDecoration(

                          borderRadius: BorderRadius.circular(25)
                      ),
                      width: double.infinity,
                      height: 50,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        color: Colors.blue.shade600,
                        onPressed: (){},
                        child: Text("FaceBook",style: TextStyle(color: Colors.white,fontSize:18,fontWeight: FontWeight.bold),),
                      ),
                    ),),
                    SizedBox(width: 10,),
                    Expanded(child: Container(
                      decoration:BoxDecoration(

                          borderRadius: BorderRadius.circular(25)
                      ),
                      width: double.infinity,
                      height: 50,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        color: Colors.red.shade700,
                        onPressed: (){},
                        child: Text("Google",style: TextStyle(color: Colors.white,fontSize:18,fontWeight: FontWeight.bold),),
                      ),
                    ),),
                    SizedBox(width: 20,),
                  ],
                ),

                SizedBox(height: 70,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don`t have an account?",style: TextStyle(color: Colors.grey.shade300),),
                    SizedBox(width: 10,),
                    GestureDetector(
                      child: Text("Sign Up",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 18),),
                    onTap: (){
                        Navigator.pushNamed(context, UpPage.id);
                    },
                    )
                  ],
                )


              ],
            ),
      ),
    );
  }
}
