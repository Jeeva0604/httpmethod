import 'package:flutter/material.dart';
import 'package:httpmethod/View/mainhomescreen.dart';

class DeleteScreenWidget extends StatefulWidget {
  const DeleteScreenWidget({super.key});

  @override
  State<DeleteScreenWidget> createState() => _DeleteScreenWidgetState();
}

class _DeleteScreenWidgetState extends State<DeleteScreenWidget> {
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
    );
  }
}
