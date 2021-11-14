import 'package:flutter/material.dart';
import 'package:the_movie_database_clean_arch/core/utils/const.dart';

import 'package:the_movie_database_clean_arch/features/get_movies/domain/usecases/get_movie_use_case.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/widgets/tab_movie_widget.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/widgets/custom_app_bar_widget.dart';

class HomePage extends StatefulWidget {
  final GetMovieUseCase? useCase;

  const HomePage({Key? key, this.useCase}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 4);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        tabController: tabController,
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          TabMovieWidget(
            genredId: GenresIds.action,
          ),
          TabMovieWidget(
            genredId: GenresIds.adventure,
          ),
          TabMovieWidget(
            genredId: GenresIds.fantasy,
          ),
          TabMovieWidget(
            genredId: GenresIds.comedy,
          ),
        ],
      ),
    );
  }
}
