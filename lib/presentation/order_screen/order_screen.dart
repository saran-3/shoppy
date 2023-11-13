import '../order_screen/widgets/order_item_widget.dart';
import 'bloc/order_bloc.dart';
import 'models/order_item_model.dart';
import 'models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:shoppy/core/app_export.dart';
import 'package:shoppy/widgets/app_bar/appbar_leading_image.dart';
import 'package:shoppy/widgets/app_bar/appbar_subtitle.dart';
import 'package:shoppy/widgets/app_bar/custom_app_bar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<OrderBloc>(
        create: (context) => OrderBloc(OrderState(orderModelObj: OrderModel()))
          ..add(OrderInitialEvent()),
        child: OrderScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Padding(
                padding: EdgeInsets.only(left: 15.h, top: 19.v, right: 15.h),
                child: BlocSelector<OrderBloc, OrderState, OrderModel?>(
                    selector: (state) => state.orderModelObj,
                    builder: (context, orderModelObj) {
                      return ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 10.v);
                          },
                          itemCount: orderModelObj?.orderItemList.length ?? 0,
                          itemBuilder: (context, index) {
                            OrderItemModel model =
                                orderModelObj?.orderItemList[index] ??
                                    OrderItemModel();
                            return OrderItemWidget(model);
                          });
                    }))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftBlueGray300,
            margin: EdgeInsets.only(left: 16.h, top: 15.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "lbl_order".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
