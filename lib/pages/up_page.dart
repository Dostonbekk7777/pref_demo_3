import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../models/user_model.dart';
import '../services/pref_service.dart';
class UpPage extends StatefulWidget {
  static final String id = "up_page";
  const UpPage({Key? key}) : super(key: key);

  @override
  State<UpPage> createState() => _UpPageState();
}

class _UpPageState extends State<UpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();


  void _doLogin() {
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String name = nameController.text.toString().trim();
    String phone = phoneController.text.toString().trim();
    String cpassword = cpasswordController.text.toString().trim();
    User user = new User(name:name,email: email, password: password, phone: phone, cpassword: cpassword,);
    Prefs.storeUser(user);

    Prefs.loadUser().then((value) => {
      print(user.name),
      print(user.email),
      print(user.phone),
      print(user.password),
      print(user.cpassword)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
        elevation: 0,
      ),
      body:Container(
        color: Colors.grey.shade700,
        height: double.infinity,
        child: SingleChildScrollView(
          child:
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Let`s Get Started!",
                  style: TextStyle(color: Colors.grey.shade300,fontSize: 35,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("Create an account to Q Allure to get all features",
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 18
                  ),),
                SizedBox(height: 50,),

                // #email,Password
                Container(
                  margin:  EdgeInsets.only(left: 20,right: 20),
                  padding: EdgeInsets.only(left: 15),
                  height: 60,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.shade300),
                  child: TextField(
                    controller: nameController,
                    style: TextStyle(color: Colors.black,fontSize: 24),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Feather.user,size: 32,color: Colors.blue.shade400,),
                      hintText: "Fullname",
                      hintStyle: TextStyle(color: Colors.grey.shade500,fontSize: 24),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
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
                      prefixIcon: Icon(Feather.mail,size: 32,color: Colors.blue.shade400,),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey.shade500,fontSize: 24),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  margin:  EdgeInsets.only(left: 20,right: 20),
                  padding: EdgeInsets.only(left: 15),
                  height: 60,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.shade300),
                  child: TextField(
                    controller: phoneController,
                    style: TextStyle(color: Colors.black,fontSize: 24),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Feather.phone,size: 32,color: Colors.blue.shade400,),
                      hintText: "Phone",
                      hintStyle: TextStyle(color: Colors.grey.shade500,fontSize: 24),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
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
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey.shade500,fontSize: 24),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  margin:  EdgeInsets.only(left: 20,right: 20),
                  padding: EdgeInsets.only(left: 15),
                  height: 60,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.shade300),
                  child: TextField(
                    controller: cpasswordController,
                    style: TextStyle(color: Colors.black,fontSize: 24),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Feather.lock,size: 32,color: Colors.blue.shade400,),
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Colors.grey.shade500,fontSize: 24),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 100,),

                // #CREATE
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
                    onPressed:_doLogin,
                    child: Text("CREATE",style: TextStyle(color: Colors.white,fontSize:18,fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(height: 70,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",style: TextStyle(color: Colors.grey.shade300),),
                    SizedBox(width: 10,),
                    GestureDetector(
                      child: Text("Login Here",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 18),),
                    onTap: (){
                        Navigator.pop(context);
                    },
                    )
                  ],
                )


              ],
            ),
        ),
      ),
    );
  }
}
