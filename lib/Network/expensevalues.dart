import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
// part 'expensevalues.g.dart';

part 'expensevalues.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()

class ExpenseValue {
  ExpenseValue(this.id,this.description, this.amount,this.v);
    double id;
  String description;
  String amount;
  String v;

  factory ExpenseValue.fromJson(Map<String, dynamic> json) => _$ExpenseValueFromJson(json);

  
  Map<String, dynamic> toJson() => _$ExpenseValueToJson(this);
}