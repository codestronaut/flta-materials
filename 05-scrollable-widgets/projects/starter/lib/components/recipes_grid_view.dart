import 'package:flutter/material.dart';

import '../models/simple_recipe.dart';
import 'components.dart';

class RecipesGridView extends StatelessWidget {
  const RecipesGridView({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  final List<SimpleRecipe> recipes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: recipes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        final simpleRecipe = recipes[index];
        return RecipeThumbnail(recipe: simpleRecipe);
      },
    );
  }
}
