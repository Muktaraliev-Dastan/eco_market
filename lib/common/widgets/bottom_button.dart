import 'package:eco_market/common/utils/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: 54,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.green,
        ),
        child: Text(
          title,
          style: AppTexts.s16w,
        ),
      ),
    );
  }
}
