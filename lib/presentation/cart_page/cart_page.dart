import '../cart_page/widgets/cart_item_widget.dart';
import 'bloc/cart_bloc.dart';
import 'models/cart_item_model.dart';
import 'models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:shoppy/core/app_export.dart';
import 'package:shoppy/widgets/app_bar/appbar_title.dart';
import 'package:shoppy/widgets/app_bar/appbar_trailing_image.dart';
import 'package:shoppy/widgets/app_bar/custom_app_bar.dart';
import 'package:shoppy/widgets/custom_elevated_button.dart';
import 'package:shoppy/widgets/custom_text_form_field.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<CartBloc>(
        create: (context) => CartBloc(CartState(cartModelObj: CartModel()))
          ..add(CartInitialEvent()),
        child: CartPage());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 7.v),
                child: Column(children: [
                  _buildCart(context),
                  SizedBox(height: 52.v),
                  _buildCuponCode(context),
                  SizedBox(height: 16.v),
                  _buildTotalPriceDetails(context),
                  SizedBox(height: 16.v),
                  CustomElevatedButton(
                      text: "lbl_check_out".tr,
                      onPressed: () {
                        onTapCheckOut(context);
                      }),
                  SizedBox(height: 8.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: AppbarTitle(
            text: "lbl_your_cart".tr, margin: EdgeInsets.only(left: 16.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNotificationIcon,
              margin: EdgeInsets.fromLTRB(13.h, 15.v, 13.h, 16.v),
              onTap: () {
                onTapNotificationIcon(context);
              })
        ]);
  }

  /// Section Widget
  Widget _buildCart(BuildContext context) {
    return BlocSelector<CartBloc, CartState, CartModel?>(
        selector: (state) => state.cartModelObj,
        builder: (context, cartModelObj) {
          return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 16.v);
              },
              itemCount: cartModelObj?.cartItemList.length ?? 0,
              itemBuilder: (context, index) {
                CartItemModel model =
                    cartModelObj?.cartItemList[index] ?? CartItemModel();
                return CartItemWidget(model);
              });
        });
  }

  /// Section Widget
  Widget _buildCuponCode(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: BlocSelector<CartBloc, CartState, TextEditingController?>(
              selector: (state) => state.cuponCodeController,
              builder: (context, cuponCodeController) {
                return CustomTextFormField(
                    controller: cuponCodeController,
                    hintText: "msg_enter_cupon_code".tr,
                    textInputAction: TextInputAction.done,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.h, vertical: 19.v));
              })),
      CustomElevatedButton(
          width: 87.h,
          text: "lbl_apply".tr,
          buttonStyle: CustomButtonStyles.fillPrimary,
          buttonTextStyle: CustomTextStyles.labelLargeOnPrimaryContainer)
    ]);
  }

  /// Section Widget
  Widget _buildTotalPriceDetails(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15.h),
        decoration: AppDecoration.outlineBlue50
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildShoppingPrice(context,
                  shipping: "lbl_items_3".tr, price: "lbl_598_86".tr),
              SizedBox(height: 16.v),
              _buildShoppingPrice(context,
                  shipping: "lbl_shipping".tr, price: "lbl_40_00".tr),
              SizedBox(height: 14.v),
              _buildShoppingPrice(context,
                  shipping: "lbl_import_charges".tr, price: "lbl_128_00".tr),
              SizedBox(height: 12.v),
              Divider(),
              SizedBox(height: 10.v),
              _buildShoppingPrice(context,
                  shipping: "lbl_total_price".tr, price: "lbl_766_86".tr)
            ]));
  }

  /// Common widget
  Widget _buildShoppingPrice(
    BuildContext context, {
    required String shipping,
    required String price,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(shipping,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: appTheme.blueGray300))),
      Text(price,
          style: CustomTextStyles.bodySmallOnPrimary
              .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1)))
    ]);
  }

  /// Navigates to the notificationScreen when the action is triggered.
  onTapNotificationIcon(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.notificationScreen,
    );
  }

  /// Navigates to the shipToScreen when the action is triggered.
  onTapCheckOut(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.shipToScreen,
    );
  }
}
