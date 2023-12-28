import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:flutter/cupertino.dart';

enum OrderBy {
  all(AppStrings.orderByAll),
  highest(AppStrings.orderByHigh),
  lowest(AppStrings.orderByLow),
  recently(AppStrings.orderByRecent);

  const OrderBy(String name);
}