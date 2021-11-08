import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          height: screenHeight/7,
          width: screenWidth,
          decoration: const BoxDecoration(
            color: Colors.white
          ),
        ),
      ),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  ///BOTTOM NAVIGATION BAR
  Widget getBottomNavigationBar() {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.white30),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.video_collection_outlined,
                  color: Colors.white30),
              onPressed: () {},
            ),
            IconButton(
              icon:
                  const Icon(Icons.emoji_emotions_sharp, color: Colors.white30),
              onPressed: () {},
            ),
            IconButton(
                icon: const Icon(Icons.search_outlined, color: Colors.white30),
                onPressed: () {}
                ),
            IconButton(
                icon: const Icon(Icons.download_rounded, color: Colors.white30),
                onPressed: () {}
                )
          ],
        ),
      ),
    );
  }
}
