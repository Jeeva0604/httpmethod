import 'package:flutter/material.dart';

import '../../Controller/Connection.dart';
import '../../Model/CreateUser.dart';
import '../mainhomescreen.dart';

class PostHomeScreenWidget extends StatefulWidget {
  const PostHomeScreenWidget({Key? key}) : super(key: key);

  @override
  State<PostHomeScreenWidget> createState() => _PostHomeScreenWidget();
}

class _PostHomeScreenWidget extends State<PostHomeScreenWidget> {
  String? name;
  String? job;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('HTTP Method'),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => const MainHomeWidget()),
              );
            },
          ),
        ),
        body: Center(
          child: Container(
            height: 250,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Enter Your Detail',
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(
                  height: 3,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 5,
                ),
                Card(
                  child: TextFormField(
                    onChanged: (value) {
                      name = value;
                    },
                    validator: (value) =>
                        value!.isEmpty ? 'name cannot be blank' : null,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Enter Your Name',
                      labelText: 'Name *',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Card(
                  child: TextFormField(
                    onChanged: (value) {
                      job = value;
                    },
                    validator: (value) =>
                        value!.isEmpty ? 'job cannot be blank' : null,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.work),
                      hintText: 'Enter Your Job',
                      labelText: 'Job*',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black,
                  ),
                  child: TextButton(
                    onPressed: () {
                      print(name);
                      print(job);
                      createUser(UserCreateBody(name: name, job: job))
                          .then((value) => print(value))
                          .catchError((er) {
                        print(er);
                      });
                    },
                    child: const Text(
                      'Post Data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
