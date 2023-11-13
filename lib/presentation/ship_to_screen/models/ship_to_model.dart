// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'shipto_item_model.dart';

/// This class defines the variables used in the [ship_to_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ShipToModel extends Equatable {
  ShipToModel({this.shiptoItemList = const []}) {}

  List<ShiptoItemModel> shiptoItemList;

  ShipToModel copyWith({List<ShiptoItemModel>? shiptoItemList}) {
    return ShipToModel(
      shiptoItemList: shiptoItemList ?? this.shiptoItemList,
    );
  }

  @override
  List<Object?> get props => [shiptoItemList];
}
