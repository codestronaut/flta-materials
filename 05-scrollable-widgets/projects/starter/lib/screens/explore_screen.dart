// import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';
import '../models/explore_data.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  // late ScrollController scrollController;
  final mockService = MockFooderlichService();

  // @override
  // void initState() {
  //   super.initState();
  //   scrollController = ScrollController();
  //   scrollController.addListener(() {
  //     final position = scrollController.position.pixels;
  //     final maxPosition = scrollController.position.maxScrollExtent;
  //     if (position < maxPosition) {
  //       log('i am at the top!');
  //     } else {
  //       log('i am at the bottom!');
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   scrollController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final recipes = snapshot.data?.todayRecipes ?? [];
          final posts = snapshot.data?.friendPosts ?? [];
          return ListView(
            // controller: scrollController,
            children: [
              TodayRecipeListView(recipes: recipes),
              const SizedBox(height: 16.0),
              FriendPostListView(friendPosts: posts),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
