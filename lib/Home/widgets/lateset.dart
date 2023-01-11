import "package:flutter/material.dart";
import '../../Utils/fonts.dart';

import '../description.dart';

class Latest extends StatelessWidget {
  //const Latest({Key? key}) : super(key: key);

  final List latest;

  Latest({required this.latest});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: "Latest", color: Colors.white, size: 16.0),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: latest.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Descripton(
                                  name: latest[index]['title'],
                                  bannerurl: "https://image.tmdb.org/t/p/w500" +
                                      latest[index]['poster_path'],
                                  posterurl: "https://image.tmdb.org/t/p/w500" +
                                      latest[index]['poster_path'],
                                  description: latest[index]['overview'],
                                  vote:
                                      latest[index]['vote_average'].toString(),
                                  launch_on: latest[index]['release_date'])));
                    },
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500" +
                                        latest[index]["poster_path"]),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: modified_text(
                                text: latest[index]['original_title'] != null
                                    ? latest[index]['original_title']
                                    : 'Loading...',
                                color: Colors.white,
                                size: 16.0),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ))
        ],
      ),
    );
  }
}
