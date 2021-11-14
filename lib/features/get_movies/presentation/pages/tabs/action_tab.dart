import 'package:flutter/material.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/movie_entity.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/controllers/home_controller.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/widgets/card_poster_widget.dart';

class ActionTab extends StatefulWidget {
  final HomePageController homePageController;
  const ActionTab({Key? key, required this.homePageController})
      : super(key: key);

  @override
  _ActionTabState createState() => _ActionTabState();
}

class _ActionTabState extends State<ActionTab> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MovieEntity>>(
        initialData: [],
        stream: widget.homePageController.listMovies,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return CardPosterWidget(
                      title: snapshot.data![index].title,
                      pathImage: snapshot.data![index].posterPath,
                      genreIds: snapshot.data![index].genreIds,
                    );
                  })
              : CircularProgressIndicator();
        });
  }
}
