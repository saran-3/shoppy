import '../address_screen/widgets/address_item_widget.dart';
import 'bloc/address_bloc.dart';
import 'models/address_item_model.dart';
import 'models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:shoppy/core/app_export.dart';
import 'package:shoppy/widgets/app_bar/appbar_leading_image.dart';
import 'package:shoppy/widgets/app_bar/appbar_subtitle.dart';
import 'package:shoppy/widgets/app_bar/custom_app_bar.dart';
import 'package:shoppy/widgets/custom_elevated_button.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<AddressBloc>(
        create: (context) =>
            AddressBloc(AddressState(addressModelObj: AddressModel()))
              ..add(AddressInitialEvent()),
        child: AddressScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 10.v),
                child: Column(children: [
                  SizedBox(height: 17.v),
                  _buildAddress(context)
                ])),
            bottomNavigationBar: _buildAddAddress(context)));
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
            text: "lbl_address".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildAddress(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: BlocSelector<AddressBloc, AddressState, AddressModel?>(
                selector: (state) => state.addressModelObj,
                builder: (context, addressModelObj) {
                  return ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 18.v);
                      },
                      itemCount: addressModelObj?.addressItemList.length ?? 0,
                      itemBuilder: (context, index) {
                        AddressItemModel model =
                            addressModelObj?.addressItemList[index] ??
                                AddressItemModel();
                        return AddressItemWidget(model);
                      });
                })));
  }

  /// Section Widget
  Widget _buildAddAddress(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_add_address".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
