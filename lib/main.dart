import 'package:delivery_app/screens/add_users.dart';
import 'package:delivery_app/screens/get_users.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Users Controller'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(25),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddUsers(),
                        ),
                      );
                    },
                    child: const Text("Add User")),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Get User"),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GetUsers(),
                      ),
                    );
                  },
                  child: const Text("Get Users"),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Update User")),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Delete User")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
