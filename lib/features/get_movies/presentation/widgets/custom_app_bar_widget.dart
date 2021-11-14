import 'package:flutter/material.dart';

import 'custom_button_widget.dart';

class CustomAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  TabController tabController;
  CustomAppBarWidget({Key? key, required this.tabController}) : super(key: key);

  @override
  _CustomAppBarWidgetState createState() => _CustomAppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(200.0);
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
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
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                decoration: InputDecoration(
                  label: const Text('Pesquise filmes'),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26.0),
                  ),
                ),
              ),
            ),
            TabBar(
              controller: widget.tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelPadding: EdgeInsets.all(12),
              tabs: [
                Tab(
                  icon: CustomButtomWidget(
                    isSelected: true,
                    title: 'Ação',
                    onTap: () {},
                  ),
                ),
                Tab(
                  icon: CustomButtomWidget(
                    isSelected: true,
                    title: 'Aventura',
                    onTap: () {},
                  ),
                ),
                Tab(
                  icon: CustomButtomWidget(
                    isSelected: true,
                    title: 'Fantasia',
                    onTap: () {},
                  ),
                ),
                Tab(
                  icon: CustomButtomWidget(
                    isSelected: true,
                    title: 'Comédia',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
