import 'bloc/notification_offer_bloc.dart';
import 'models/notification_offer_model.dart';
import 'package:flutter/material.dart';
import 'package:shoppy/core/app_export.dart';
import 'package:shoppy/widgets/app_bar/appbar_leading_image.dart';
import 'package:shoppy/widgets/app_bar/appbar_subtitle.dart';
import 'package:shoppy/widgets/app_bar/custom_app_bar.dart';

class NotificationOfferScreen extends StatelessWidget {
  const NotificationOfferScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<NotificationOfferBloc>(
        create: (context) => NotificationOfferBloc(NotificationOfferState(
            notificationOfferModelObj: NotificationOfferModel()))
          ..add(NotificationOfferInitialEvent()),
        child: NotificationOfferScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<NotificationOfferBloc, NotificationOfferState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 12.v),
                  child: Column(children: [
                    _buildOfferItem(context,
                        offer: "lbl_the_best_title".tr,
                        description: "msg_culpa_cillum_consectetur".tr,
                        time: "msg_april_30_2014_1_01".tr),
                    _buildOfferItem(context,
                        offer: "msg_summer_offer_98".tr,
                        description: "msg_culpa_cillum_consectetur".tr,
                        time: "msg_april_30_2014_1_01".tr),
                    SizedBox(height: 5.v),
                    _buildOfferItem(context,
                        offer: "msg_special_offer_25".tr,
                        description: "msg_culpa_cillum_consectetur".tr,
                        time: "msg_april_30_2014_1_01".tr)
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftBlueGray300,
            margin: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 15.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "lbl_notification".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Common widget
  Widget _buildOfferItem(
    BuildContext context, {
    required String offer,
    required String description,
    required String time,
  }) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgOffer,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(bottom: 94.v)),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.only(left: 12.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(offer,
                                style: theme.textTheme.titleSmall!.copyWith(
                                    color: theme.colorScheme.onPrimary
                                        .withOpacity(1))),
                            SizedBox(height: 10.v),
                            SizedBox(
                                width: 305.h,
                                child: Text(description,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodySmall!.copyWith(
                                        color: appTheme.blueGray300,
                                        height: 1.80))),
                            SizedBox(height: 9.v),
                            Text(time,
                                style: CustomTextStyles.bodySmallOnPrimary10
                                    .copyWith(
                                        color: theme.colorScheme.onPrimary
                                            .withOpacity(1)))
                          ])))
            ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
