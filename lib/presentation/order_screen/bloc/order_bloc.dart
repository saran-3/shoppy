import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/order_item_model.dart';
import 'package:shoppy/presentation/order_screen/models/order_model.dart';
part 'order_event.dart';
part 'order_state.dart';

/// A bloc that manages the state of a Order according to the event that is dispatched to it.
class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(OrderState initialState) : super(initialState) {
    on<OrderInitialEvent>(_onInitialize);
  }

  _onInitialize(
    OrderInitialEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(state.copyWith(
        orderModelObj:
            state.orderModelObj?.copyWith(orderItemList: fillOrderItemList())));
  }

  List<OrderItemModel> fillOrderItemList() {
    return [
      OrderItemModel(
          price: "SDG1345KJD",
          month: "Order at E-com : August 1, 2017",
          orderStatus: "Order Status",
          shipping: "Shipping",
          items: "Items",
          purchasedCount: "1 Items purchased",
          price1: "Price",
          price2: "299,43"),
      OrderItemModel(
          price: "SDG1345KJD",
          month: "Order at E-com : August 1, 2017",
          orderStatus: "Order Status",
          shipping: "Shipping",
          items: "Items",
          purchasedCount: "1 Items purchased",
          price1: "Price",
          price2: "299,43"),
      OrderItemModel(
          price: "SDG1345KJD",
          month: "Order at E-com : August 1, 2017",
          orderStatus: "Order Status",
          shipping: "Shipping",
          items: "Items",
          purchasedCount: "1 Items purchased",
          price1: "Price",
          price2: "299,43")
    ];
  }
}
