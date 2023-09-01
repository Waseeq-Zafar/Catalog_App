/*import 'package:flutter/material.dart';
import 'package:flutter1_app/utils/routes.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/login1.png",fit: BoxFit.cover,height: 200,width: 300,),
            SizedBox(height: 80.0),
            Text("WELCOME",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
            color: Colors.blue,
            ),
            ),
            SizedBox(height: 20.0),
            Padding(padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 40.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "ENTER USERNAME",
                    labelText: "USERNAME"
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "ENTER PASSWORD",
                    labelText: "PASSWORD"
                  ),
                ),
              ],
            ),

            ),
            SizedBox(height: 20.0),
            ElevatedButton(onPressed: (){Navigator.pushNamed(context, MyRoutes.homeRoutes);}, child: Text("LOGIN"),style: TextButton.styleFrom(minimumSize: Size(100, 40)),)

          ],
        ),
      ),
    );
  }
}*/

//using Statefull widget


/*import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter1_app/utils/routes.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState()=>_LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  String name="";
  bool changebutton=false;
  @override
  Widget build(BuildContext context){
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/login1.png"),
            SizedBox(height: 40.0),
            Text("Welcome $name",style: TextStyle(
              fontSize: 28.0,
              color: Colors.deepPurple,
            ),
            ),
            SizedBox(height: 20.0),
            Padding(padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "ENTER USERNAME",
                        labelText: "USERNAME"
                    ),
                    onChanged: (value){
                      name=value;
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "ENTER PASSWORD",
                        labelText: "PASSWORD"
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            InkWell(
              onTap: ()async{
                setState(() {
                  changebutton=true;
                });
                await Future.delayed(Duration(milliseconds: 9));
                Navigator.pushNamed(context, MyRoutes.homeRoutes);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 9),
                alignment: Alignment.center,
                width: changebutton?40:100,
                height: 40,
                child:changebutton?Icon(Icons.done,color: Colors.white,):Text("LOGIN",style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold,color: Colors.white),),
                decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(changebutton?100:8),

              ),
            ),
            ),
            //ElevatedButton(onPressed: (){Navigator.pushNamed(context, MyRoutes.homeRoutes);}, child: Text("LOGIN"),style: TextButton.styleFrom(minimumSize: Size(100, 40)),)
          ],
        ),
      ),

    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter1_app/utils/routes.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState()=>_LoginPageState();
}

class _LoginPageState extends State<LoginPage>{



  String name="";
  bool changestate=false;
  final _formkey=GlobalKey<FormState>();

  moveToHome(BuildContext context)async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changestate = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoutes);
      setState(() {
        changestate = false;
      });
    }
  }



  @override
  Widget build(BuildContext context){
    return Material(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.asset("assets/images/login1.png"),
                SizedBox(height: 80.0),
                Text("WELCOME $name",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple,fontSize: 24.0),),
                Padding(padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "ENTER USERNAME",
                        labelText: "USERNAME"
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Username Cannot Be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState((){});
                      },

                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "ENTER PASSWORD",
                        labelText: "PASSWORD"
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return"Password cannot be Empty";
                        }
                        else if(value.length<6){
                          return "PASSWORD SHOULD BE MIN OF 6 CHAR";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                ),
                SizedBox(height: 20.0),
                Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(changestate?50:8),
                  child: InkWell(
                    onTap: ()=>moveToHome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      alignment: Alignment.center,
                      width: changestate?40:100,
                      height: 40,
                      child: changestate?Icon(Icons.done,color: Colors.white):Text("Login",style: TextStyle(color: Colors.white,fontSize: 18.0),),
                    ),
                   ),

                  ),
                ],
             ),
          ),
          ),
      );
    }
}