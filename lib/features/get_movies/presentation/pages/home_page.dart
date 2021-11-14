import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:the_movie_database_clean_arch/features/get_movies/domain/usecases/get_movie_use_case.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/controllers/home_controller.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/pages/tabs/action_tab.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/widgets/custom_app_bar_widget.dart';

class HomePage extends StatefulWidget {
  final GetMovieUseCase? useCase;

  const HomePage({Key? key, this.useCase}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late HomePageController _homePageController;

  late TabController tabController;

  late GetMovieUseCase _useCase;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 4);
    _useCase = widget.useCase ?? GetIt.instance.get<GetMovieUseCase>();
    _homePageController = HomePageController(_useCase);
  }

  Future<void> _incrementCounter() async {
    var res = await _homePageController.getListMovies();
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
          ActionTab(
            homePageController: _homePageController,
          ),
          Container(
            color: Colors.black,
            width: 500,
            height: 500,
          ),
          Container(
            color: Colors.red,
            width: 500,
            height: 500,
          ),
          Container(
            color: Colors.blue,
            width: 500,
            height: 500,
          )
        ],
      ),
    );
  }
}
