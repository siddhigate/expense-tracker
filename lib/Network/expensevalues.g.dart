// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expensevalues.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseValue _$ExpenseValueFromJson(Map<String, dynamic> json) {
  return ExpenseValue(
    (json['id'] as num)?.toDouble(),
    json['description'] as String,
    json['amount'] as String,
    json['v'] as String,
  );
}

Map<String, dynamic> _$ExpenseValueToJson(ExpenseValue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'amount': instance.amount,
      'v': instance.v,
    };
