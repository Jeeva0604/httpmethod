import 'package:flutter/material.dart';

import 'GetSingleUser/SingleUserScreen.dart';
import 'GetScreen/GetScreen.dart';
import 'PostScreen/PostScreen.dart';
import 'PutScreen/putScreen.dart';
import 'DeleteScreen/DeleteScreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainHomeWidget(),
    );
  }
}

class MainHomeWidget extends StatefulWidget {
  const MainHomeWidget({super.key});

  @override
  State<MainHomeWidget> createState() => _MainHomeWidgetState();
}

class _MainHomeWidgetState extends State<MainHomeWidget> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP Method'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Get Single User

            SizedBox(
              height: 50,
              width: 180,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SingleUserHomeWidget(
                              title: 'Get Single User Method',
                            )),
                  );
                },
                child: const Text('Get Single User Data >'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // Get User

            SizedBox(
              height: 50,
              width: 180,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _futureAlbum = deleteAlbum(snapshot.data!.id.toString());
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GetHomePageWidget(
                              title: 'Get Method',
                            )),
                  );
                },
                child: const Text('Get User Data >'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //Post Method

            SizedBox(
              height: 50,
              width: 180,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PostHomeScreenWidget()),
                  );
                },
                child: const Text('Post Your Data >'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //Put Method

            SizedBox(
              height: 50,
              width: 180,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PutScreenWidget()),
                  );
                },
                child: const Text('Update User Data >'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //Delete Method

            SizedBox(
              height: 50,
              width: 180,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DeleteScreenWidget()),
                  );
                },
                child: const Text('Delete User Data >'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
