import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";

import 'package:url_launcher/url_launcher.dart';

class Mydrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Developer : Sanjoy Pator"),
            accountEmail: Text("Stay safe, Stay healthy"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "http://www.uniqofficial.me/assets/img/profile_pic_Capture.png"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.tap_and_play_rounded),
            title: Text("API provided by :"),
            subtitle: RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.blue),
                  text: "API Setu Co-WIN Public APIs",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      var url =
                          "https://apisetu.gov.in/public/marketplace/api/cowin#/";
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw "Cannot load Url";
                      }
                    }),
            ),
            //trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("Email for help :"),
            subtitle: Text("sanjoyofficialp@gmail.com"),
            //trailing: Icon(Icons.send),
          ),
          ListTile(
            leading: Icon(Icons.laptop),
            title: Text("Website to contact me :"),
            subtitle: RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.blue),
                  text: "Click to open link www.uniqofficial.me",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      var url = "http://www.uniqofficial.me";
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw "Cannot load Url";
                      }
                    }),
            ),
            //trailing: Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
