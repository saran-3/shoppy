import '../models/shipto_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shoppy/core/app_export.dart';

// ignore: must_be_immutable
class ShiptoItemWidget extends StatelessWidget {
  ShiptoItemWidget(
    this.shiptoItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ShiptoItemModel shiptoItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 23.h,
        vertical: 21.v,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            shiptoItemModelObj.priscekila!,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 19.v),
          Container(
            width: 264.h,
            margin: EdgeInsets.only(right: 30.h),
            child: Text(
              shiptoItemModelObj.address!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall!.copyWith(
                height: 1.80,
              ),
            ),
          ),
          SizedBox(height: 20.v),
          Text(
            shiptoItemModelObj.mobileNo!,
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 19.v),
          Row(
            children: [
              Text(
                shiptoItemModelObj.edit!,
                style: CustomTextStyles.titleSmallPrimary,
              ),
              Padding(
                padding: EdgeInsets.only(left: 32.h),
                child: Text(
                  shiptoItemModelObj.delete!,
                  style: CustomTextStyles.titleSmallPink300,
                ),
              ),
            ],
          ),
          SizedBox(height: 3.v),
        ],
      ),
    );
  }
}
