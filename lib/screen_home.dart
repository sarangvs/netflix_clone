import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_clone/playscreen.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List trendingMovies = [];
  List popularMovies = [];
  List tvShows = [];
  final String apiKey = 'd4bd1dbbe323b3aac1351d0528af85ea';
  final readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNGJkMWRiYmUzMjNiM2FhYzEzNTFkMDUyOGFmODVlYSIsInN1YiI6IjYxOGZjYmJjY2NhN2RlMDA5MGVlNzkzYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sGGtqoDC4h0lv55jMjZ9vzqfrABWQDiVGYI99V2t5B0';

  @override
  void initState() {
    loadMovies();
    super.initState();
    setState(() {

    });
  }

  ///Load Movies
  void loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map popularMovieResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvShowsResults = await tmdbWithCustomLogs.v3.tv.getPouplar();

    setState(() {
      trendingMovies = trendingResult['results'];
      popularMovies = popularMovieResult['results'];
      tvShows = tvShowsResults['results'];
    });
    print('trendingggggggggggggggggggggggggggggggggggggggggg$trendingMovies');
    print('populaaaaaaaaaaaaaaaaaaaaaaaaaaaar$popularMovies');
    print('tvvvvvvvvvvvvvvvvvvv$tvShows');
  }

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
                width: 5,
                height: 5,
                fit: BoxFit.none,
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
                preferredSize: Size(screenWidth, 30),
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
                    ),
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
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2)),
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 10,
                ),
                ///Popular Movies
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: popularMovies.length,
                      itemBuilder: (context, index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PlayScreen(),
                                ));
                          },
                          child: Container(
                            width: 130,
                            height: 140,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500'+popularMovies[index]['poster_path']
                                  ),
                                )
                            ),
                          ),
                        );
                      }
                  )
                ),
                const SizedBox(
                  height: 10,
                ),
                ///Trending Movies
                const Text(
                  'Trending Now',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 180,
                  child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: trendingMovies.length,
                      itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PlayScreen(),
                              ));
                        },
                        child: Container(
                          width: 130,
                          height: 140,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500'+trendingMovies[index]['poster_path']
                              ),
                            )
                          ),
                        ),
                      );
                      }
                  )
                ),
                const SizedBox(
                  height: 10,
                ),
                ///TV SHOWS
                const Text(
                  'Tv Shows',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tvShows.length,
                      itemBuilder: (context, index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PlayScreen(),
                                ));
                          },
                          child: Container(
                            width: 130,
                            height: 140,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500'+tvShows[index]['poster_path']
                                  ),
                                )
                            ),
                          ),
                        );
                      }
                  )
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
                  color: Colors.white,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white, fontSize: 10),
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

  Widget buildCard() => GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PlayScreen(),
              ));
        },
        child: SizedBox(
          width: 130,
          height: 140,
          child: Image.asset(
            'assets/cover.png',
            fit: BoxFit.fill,
          ),
        ),
      );
}
