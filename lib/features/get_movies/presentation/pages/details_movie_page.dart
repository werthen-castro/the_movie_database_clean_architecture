import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:the_movie_database_clean_arch/core/style/custom_colors.dart';
import 'package:the_movie_database_clean_arch/core/style/custom_font_styles.dart';
import 'package:the_movie_database_clean_arch/core/utils/const.dart';
import 'package:the_movie_database_clean_arch/core/utils/formats.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/details_movie_entity.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/usecases/get_movie_for_id_use_case.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/controllers/details_movie_controller.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/widgets/back_button_widget.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/widgets/points_movie_widget.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/widgets/tag_genre_movie_widget.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/widgets/tag_info_movie_widget.dart';

class DetailsMoviePage extends StatefulWidget {
  final int id;
  final GetMovieForIdUseCase? useCase;
  const DetailsMoviePage({Key? key, required this.id, this.useCase})
      : super(key: key);

  @override
  _DetailsMoviePageState createState() => _DetailsMoviePageState();
}

class _DetailsMoviePageState extends State<DetailsMoviePage> {
  late GetMovieForIdUseCase _useCase;
  late DetailsMovieController controller;

  @override
  void initState() {
    _useCase = widget.useCase ?? GetIt.instance.get<GetMovieForIdUseCase>();
    controller = DetailsMovieController(_useCase, widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: BackButtonWidget(),
              ),
              StreamBuilder<DetailsMovieEntity>(
                  stream: controller.movie,
                  builder: (context, snapshot) {
                    return snapshot.hasData && !snapshot.hasError
                        ? Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 75, right: 75, top: 30, bottom: 32),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(26.0),
                                    child: Image.network(UrlsBase.urlBaseImage +
                                        snapshot.data!.posterPath),
                                  )),
                              PointsMovieWidget(
                                voteAverage: snapshot.data!.voteAverage,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, bottom: 10),
                                child: Text(snapshot.data!.title.toUpperCase(),
                                    style: CustomFontStyle.fontTitleCard
                                        .copyWith(
                                            color: CustomColors.grayDarkColor),
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      const TextSpan(
                                          text: 'Título original: ',
                                          style: TextStyle(fontSize: 13)),
                                      TextSpan(
                                          text: snapshot.data!.originalTitle,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TagInfoMovieWidget(
                                    description: 'Ano',
                                    value: Formats.formaterYaer(
                                        snapshot.data!.releaseDate),
                                  ),
                                  TagInfoMovieWidget(
                                    description: 'Duração',
                                    value: Formats.formaterDuration(
                                        snapshot.data!.runtime),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 60),
                                child: Wrap(
                                    children: List.generate(
                                        snapshot.data!.genres.length, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: TagGenreMovieWidget(
                                      text: Genres.mapGenres[snapshot
                                              .data!.genres[index].id] ??
                                          '',
                                    ),
                                  );
                                })),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Descrição',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: CustomColors.grayDarkColor),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 50),
                                      child: Text(snapshot.data!.overview,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: CustomColors.grayDarkColor,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    TagInfoMovieWidget(
                                      tagWidth:
                                          MediaQuery.of(context).size.width,
                                      description: 'ORÇAMENTO',
                                      value: 'R\$ ' +
                                          Formats.formaterMoney(
                                              snapshot.data!.budget),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 30),
                                      child: TagInfoMovieWidget(
                                        tagWidth:
                                            MediaQuery.of(context).size.width,
                                        description: 'Produtoras',
                                        value: List.generate(
                                                snapshot
                                                    .data!
                                                    .productionCompanies
                                                    .length, (index) {
                                          return snapshot.data!
                                              .productionCompanies[index].name;
                                        })
                                            .toString()
                                            .replaceAll('[', '')
                                            .replaceAll(']', ''),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 2 -
                                          80,
                                ),
                                snapshot.hasError
                                    ? Center(
                                        child: Text(
                                            'Ocorreu um erro por favor tente novamente!'),
                                      )
                                    : CircularProgressIndicator(),
                              ],
                            ),
                          );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
