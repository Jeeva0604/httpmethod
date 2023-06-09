import 'package:flutter/material.dart';
import 'package:httpmethod/Model/SingleUserResponse.dart';

import '../../Controller/Connection.dart';

class SingleUserHomeWidget extends StatefulWidget {
  const SingleUserHomeWidget({super.key, required this.title});

  final String title;
  @override
  State<SingleUserHomeWidget> createState() => _SingleUserHomeWidget();
}

class _SingleUserHomeWidget extends State<SingleUserHomeWidget> {
  SingleUserResponse? response;

  @override
  void initState() {
    super.initState();

    fetchSingleUsers("1").then((value) {
      print(value);
      setState(() {
        response = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(response!.data!.avatar!),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    response!.data!.firstName!,
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(
                    response!.data!.lastName!,
                    style: const TextStyle(fontSize: 30),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
