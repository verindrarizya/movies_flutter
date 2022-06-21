import 'package:flutter/material.dart';
import 'package:pemula_submission/components/text_with_icon.dart';
import 'package:pemula_submission/components/text_with_box.dart';
import 'package:pemula_submission/model/movie.dart';
import 'package:pemula_submission/screens/movie_detail_screen.dart';

import '../components/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Movies",
          style: TextStyle(
            fontFamily: "Roboto"
          ),
        ),
        backgroundColor: const Color(0xff0A0A0C),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xff1A1923)
        ),
        child: LayoutBuilder(
          builder: (context, constrains) {
            if (constrains.maxWidth <= 650) {
              return const MovieList();
            } else if (constrains.maxWidth <= 950) {
              return const MovieGrid(2);
            } else if (constrains.maxWidth <= 1250) {
              return const MovieGrid(3);
            } else {
              return const MovieGrid(4);
            }
          },
        )
      )
    );
  }
}

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context, index) {
      final movie = movies[index];

      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MovieDetailScreen(movie, "poster $index");
          }));
        },
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          color: const Color(0xff282828),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Hero(
                    tag: "poster $index",
                    child: Image.asset(
                      movie.poster,
                      height: 100,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            fontFamily: "Roboto"
                          ),
                        ),
                        const SizedBox(height: 6,),
                        Row(
                          children: [
                            TextWithBox(
                              movie.year.toString(),
                              color: const Color(0xffFF5740),
                              fontFamily: "Roboto",
                            ),
                            const SizedBox(width: 12,),
                            TextWithIcon(
                                movie.rating.toString(),
                                textStyle: const TextStyle(
                                  fontFamily: "Roboto",
                                  color: Colors.white
                                ),
                                icon: const Icon(Icons.star, color: Colors.amber, size: 16,)
                            )
                          ],
                        ),
                        const SizedBox(height: 8,),
                        Text(
                          movie.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: descTextStyle,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
      itemCount: movies.length,
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 8,
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 6,),
    );
  }
}

class MovieGrid extends StatelessWidget {
  final int gridCount;

  const MovieGrid(this.gridCount, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0
      ),
      crossAxisCount: gridCount,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: movies.map((movie) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MovieDetailScreen(movie, "poster");
            }));
          },
          child: Card(
            color: const Color(0xff282828),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(movie.poster, height: 150,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: const TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                TextWithBox(
                                  movie.year.toString(),
                                  color: const Color(0xffFF5740),
                                  fontFamily: "Roboto",
                                ),
                                const SizedBox(width: 12,),
                                TextWithIcon(
                                    movie.rating.toString(),
                                    textStyle: const TextStyle(
                                      fontFamily: "Roboto",
                                      color: Colors.white
                                    ),
                                    icon: const Icon(Icons.star, color: Colors.amber, size: 16,)
                                )
                              ],
                            ),
                            const SizedBox(height: 10.0,),
                            TextWithIcon(
                                movie.director,
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xffFFFEFF),
                                  fontFamily: "Roboto"
                                ),
                                icon: const Icon(
                                  Icons.person,
                                  color: Color(0xffFFFEFF),
                                  size: 16,
                                )
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        movie.description,
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto"
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ),
        );
      }).toList(),
    );
  }
}
