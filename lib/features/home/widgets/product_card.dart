import 'dart:async';
import 'package:eco_market/common/models/product_model.dart';
import 'package:eco_market/common/models/selected_products_model.dart';
import 'package:eco_market/common/utils/constants.dart';
import 'package:eco_market/features/basket/logic/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int counter = 1;
  int counter2 = 1;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter <= 1) {
      } else {
        counter--;
      }
    });
  }

  bool _showIcon = false;

  Timer? _timer;

  void _onButtonPressed() {
    setState(() {
      _showIcon = true;
    });

    // Запускаем таймер, чтобы иконка постепенно исчезала
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: 500), () {
      setState(() {
        _showIcon = false;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.lightGrey,
      ),
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.white,
            ),
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.productModel.image??"",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            widget.productModel.title??"",
            style: AppTexts.s14b,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          SizedBox(height: 18),
          Text(
            widget.productModel.price??"-",
            style: AppTexts.s20g,
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  decrementCounter();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: AppColors.green, shape: BoxShape.circle),
                  child: Icon(
                    Icons.remove,
                    color: AppColors.white,
                  ),
                ),
              ),
              Text(
                "$counter",
                style: AppTexts.s16b,
              ),
              InkWell(
                onTap: () {
                  incrementCounter();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              counter2 = counter;
              context.read<OrderBloc>().add(
                    AddProductsToOrderEvent(
                      selectedProductsModel: SelectedProductsModel(
                        productModel: widget.productModel,
                        quantity: counter2,
                      ),
                    ),
                  );
              _onButtonPressed();
              setState(() {
                counter = 1;
              });
            },
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      'Добавить',
                      style: AppTexts.s16w,
                    ),
                  ),
                  Center(
                    child: AnimatedOpacity(
                      opacity: _showIcon ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 200),
                      // Длительность анимации исчезновения
                      child: Text(
                        '+$counter2',
                        style: AppTexts.s16w.copyWith(
                            color: Colors.amber.shade700, fontSize: 24),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
