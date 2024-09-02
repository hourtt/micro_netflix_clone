// ignore_for_file: unused_local_variable, unused_import

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/api/api.dart';
import '../model/movie_model.dart';
import 'movie_detailed_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Movie>> popularMovies;
  //TODO: Create variables for upcomingMovies and topRatedMovies
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> topRatedMovies;

  @override
  void initState() {
    upcomingMovies = Api().getUpcomingMovies();
    //TODO: Initialize upcomingMovies and topRatedMovies
    popularMovies = Api().getPopularMovies();
    topRatedMovies = Api().getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Set background color with Colors.black12
      backgroundColor: Colors.black12,
      //TODO: Create AppBar for netfix logo and user icon. You can put your own picture for your user icon if you want :)
      appBar: AppBar(
        //surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.black12,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: Image.asset('images/netflix.png', fit: BoxFit.contain),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Image.asset(
                'images/capybara.jpeg',
                width: 40.0, // Set the width
                height: 40.0, // Set the height
                fit: BoxFit.cover, // To make sure the image covers the area
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO: Create upcoming movie section. Use 'CarouselSlider.builder' instead of 'ListView.builder' . Use backDropPath as url of network image. Refer below Popular section!!
              //* upcoming movies
              Text(
                'Upcoming',
                style: GoogleFonts.amiko(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 200,
                child: FutureBuilder(
                  future: upcomingMovies,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                          backgroundColor: Colors.white,
                        ),
                      );
                    }
                    final movies = snapshot.data!;
                    return CarouselSlider.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index, realIndex) {
                        final movie = movies[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(     
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailScreen(
                                  movie: movies[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 200,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              child: Image.network(
                                "https://image.tmdb.org/t/p/original/${movie.backDropPath}",
                                height:120,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: 200.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        enableInfiniteScroll: true,
                        viewportFraction: 0.8,
                      ),
                    );
                  },
                ),
              ),

              //Popular Movies
              //*  popular movies
              Text(
                'Popular',
                style: GoogleFonts.amiko(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              //TODO: Create popular movie section. Use 'CarouselSlider.builder' instead of 'ListView.builder
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 200,
                child: FutureBuilder(
                  future: popularMovies,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                          backgroundColor: Colors.white,
                        ),
                      );
                    }
                    final movies = snapshot.data!;
                    return CarouselSlider.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index, realIndex) {
                        final movie = movies[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailScreen(
                                  movie: movies[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 200,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              child: Image.network(
                                  "https://image.tmdb.org/t/p/original/${movie.posterPath}",
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: 200.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        enableInfiniteScroll: true,
                        viewportFraction: 0.8,
                      ),
                    );
                  },
                ),
              ),

              //TODO: Create Top Rated movie section. Use posterPath as url of network image. Refer Popular section!!
              //*  top rated movies
              Text("Top Rated Movies",
                  style:
                      GoogleFonts.amiko(fontSize: 20.0, color: Colors.white)),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 200,
                child: FutureBuilder(
                  future: topRatedMovies,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                          backgroundColor: Colors.white,
                        ),
                      );
                    }

                    final movies = snapshot.data!;
                    return CarouselSlider.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index, realIndex) {
                        final movie = movies[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailScreen(
                                  movie: movies[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 200,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                             child: Image.network(
                                  "https://image.tmdb.org/t/p/original/${movie.posterPath}",
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: 200.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        enableInfiniteScroll: true,
                        viewportFraction: 0.8,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
