import '../ship_to_screen/widgets/shipto_item_widget.dart';
import 'bloc/ship_to_bloc.dart';
import 'models/ship_to_model.dart';
import 'models/shipto_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shoppy/core/app_export.dart';
import 'package:shoppy/widgets/app_bar/appbar_leading_image.dart';
import 'package:shoppy/widgets/app_bar/appbar_subtitle.dart';
import 'package:shoppy/widgets/app_bar/appbar_trailing_image.dart';
import 'package:shoppy/widgets/app_bar/custom_app_bar.dart';
import 'package:shoppy/widgets/custom_elevated_button.dart';

class ShipToScreen extends StatelessWidget {
  const ShipToScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ShipToBloc>(
        create: (context) =>
            ShipToBloc(ShipToState(shipToModelObj: ShipToModel()))
              ..add(ShipToInitialEvent()),
        child: ShipToScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 23.v),
                child: Column(
                    children: [SizedBox(height: 4.v), _buildShipTo(context)])),
            bottomNavigationBar: _buildNext(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftBlueGray300,
            margin: EdgeInsets.only(left: 16.h, top: 13.v, bottom: 14.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "lbl_ship_to".tr, margin: EdgeInsets.only(left: 12.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgPlusIcon,
              margin: EdgeInsets.fromLTRB(16.h, 13.v, 16.h, 14.v))
        ]);
  }

  /// Section Widget
  Widget _buildShipTo(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: BlocSelector<ShipToBloc, ShipToState, ShipToModel?>(
                selector: (state) => state.shipToModelObj,
                builder: (context, shipToModelObj) {
                  return ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 22.v);
                      },
                      itemCount: shipToModelObj?.shiptoItemList.length ?? 0,
                      itemBuilder: (context, index) {
                        ShiptoItemModel model =
                            shipToModelObj?.shiptoItemList[index] ??
                                ShiptoItemModel();
                        return ShiptoItemWidget(model);
                      });
                })));
  }

  /// Section Widget
  Widget _buildNext(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_next".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v),
        onPressed: () {
          onTapNext(context);
        });
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the paymentMethodScreen when the action is triggered.
  onTapNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.paymentMethodScreen,
    );
  }
}
