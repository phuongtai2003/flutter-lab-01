import 'package:flutter/material.dart';

class Exercise03 extends StatelessWidget {
  const Exercise03({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercise 03',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
        ),
        useMaterial3: false,
      ),
      home: const Exercise03App(),
    );
  }
}

class Exercise03App extends StatefulWidget {
  const Exercise03App({
    super.key,
  });

  @override
  State<Exercise03App> createState() => _Exercise03AppState();
}

class _Exercise03AppState extends State<Exercise03App> {
  bool _isFabClickable = true;
  int index = 0;

  List<String> imgUrls = [
    'https://picsum.photos/250?image=1',
    'https://picsum.photos/250?image=2',
    'https://picsum.photos/250?image=3',
    'https://picsum.photos/250?image=4',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _isFabClickable = false;
              });
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          title: const Text(
            'Flutter Image Viewer',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: _isFabClickable
              ? Image.network(
                  imgUrls[index],
                )
              : Image.asset(
                  'assets/images/stop.jpeg',
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          if (_isFabClickable) {
            setState(() {
              index = (index + 1) % imgUrls.length;
            });
          }
        },
        child: const Icon(
          Icons.change_circle,
          color: Colors.white,
        ),
      ),
    );
  }
}
