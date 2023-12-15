import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/provider/quote_provider.dart';
import '../models/quote_data_model.dart';
class QuoteService {
  //base URL for api calling
  static const kBASEURL = 'https://api.api-ninjas.com';
  static const apiKey = 'liMurA+yVFzctZ4g0Ug8DQ==qj1Gd9MLgX9I4IzZ';
  static const List<String> quoteCategories = [
    'beauty',
    'architecture',
    'courage',
    'environmental',
    'friendship',
    'happiness',
    'health',
    'inspirational',
    'life',
    'morning',
    'success',
    'love'
  ];

  static String getRandomCategory(){
    Random random = Random();
    int randomIndex = random.nextInt(quoteCategories.length);
    return quoteCategories[randomIndex];
  }

  ///[getWeather] fetches the weather in converted WeatherModel format
  static Future<void> getQuote(BuildContext context) async {
    QuoteDataModel quoteDataModel;
    String category = getRandomCategory();

    Map<String, String> apiHeader = {'X-Api-Key': apiKey};

    final response = await http.get(Uri.parse('$kBASEURL/v1/quotes?category=$category'), headers: apiHeader);
    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
      quoteDataModel = QuoteDataModel.fromJson(json[0]);

      if (context.mounted) {
        context
            .read<QuoteProvider>()
            .updateQuoteProvider(quoteDataModel);
      }
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
