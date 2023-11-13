// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'address_item_model.dart';

/// This class defines the variables used in the [address_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddressModel extends Equatable {
  AddressModel({this.addressItemList = const []}) {}

  List<AddressItemModel> addressItemList;

  AddressModel copyWith({List<AddressItemModel>? addressItemList}) {
    return AddressModel(
      addressItemList: addressItemList ?? this.addressItemList,
    );
  }

  @override
  List<Object?> get props => [addressItemList];
}
