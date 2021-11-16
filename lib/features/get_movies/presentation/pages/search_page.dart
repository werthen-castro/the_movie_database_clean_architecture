import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:the_movie_database_clean_arch/core/style/custom_colors.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/movie_entity.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/usecases/search_movie_use_case.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/controllers/search_movie_controller.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/widgets/back_button_widget.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/widgets/card_poster_widget.dart';

class SearchMoviePage extends StatefulWidget {
  SearchMovieUseCase? useCase;
  SearchMoviePage({Key? key, this.useCase}) : super(key: key);

  @override
  _SearchMoviePageState createState() => _SearchMoviePageState();
}

class _SearchMoviePageState extends State<SearchMoviePage> {
  late SearchMovieController controller;
  late SearchMovieUseCase _useCase;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    _useCase = widget.useCase ?? GetIt.instance.get<SearchMovieUseCase>();
    controller = SearchMovieController(_useCase);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                height: 150,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BackButtonWidget(),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: TextField(
                          controller: textEditingController,
                          onSubmitted: (x) {
                            if (textEditingController.text.isNotEmpty) {
                              controller
                                  .searchMovies(textEditingController.text);
                            }
                          },
                          decoration: InputDecoration(
                            label: const Text('Pesquise filmes'),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                textEditingController.clear();
                              },
                              child: const Icon(Icons.close),
                            ),
                            prefixIcon: GestureDetector(
                                onTap: () {
                                  if (textEditingController.text.isNotEmpty) {
                                    controller.searchMovies(
                                        textEditingController.text);
                                  }
                                },
                                child: const Icon(Icons.search)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(26.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<List<MovieEntity>>(
                  initialData: [],
                  stream: controller.listMovies,
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              return CardPosterWidget(
                                movieId: snapshot.data![index].id,
                                title: snapshot.data![index].title,
                                pathImage: snapshot.data![index].posterPath,
                                genreIds: snapshot.data![index].genreIds,
                              );
                            })
                        : CircularProgressIndicator();
                  }),
            ),
          ],
        ));
  }
}
