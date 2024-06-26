import 'package:eco_market/common/models/selected_products_model.dart';
import 'package:eco_market/common/utils/constants.dart';
import 'package:flutter/material.dart';

class SelectedProductCard extends StatelessWidget {
  const SelectedProductCard({
    super.key,
    required this.selectedProductsModel,
  });

  final SelectedProductsModel selectedProductsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.lightGrey,
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,
            ),
            height: 86,
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                selectedProductsModel.productModel.image ?? "",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedProductsModel.productModel.title ?? "",
                  style: AppTexts.s14b,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  'Цена ${selectedProductsModel.productModel.price ?? '-'}c за шт',
                  style: AppTexts.s12grey,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${selectedProductsModel.quantity * double.parse(selectedProductsModel.productModel.price!)}с',
                      style: AppTexts.s20g,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      '${selectedProductsModel.quantity} шт',
                      style: AppTexts.s18b,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
