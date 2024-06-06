import 'package:eco_market/common/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SearchLine extends StatelessWidget {
  const SearchLine({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.grey,
      decoration: InputDecoration(
        fillColor: AppColors.lightGrey,
        filled: true,
        prefixIcon: const Icon(
          Icons.search,
          size: 20,
          color: AppColors.grey,
        ),
        hintText: 'Быстрый поиск',
        hintStyle: AppTexts.s16grey,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
