import 'package:flutter/material.dart';

import '../../Controller/Connection.dart';
import '../../Model/UserListResponse.dart';

class GetHomePageWidget extends StatefulWidget {
  const GetHomePageWidget({super.key, required this.title});

  final String title;

  @override
  State<GetHomePageWidget> createState() => _GetHomePageWidget();
}

class _GetHomePageWidget extends State<GetHomePageWidget> {
  UserListResponse? response;

  @override
  void initState() {
    super.initState();

    fetchUsers("1").then((value) {
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
        child: ListView.builder(
            itemCount: response?.data?.length ?? 0,
            itemBuilder: (BuildContext ctxt, int index) {
              const CircularProgressIndicator();
              return Card(
                child: Row(
                  children: [
                    Image.network(response!.data![index].avatar!),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          response!.data![index].firstName!,
                          style: const TextStyle(fontSize: 30),
                        ),
                        Text(
                          response!.data![index].lastName!,
                          style: const TextStyle(fontSize: 30),
                        )
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
