

class QuoteDataModel {

  QuoteDataModel({required this.quote, required this.author});

  final String quote;
  final String author;

  factory QuoteDataModel.fromJson(Map<String, dynamic> json){
    return QuoteDataModel(quote: json['quote'], author: json['author']);
  }

}