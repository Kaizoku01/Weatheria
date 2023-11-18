import 'package:flutter/material.dart';
import 'package:weather_app/models/theme/text_theme_model.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Random Text',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorSchemeModel.textColor2),
        ),
        Text(
          '''Improve him believe opinion offered met and end cheered forbade. Friendly as stronger speedily by recurred. Son interest wandered sir addition end say. Manners beloved affixed picture men ask.''',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorSchemeModel.textColor2),
        ),
      ],
    );
  }
}
