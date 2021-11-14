import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: screenHeight / 2.5,
              child: Column(
                children: [
                  Image.asset(
                    'assets/playimage.jpg',
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.cast,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            Positioned(
                top: 260,
                left: 10,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'The Kissing Booth 3',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            '2021',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Container(
                            color: Colors.white30,
                            child: const Text(
                              '13+',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Text(
                            '1h 53m',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Container(
                            color: Colors.white24,
                            child: const Text(
                              'HD',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 343,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.play_arrow,
                              color: Colors.black,
                            ),
                            Text(
                              'Play',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 343,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.file_download,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Download',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: screenWidth/1.1,
                        child: const Text(
                          "When teenager Elle's first kiss leads to a forbidden romance with the hottest boy in high school, she risks her relationship with her best friend.",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 12,),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Cast:Joey King,Joel Courtney,Jacob Elordi',style: TextStyle(color: Colors.white54),),
                            Text('Director: Vince Marcello',style: TextStyle(color: Colors.white54))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: screenWidth/1.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                IconButton(
                                    onPressed: (){},
                                    icon: const Icon(Icons.add,color: Colors.white,)
                                ),
                                const Text('My List',style: TextStyle(color: Colors.white54),),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: (){},
                                    icon: const Icon(Icons.thumb_up_alt_outlined,color: Colors.white,)
                                ),
                                const Text('My List',style: TextStyle(color: Colors.white54),),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: (){},
                                    icon: const Icon(Icons.near_me_outlined,color: Colors.white,)
                                ),
                                const Text('My List',style: TextStyle(color: Colors.white54),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
