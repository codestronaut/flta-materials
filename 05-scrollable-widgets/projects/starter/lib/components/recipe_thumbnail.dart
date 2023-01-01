import 'package:flutter/material.dart';

import '../models/simple_recipe.dart';

class RecipeThumbnail extends StatelessWidget {
  const RecipeThumbnail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final SimpleRecipe recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                recipe.dishImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            recipe.title,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            recipe.duration,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
