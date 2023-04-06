import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:minto/const.dart';
import 'package:minto/login.dart';

class Reg extends StatefulWidget {
  const Reg({Key? key}) : super(key: key);

  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {
  String? employstatus;
  String? genders;
  var name = TextEditingController();
  var mobile = TextEditingController();
  var email = TextEditingController();
  var username = TextEditingController();
  var password = TextEditingController();

  Future<void> getData() async {
    var data = {
      "name":name.text,
      "email":email.text,
      "mobile":mobile.text,
      "username":username.text,
      "password":password.text,
    };
    // print(data);
    // var response = await post(Uri.parse('${Con.url}reg.php'),body: data);
    // print(response.body);
    // if(response.statusCode==200){
    //   var res = jsonDecode(response.body)["message"];
    //   if(res=='Added'){
    //     const snackBar = SnackBar(
    //       content: Text('Successfully Registered'),
    //     );
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //     //
    //     //Fluttertoast.showToast(msg:"successfully registered");
    //     Navigator.push(context, MaterialPageRoute(
    //       builder: (context) {
    //         return Log();
    //       },
    //     ));
    //   }
    //
    // }
    // else {
    //   Fluttertoast.showToast(msg: 'Something went wrong!');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Register",style: TextStyle(color: Colors.black),),
          backgroundColor: Color(0xFFE1B812),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body:
      Center(
        child: ListView(
          children:  [
            Padding(
              padding:const EdgeInsets.all(8.0),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:"Name",hintText: "Enter your name",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: mobile,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:"Phone_no",hintText: "Enter your Phone number",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:"Email id",hintText: "Enter Email id",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),

              child: TextField(
                controller: username,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:"User name",hintText: "Enter Username",
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),

                  labelText:"Password",hintText: "Enter Password",
                ),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                getData();
              },
              child: Container(
                width: 50,
                height: 40,
                child: Center(
                  child: Text('Register',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.amber, borderRadius: BorderRadius.circular(50)),
              ),
            )
          ],
        ),
      ),
    );
  }
}