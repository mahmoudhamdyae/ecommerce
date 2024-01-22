import 'package:ecommerce/presentation/resources/font_manager.dart';
import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/screens/orders/controller/order_controller.dart';
import 'package:ecommerce/presentation/widgets/dialogs/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class OrderFinishScreen extends StatefulWidget {
  const OrderFinishScreen({super.key});

  @override
  State<OrderFinishScreen> createState() => _OrderFinishScreenState();
}

class _OrderFinishScreenState extends State<OrderFinishScreen> {

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  PayType? _payType = PayType.pay;

  void _order() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      showLoading(context);
      Get.find<OrderController>().finishOrder(
          _firstNameController.text,
          _lastNameController.text,
          _phoneController.text,
          _addressController.text,
          _payType?.value ?? '1'
      ).then((_) {
        Get.back();
        Get.back();
        Get.back();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorManager.lightGrey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: ColorManager.white,
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: AppPadding.p50,
                  bottom: AppPadding.smallPadding,
                  right: AppPadding.smallPadding,
                ),
                child: Text(
                  AppStrings.cart.tr,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeightManager.medium,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppPadding.mediumPadding,
                  bottom: AppPadding.mediumPadding,
                  right: AppPadding.mediumPadding,
                  left: AppPadding.mediumPadding,
                ),
                child: Column(
                  children: [
                    Form(
                        key: formState,
                        child: Column(
                          children: [
                            // First Name
                            TextFormField(
                              controller: _firstNameController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              validator: (val) {
                                if (val.toString().isNotEmpty) {
                                  return null;
                                }
                                return AppStrings.firstNameError.tr;
                              },
                              decoration: InputDecoration(
                                hintText: AppStrings.firstNameHint.tr,
                                hintStyle: const TextStyle(
                                  color: ColorManager.grey,
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(AppSize.borderRadius),
                                  ),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: ColorManager.grey
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: AppSize.s16,),
                            // Last Name
                            TextFormField(
                              controller: _lastNameController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              validator: (val) {
                                if (val.toString().isNotEmpty) {
                                  return null;
                                }
                                return AppStrings.lastNameError.tr;
                              },
                              decoration: InputDecoration(
                                hintText: AppStrings.lastNameHint.tr,
                                hintStyle: const TextStyle(
                                  color: ColorManager.grey,
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(AppSize.borderRadius),
                                  ),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: ColorManager.grey
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: AppSize.s16,),
                            // Phone
                            TextFormField(
                              controller: _phoneController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              validator: (val) {
                                if (val.toString().isNotEmpty) {
                                  return null;
                                }
                                return AppStrings.mobileNumberInvalid.tr;
                              },
                              decoration: InputDecoration(
                                hintText: AppStrings.phoneNoHint.tr,
                                hintStyle: const TextStyle(
                                  color: ColorManager.grey,
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(AppSize.borderRadius),
                                  ),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: ColorManager.grey
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: AppSize.s16,),
                            // Address
                            TextFormField(
                              controller: _addressController,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.text,
                              validator: (val) {
                                if (val.toString().isNotEmpty) {
                                  return null;
                                }
                                return AppStrings.addressError.tr;
                              },
                              decoration: InputDecoration(
                                hintText: AppStrings.addressHint.tr,
                                hintStyle: const TextStyle(
                                  color: ColorManager.grey,
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(AppSize.borderRadius),
                                  ),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: ColorManager.grey
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: AppSize.s16,),
                          ],
                        ),
                    ),
                    ListTile(
                      title: Text(AppStrings.pay.tr),
                      leading: Radio<PayType>(
                        value: PayType.pay,
                        groupValue: _payType,
                        onChanged: (PayType? value) {
                          setState(() {
                            _payType = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(AppStrings.visa.tr),
                      leading: Radio<PayType>(
                        value: PayType.visa,
                        groupValue: _payType,
                        onChanged: (PayType? value) {
                          setState(() {
                            _payType = value;
                          });
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(AppSize.borderRadius)),
                                    )
                                ),
                                backgroundColor: MaterialStateProperty.all(ColorManager.primary),
                              ),
                              onPressed: () {
                                _order();
                              },
                              child: Text(
                                AppStrings.order.tr,
                                style: const TextStyle(
                                  color: ColorManager.white,
                                  fontSize: FontSize.s16,
                                ),
                              )
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum PayType {
  visa('2'),
  pay('1');

  final String value;
  const PayType(this.value);
}
