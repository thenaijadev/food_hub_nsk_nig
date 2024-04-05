import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';

class FormButton extends StatelessWidget {
  const FormButton({super.key, required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
            color: AppColors.orange, borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
          label,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        )),
      ),
    );
  }
}
