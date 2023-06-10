import 'package:flutter/material.dart';
import 'package:httpmethod/Controller/Connection.dart';
import 'package:httpmethod/Model/DeleteUser.dart';
import 'package:httpmethod/View/mainhomescreen.dart';

class DeleteScreenWidget extends StatefulWidget {
  const DeleteScreenWidget({super.key});

  @override
  State<DeleteScreenWidget> createState() => _DeleteScreenWidgetState();
}

class _DeleteScreenWidgetState extends State<DeleteScreenWidget> {
  late Future<Album> _futureAlbum;
  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Method'),
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
        child: FutureBuilder<Album>(
          future: _futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(snapshot.data?.title ?? 'Deleted'),
                    ElevatedButton(
                      child: const Text('Delete Data'),
                      onPressed: () {
                        setState(() {
                          _futureAlbum =
                              deleteAlbum(snapshot.data!.id.toString());
                        });
                      },
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
