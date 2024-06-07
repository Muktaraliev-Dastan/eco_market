import 'package:eco_market/common/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SearchLine extends StatefulWidget {
  final void Function(String) isInputEmptyCallback;

  const SearchLine({
    super.key,
    required this.isInputEmptyCallback,
  });

  @override
  State<SearchLine> createState() => _SearchLineState();
}

class _SearchLineState extends State<SearchLine> {
  TextEditingController productName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value){
        widget.isInputEmptyCallback(value);
      },
      controller: productName,
      keyboardType: TextInputType.name,
      maxLength: 30,
      cursorColor: AppColors.grey,
      decoration: InputDecoration(
        counterText: "",
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
