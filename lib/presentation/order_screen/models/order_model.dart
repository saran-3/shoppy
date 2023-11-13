// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'order_item_model.dart';

/// This class defines the variables used in the [order_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class OrderModel extends Equatable {
  OrderModel({this.orderItemList = const []}) {}

  List<OrderItemModel> orderItemList;

  OrderModel copyWith({List<OrderItemModel>? orderItemList}) {
    return OrderModel(
      orderItemList: orderItemList ?? this.orderItemList,
    );
  }

  @override
  List<Object?> get props => [orderItemList];
}
