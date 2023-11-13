import '../choose_credit_or_debit_card_screen/widgets/fifty_item_widget.dart';
import 'bloc/choose_credit_or_debit_card_bloc.dart';
import 'models/choose_credit_or_debit_card_model.dart';
import 'models/fifty_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shoppy/core/app_export.dart';
import 'package:shoppy/widgets/app_bar/appbar_leading_image.dart';
import 'package:shoppy/widgets/app_bar/appbar_subtitle.dart';
import 'package:shoppy/widgets/app_bar/appbar_trailing_image.dart';
import 'package:shoppy/widgets/app_bar/custom_app_bar.dart';
import 'package:shoppy/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ChooseCreditOrDebitCardScreen extends StatelessWidget {
  const ChooseCreditOrDebitCardScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ChooseCreditOrDebitCardBloc>(
        create: (context) => ChooseCreditOrDebitCardBloc(
            ChooseCreditOrDebitCardState(
                chooseCreditOrDebitCardModelObj:
                    ChooseCreditOrDebitCardModel()))
          ..add(ChooseCreditOrDebitCardInitialEvent()),
        child: ChooseCreditOrDebitCardScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 27.v),
                child: Column(children: [
                  _buildFifty(context),
                  SizedBox(height: 16.v),
                  BlocBuilder<ChooseCreditOrDebitCardBloc,
                      ChooseCreditOrDebitCardState>(builder: (context, state) {
                    return SizedBox(
                        height: 8.v,
                        child: AnimatedSmoothIndicator(
                            activeIndex: state.sliderIndex,
                            count: state.chooseCreditOrDebitCardModelObj
                                    ?.fiftyItemList.length ??
                                0,
                            axisDirection: Axis.horizontal,
                            effect: ScrollingDotsEffect(
                                spacing: 8,
                                activeDotColor:
                                    theme.colorScheme.primary.withOpacity(1),
                                dotColor: appTheme.blue50,
                                dotHeight: 8.v,
                                dotWidth: 8.h)));
                  }),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildPay76686(context)));
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
            text: "lbl_choose_card".tr, margin: EdgeInsets.only(left: 12.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgPlusIcon,
              margin: EdgeInsets.fromLTRB(16.h, 15.v, 16.h, 16.v))
        ]);
  }

  /// Section Widget
  Widget _buildFifty(BuildContext context) {
    return BlocBuilder<ChooseCreditOrDebitCardBloc,
        ChooseCreditOrDebitCardState>(builder: (context, state) {
      return CarouselSlider.builder(
          options: CarouselOptions(
              height: 190.v,
              initialPage: 0,
              autoPlay: true,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                state.sliderIndex = index;
              }),
          itemCount:
              state.chooseCreditOrDebitCardModelObj?.fiftyItemList.length ?? 0,
          itemBuilder: (context, index, realIndex) {
            FiftyItemModel model =
                state.chooseCreditOrDebitCardModelObj?.fiftyItemList[index] ??
                    FiftyItemModel();
            return FiftyItemWidget(model);
          });
    });
  }

  /// Section Widget
  Widget _buildPay76686(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_pay_766_86".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v),
        onPressed: () {
          onTapPay76686(context);
        });
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the successScreen when the action is triggered.
  onTapPay76686(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.successScreen,
    );
  }
}
