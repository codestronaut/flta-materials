import 'package:flutter/material.dart';

import '../models/explore_recipe.dart';
import 'components.dart';

class TodayRecipeListView extends StatelessWidget {
  const TodayRecipeListView({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  final List<ExploreRecipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Recipes of The Day 🍳',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Container(
          height: 400.0,
          color: Colors.transparent,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            scrollDirection: Axis.horizontal,
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return buildCard(recipe);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 16.0);
            },
          ),
        ),
      ],
    );
  }

  Widget buildCard(ExploreRecipe recipe) {
    switch (recipe.cardType) {
      case RecipeCardType.card1:
        return Card1(recipe: recipe);
      case RecipeCardType.card2:
        return Card2(recipe: recipe);
      case RecipeCardType.card3:
        return Card3(recipe: recipe);
      default:
        throw Exception('This card doesn\'t exist yet');
    }
  }
}
