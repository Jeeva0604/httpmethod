import 'package:flutter/material.dart';

import '../../Controller/Connection.dart';
import '../../Model/UpdateUser.dart';
import '../mainhomescreen.dart';

class PutScreenWidget extends StatefulWidget {
  const PutScreenWidget({super.key});

  @override
  State<PutScreenWidget> createState() => _PutScreenWidgetState();
}

class _PutScreenWidgetState extends State<PutScreenWidget> {
  String? name;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Put Method'),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainHomeWidget(),
                  ),
                );
              }),
        ),
        body: Center(
          child: Container(
            height: 200,
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
                  'Update Your Detail',
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
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Enter Your Name',
                      labelText: 'Name *',
                    ),
                  ),
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
                      updateAlbum("2", UpdateDetail(name: name)).then((value) {
                        print(value);
                      }).catchError((er) {
                        print(er);
                      });
                    },
                    child: const Text(
                      'Update Data',
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
