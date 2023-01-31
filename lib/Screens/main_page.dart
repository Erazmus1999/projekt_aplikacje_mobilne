import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projekt_aplikacje_mobilne/Firebase/database.dart';
import 'package:projekt_aplikacje_mobilne/Screens/add_fridge_item.dart';
import 'package:projekt_aplikacje_mobilne/Screens/auth/login_popup.dart';
import 'package:projekt_aplikacje_mobilne/Screens/fridge/fridge_content.dart';
import 'package:projekt_aplikacje_mobilne/Screens/fridge/shared_fridge_content.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title,});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) => Row(
              children: [
                TextButton(
                  onPressed: () {
                    snapshot.data == null
                        ? showDialog(
                            context: context,
                            builder: (context) => const LoginPopup(),
                          )
                        : null;
                  },
                  child: Text(
                    snapshot.data == null
                        ? 'Login'
                        : 'Hi there, ${snapshot.data!.email!.split('@')[0]}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (snapshot.data != null)
                  PopupMenuButton(
                    icon: const Icon(Icons.filter_list),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: TextButton(
                          child: const Text('Log out'),
                          onPressed: () {
                            FirebaseAuth.instance.signOut().then(
                                  (value) => Navigator.pop(context),
                                );
                          },
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return FridgeContent(
                    userId: snapshot.data!.email!,
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return SharedFridgeContent(
                    userId: snapshot.data!.email!,
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddFridgeItem(),
            ),
          ).then((value) => setState(() {}));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
