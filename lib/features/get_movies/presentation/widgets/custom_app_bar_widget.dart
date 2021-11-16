import 'package:flutter/material.dart';
import 'package:the_movie_database_clean_arch/core/utils/const.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/controllers/app_bar_controller.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/presentation/pages/search_page.dart';

import 'custom_button_widget.dart';

class CustomAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  TabController tabController;
  CustomAppBarWidget({Key? key, required this.tabController}) : super(key: key);

  @override
  _CustomAppBarWidgetState createState() => _CustomAppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(180.0);
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  late AppBarController appBarController;

  @override
  void initState() {
    appBarController = AppBarController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      title: const Text(
        'Filmes',
        style: TextStyle(color: Colors.black),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: TextField(
                readOnly: true,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchMoviePage()));
                },
                decoration: InputDecoration(
                  label: const Text('Pesquise filmes'),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26.0),
                  ),
                ),
              ),
            ),
            StreamBuilder<int>(
                initialData: GenresIds.action,
                stream: appBarController.genreSelected,
                builder: (context, snapshot) {
                  return TabBar(
                    controller: widget.tabController,
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    labelPadding: EdgeInsets.symmetric(horizontal: 12),
                    tabs: [
                      Tab(
                        child: CustomButtomWidget(
                          isSelected: snapshot.data == 0,
                          title: 'Ação',
                          onTap: () {
                            appBarController.changeGenreSelected(
                                0, widget.tabController);
                          },
                        ),
                      ),
                      Tab(
                        child: CustomButtomWidget(
                          isSelected: snapshot.data == 1,
                          title: 'Aventura',
                          onTap: () {
                            appBarController.changeGenreSelected(
                                1, widget.tabController);
                          },
                        ),
                      ),
                      Tab(
                        child: CustomButtomWidget(
                          isSelected: snapshot.data == 2,
                          title: 'Fantasia',
                          onTap: () {
                            appBarController.changeGenreSelected(
                                2, widget.tabController);
                          },
                        ),
                      ),
                      Tab(
                        child: CustomButtomWidget(
                          isSelected: snapshot.data == 3,
                          title: 'Comédia',
                          onTap: () {
                            appBarController.changeGenreSelected(
                                3, widget.tabController);
                          },
                        ),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
