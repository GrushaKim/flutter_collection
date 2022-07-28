
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_collection/utils/datetime_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quote.g.dart';

@JsonSerializable()
@DateTimeConverter()
class QuoteModel {
  final int id;
  final String author;
  final String quote;
  final DateTime createdAt;

  QuoteModel({
    required this.id,
    required this.author,
    required this.quote,
    required this.createdAt
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) => 
    _$QuoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteModelToJson(this);

}