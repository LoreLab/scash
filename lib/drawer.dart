import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class DrawerScreen extends StatefulWidget {
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFDADADA),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: Text("Lorenzi"),
                accountEmail: Text("nao@gm.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Theme
                      .of(context)
                      .platform == TargetPlatform.iOS
                      ? Colors.grey
                      : Colors.white,
                  child: IconButton(icon: Icon(Icons.mail, color: Colors.white),
                    onPressed: () {},),
                ),
              ),
              ListTile(
                  leading: Image.asset(
                    "assets/images/"
                  ),
                  title: Text('Mon Compte'),
                  onTap: () {}
              ),
              ListTile(
                  leading: Image.asset(
                    "assets/images/"
                  ),
                  title: Text('Virement'),
                  onTap: () {}
              ),
              ListTile(
                leading: Image.asset(
                    "assets/images/"
                ),
                title: Text('Obtenir du credit'),
                onTap: () {},
              ),
              ListTile(
                leading: Image.asset(
                    "assets/images/"
                ),
                title: Text('Cartes'),
                onTap: () {},
              ),
              ListTile(
                leading: Image.asset(
                    "assets/images/"
                ),
                title: Text('Inviter & gagner'),
                onTap: () {},
              ),
              Divider(),

              ListTile(
                leading: Image.asset(
                    "assets/images/"
                ),
                title: Text('Parametre'),
                onTap: () {},
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.settings, color: Colors.red),
                  onPressed: () {},
                ),
                title: Text('Parametre'),
                onTap: () {},
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.settings, color: Colors.red),
                  onPressed: () {},
                ),
                title: Text('Parametre'),
                onTap: () {},
              ),
            ],
          )
      ),
    );
  }
}
