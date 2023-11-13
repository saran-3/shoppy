import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/cart_item_model.dart';
import 'package:shoppy/presentation/cart_page/models/cart_model.dart';
part 'cart_event.dart';
part 'cart_state.dart';

/// A bloc that manages the state of a Cart according to the event that is dispatched to it.
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(CartState initialState) : super(initialState) {
    on<CartInitialEvent>(_onInitialize);
  }

  List<CartItemModel> fillCartItemList() {
    return [
      CartItemModel(
          nikeAirZoomPegasus: "Nike Air Zoom Pegasus 36 Miami",
          price: "299,43",
          one: "1"),
      CartItemModel(
          nikeAirZoomPegasus: "Nike Air Zoom Pegasus 36 Miami",
          price: "299,43",
          one: "1")
    ];
  }

  _onInitialize(
    CartInitialEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(cuponCodeController: TextEditingController()));
    emit(state.copyWith(
        cartModelObj:
            state.cartModelObj?.copyWith(cartItemList: fillCartItemList())));
  }
}
