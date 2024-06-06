import 'package:eco_market/common/models/product_category_model.dart';
import 'package:eco_market/common/utils/constants.dart';
import 'package:flutter/material.dart';

class TypeProductCard extends StatelessWidget {
  final ProductCategoryModel productCategoryModel;

  const TypeProductCard({
    super.key,
    required this.productCategoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(12),
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(productCategoryModel.image??""),
        ),
      ),
      child: Text(
        productCategoryModel.name??"name",
        style: AppTexts.s20w,
      ),
    );
  }
}
