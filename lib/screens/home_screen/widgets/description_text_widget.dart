import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/provider/quote_provider.dart';
import 'package:weather_app/models/home_screen_ui_model.dart';
import 'package:weather_app/models/theme/text_theme_model.dart';

class DescriptionWidget extends StatelessWidget {
   const DescriptionWidget({super.key, required this.homeScreenUIModel});
  final HomeScreenUIModel homeScreenUIModel;
  @override
  Widget build(BuildContext context) {
    return Consumer<QuoteProvider>(
      builder: (context, quoteProvider, _) {
        final quoteDataModel = quoteProvider.quoteDataModel;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quote',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: homeScreenUIModel.quoteColor),
            ),
            Text(
              quoteDataModel!.quote,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: homeScreenUIModel.quoteColor),
            ),
            const SizedBox(height: 5),
            Text('~ ${quoteDataModel.author}',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: homeScreenUIModel.quoteColor,fontStyle: FontStyle.italic)),
          ],
        );
      },
    );
  }
}
