import 'package:flutter/material.dart';
import 'package:pemula_submission/components/favorite_button.dart';
import 'package:pemula_submission/components/text_with_box.dart';
import 'package:pemula_submission/components/text_with_icon.dart';
import 'package:pemula_submission/model/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;
  final String heroTag;

  const MovieDetailScreen(this.movie, this.heroTag, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth <= 800) {
        return MovieDetailSmallScreen(movie, heroTag);
      } else {
        return MovieDetailLargeScreen(movie, heroTag);
      }
    });
  }
}

class MovieDetailSmallScreen extends StatelessWidget {
  final Movie movie;
  final String heroTag;

  const MovieDetailSmallScreen(this.movie, this.heroTag, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff1A1923),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: heroTag,
                      child: Container(
                        height: 380,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(movie.poster),
                                fit: BoxFit.fitWidth,
                                alignment: FractionalOffset.topCenter
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          top: 8.0
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black26.withOpacity(0.4),
                              radius: 20,
                              child: IconButton(
                                // remove default padding here
                                padding: EdgeInsets.zero,
                                icon: const Icon(Icons.arrow_back_rounded),
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            const FavoriteButton()
                          ]
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xff1A1923).withOpacity(0.0),
                                  const Color(0xff1A1923).withOpacity(0.2),
                                  const Color(0xff1A1923).withOpacity(0.4),
                                  const Color(0xff1A1923).withOpacity(0.6),
                                  const Color(0xff1A1923).withOpacity(0.9),
                                  const Color(0xff1A1923)
                                ]
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 16,
                      left: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            movie.title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              fontFamily: "Roboto"
                            ),
                          ),
                          TextWithBox(
                            "IMDb ${movie.rating}",
                            color: const Color(0xffFDE400),
                            fontSize: 16,
                            fontColor: Colors.black,
                            fontFamily: "Impact",
                            padding: const EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 5
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWithBox(
                        movie.year.toString(),
                        color: const Color(0xffFF5740),
                        fontSize: 14,
                        fontFamily: "Roboto",
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        child: CircleAvatar(
                          backgroundColor: Color(0xffFFFEFF),
                          radius: 4,
                        ),
                      ),
                      TextWithIcon(
                          movie.duration,
                          textStyle: const TextStyle(
                              fontSize: 14,
                              color: Color(0xffFFFEFF),
                            fontFamily: "Roboto"
                          ),
                          icon: const Icon(
                            Icons.access_time_outlined,
                            color: Color(0xffFFFEFF),
                            size: 16,
                          )
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        child: CircleAvatar(
                          backgroundColor: Color(0xffFFFEFF),
                          radius: 4,
                        ),
                      ),
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
                ),
                const SizedBox(height: 14,),
                Container(
                  height: 20,
                  padding: const EdgeInsets.only(left: 16.0),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final genre = movie.genre[index];

                      return TextWithBox(
                        genre,
                        color: const Color(0xff363638),
                        fontFamily: "Roboto",
                      );
                    },
                    itemCount: movie.genre.length,
                    separatorBuilder: (context, index) => const SizedBox(width: 8,),
                  ),
                ),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      color: Color(0xffFFFEFF),
                      fontSize: 18,
                      fontFamily: "Roboto"
                    ),
                  ),
                ),
                const SizedBox(height: 6,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    movie.description,
                    style: const TextStyle(
                        color: Color(0xffFFFEFF),
                        fontSize: 15,
                      fontFamily: "Roboto"
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}

class MovieDetailLargeScreen extends StatelessWidget {
  final Movie movie;
  final String heroTag;
  const MovieDetailLargeScreen(this.movie, this.heroTag, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A1923),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 24, left: 8, right: 8),
          width: 800,
          child: Column(
            mainAxisAlignment: MainAxisAlignment. start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black26.withOpacity(0.4),
                    radius: 20,
                    child: IconButton(
                      // remove default padding here
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.arrow_back_rounded),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Text(
                    movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"
                    ),
                  ),
                  const FavoriteButton()
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(movie.poster)
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWithBox(
                          "IMDb ${movie.rating}",
                          color: const Color(0xffFDE400),
                          fontSize: 20,
                          fontColor: Colors.black,
                          fontFamily: "Impact",
                          padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 5
                          ),
                        ),
                        const SizedBox(height: 14,),
                        Row(
                          children: [
                            TextWithBox(
                              movie.year.toString(),
                              color: const Color(0xffFF5740),
                              fontSize: 16,
                              fontFamily: "Roboto",
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14),
                              child: CircleAvatar(
                                backgroundColor: Color(0xffFFFEFF),
                                radius: 4,
                              ),
                            ),
                            TextWithIcon(
                                movie.duration,
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xffFFFEFF),
                                  fontFamily: "Roboto"
                                ),
                                icon: const Icon(
                                  Icons.access_time_outlined,
                                  color: Color(0xffFFFEFF),
                                  size: 18,
                                )
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14),
                              child: CircleAvatar(
                                backgroundColor: Color(0xffFFFEFF),
                                radius: 4,
                              ),
                            ),
                            TextWithIcon(
                                movie.director,
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xffFFFEFF),
                                  fontFamily: "Roboto"
                                ),
                                icon: const Icon(
                                  Icons.person,
                                  color: Color(0xffFFFEFF),
                                  size: 18,
                                )
                            )
                          ],
                        ),
                        const SizedBox(height: 14,),
                        const Text(
                          "Description",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: "Roboto"
                          )
                        ),
                        const SizedBox(height: 8,),
                        Text(
                          movie.description,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "Roboto"
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
