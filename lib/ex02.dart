import 'package:flutter/material.dart';

class Exercise02 extends StatelessWidget {
  const Exercise02({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercise 02',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
        ),
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {},
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
            child: Image.network(
              'https://picsum.photos/250?image=1',
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          onPressed: () {},
          child: const Icon(
            Icons.change_circle,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
