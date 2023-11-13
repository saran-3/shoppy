// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'fifty_item_model.dart';

/// This class defines the variables used in the [choose_credit_or_debit_card_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ChooseCreditOrDebitCardModel extends Equatable {
  ChooseCreditOrDebitCardModel({this.fiftyItemList = const []}) {}

  List<FiftyItemModel> fiftyItemList;

  ChooseCreditOrDebitCardModel copyWith({List<FiftyItemModel>? fiftyItemList}) {
    return ChooseCreditOrDebitCardModel(
      fiftyItemList: fiftyItemList ?? this.fiftyItemList,
    );
  }

  @override
  List<Object?> get props => [fiftyItemList];
}
