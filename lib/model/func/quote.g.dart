// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteModel _$QuoteModelFromJson(Map<String, dynamic> json) => QuoteModel(
      id: json['id'] as int,
      author: json['author'] as String,
      quote: json['quote'] as String,
      createdAt:
          const DateTimeConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$QuoteModelToJson(QuoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'quote': instance.quote,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
    };
