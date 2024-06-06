import 'package:eco_market/common/utils/constants.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.price,
    required this.title,
    required this.pathToImage,
  });

  final String price;
  final String title;
  final String pathToImage;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int counter = 1;

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
                widget.pathToImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            widget.title,
            style: AppTexts.s14b,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          SizedBox(height: 18),
          Text(
            widget.price,
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
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Добавить',
                style: AppTexts.s16w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
