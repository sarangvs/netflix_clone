import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_clone/Widgets/horizontal_list.dart';
import 'package:netflix_clone/screen_2.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                  systemNavigationBarColor: Colors.transparent),
              leading: const Image(
                image: AssetImage('assets/netflix_logo.png'),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.cast, color: Colors.white)),
                IconButton(
                    onPressed: () {},
                    icon: const Image(
                      image: AssetImage('assets/profile.png'),
                    ))
              ],
              bottom: PreferredSize(
                preferredSize: Size(screenWidth, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      'TvShows',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Movies',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Categories',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  child: Image(
                    image: AssetImage('assets/cover2.jpg'),
                  ),
                ),
                Container(
                    color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              )),
                          const Text(
                            'My List',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Container(
                        width: 60,
                        decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2)
                        ),
                       
                        child: Row(
                          children: const [
                            Icon(
                              Icons.play_arrow,
                              color: Colors.black,
                            ),
                            Text('Play')
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.info_outline,
                                color: Colors.white,
                              )),
                          const Text(
                            'Info',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Popular on Netflix',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),
                  textAlign: TextAlign.left,
                ),
               const SizedBox(height: 10,),
               SizedBox(
                 height: 180,
                 child: ListView(
                   scrollDirection: Axis.horizontal,
                   children: [
                     buildCard(),
                     const SizedBox(width: 12,),
                     buildCard(),
                     const SizedBox(width: 12,),
                     buildCard(),
                     const SizedBox(width: 12,),
                     buildCard(),
                     const SizedBox(width: 12,),
                     buildCard(),
                     const SizedBox(width: 12,),
                     buildCard(),
                     const SizedBox(width: 12,),
                   ],
                 ),
               ),
                const SizedBox(height: 10,),
                const Text(
                  'Trending Now',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildCard(),
                      const SizedBox(width: 12,),
                      buildCard(),
                      const SizedBox(width: 12,),
                      buildCard(),
                      const SizedBox(width: 12,),
                      buildCard(),
                      const SizedBox(width: 12,),
                      buildCard(),
                      const SizedBox(width: 12,),
                      buildCard(),
                      const SizedBox(width: 12,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white54,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white54, fontSize: 10),
                ),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.video_collection_outlined,
                  color: Colors.white54,
                ),
                title: Text(
                  'Comming Soon',
                  style: TextStyle(color: Colors.white54, fontSize: 10),
                ),
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.emoji_emotions_rounded,
                  color: Colors.white54,
                ),
                title: Text(
                  'Fast Laughs',
                  style: TextStyle(color: Colors.white54, fontSize: 10),
                ),
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.white54,
                ),
                title: Text(
                  'Search',
                  style: TextStyle(color: Colors.white54, fontSize: 10),
                ),
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.download_rounded, color: Colors.white54),
                title: Text(
                  'Downloads',
                  style: TextStyle(color: Colors.white54, fontSize: 10),
                ),
                backgroundColor: Colors.black),
          ],
        ),
      ),
    );
  }
  Widget buildCard()=>SizedBox(
    width: 130,
    height: 140,
    child: Image.asset('assets/cover.png',fit: BoxFit.fill,),
  );
}

