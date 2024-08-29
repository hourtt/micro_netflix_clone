import 'package:flutter/material.dart';
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
    popularMovies = Api().getUpcomingMovies();
    //TODO: Initialize upcomingMovies and topRatedMovies
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Set background color with Colors.black12
      backgroundColor: Colors.black12,
      //TODO: Create AppBar for netfix logo and user icon. You can put your own picture for your user icon if you want :)
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO: Create upcoming movie section. Use 'CarouselSlider.builder' insteed of 'ListView.builder' . Use backDropPath as url of network image. Refer below Popular section!!

              //Popular Movies
              const Text(
                'Popular',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 200,
                child: FutureBuilder(
                  future: popularMovies,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final movies = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];

                        return InkWell(
                            onTap: () {
                              //TODO: You sould understand it. It gives movie data to MovieDetailScreen.
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
                              width: 150,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/original/${movie.posterPath}",
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ));
                      },
                    );
                  },
                ),
              ),

              //TODO: Create Top Rated movie section. Use posterPath as url of network image. Refer Popular section!!
            ],
          ),
        ),
      ),
    );
  }
}
