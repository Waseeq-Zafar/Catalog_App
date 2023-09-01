import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final imageUrl="https://cdn3.vectorstock.com/i/1000x1000/30/97/flat-business-man-user-profile-avatar-icon-vector-4333097.jpg";
    return Drawer(
      child: Container(
        color: Colors.indigo,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text("Waseeq zafar",textScaleFactor: 1.1,),
              accountEmail: Text("abc.gmail.com",textScaleFactor: 1.1,),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),

            ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home,color: Colors.white,
              ),
              title: Text("Home",textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,

                ),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled,color: Colors.white,
              ),
              title: Text("Prpfile",textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,

                ),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail,color: Colors.white,
              ),
              title: Text("Mail",textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,

                ),),
            ),
          ],
        ),
      ),
    );
  }
}