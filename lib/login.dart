import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:minto/register.dart';
import 'package:minto/tablebooking.dart';
import 'package:minto/tableselection.dart';
import 'const.dart';


class Log extends StatefulWidget {
  const Log({Key? key}) : super(key: key);

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  var username = TextEditingController();
  var password = TextEditingController();
  Future<void> getData() async {
    var data = {
      "username":username.text,
      "password":password.text,
    };
    // var response = await post(Uri.parse('http://192.168.68.114/demos/login.php'),body: data);
    // var res = jsonDecode(response.body);
    // print(res);
    // if(response.statusCode==200){
    //   Fluttertoast.showToast(msg: 'Successfully Login...');
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (context) {
    //       return TableSelection();
    //     },
    //   ));
    // }
    //
    // else {
    //   Fluttertoast.showToast(msg: 'Something went wrong!');
    // }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/Chinese Cuisine Recipes Hotel Restaurant Menu Meals Convenient Poster Background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sign In'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 22,right: 28,left: 28,bottom: 10),
                  child: TextFormField(
                    controller: username,
                    decoration: InputDecoration(
                      hintText: 'Username',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 28,left: 28,bottom: 10),
                  child: TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    getData();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Tablebooking()));
                  },
                  child: Container(
                    child: Center(child: Text('Login')),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xFFBBA26D),
                    ),
                    height: 50,
                    width: 300,

                  ),
                ),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Reg()));
                }, child: Text("Don't have any account please login her!"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
