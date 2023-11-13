import '../models/manworkequipment_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shoppy/core/app_export.dart';
import 'package:shoppy/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ManworkequipmentItemWidget extends StatelessWidget {
  ManworkequipmentItemWidget(
    this.manworkequipmentItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ManworkequipmentItemModel manworkequipmentItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(
          height: 70.adaptSize,
          width: 70.adaptSize,
          padding: EdgeInsets.all(23.h),
          child: CustomImageView(
            imagePath: manworkequipmentItemModelObj?.manWorkEquipment,
          ),
        ),
        SizedBox(height: 8.v),
        Text(
          manworkequipmentItemModelObj.officeBag!,
          style: CustomTextStyles.labelMediumBluegray300,
        ),
      ],
    );
  }
}
