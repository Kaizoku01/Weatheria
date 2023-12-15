
import 'package:flutter/material.dart';
import 'package:weather_app/models/quote_data_model.dart';

class QuoteProvider with ChangeNotifier{
  QuoteDataModel? quoteDataModel;

  void updateQuoteProvider(QuoteDataModel quoteModel){
    quoteDataModel = quoteModel;
    notifyListeners();
  }
}