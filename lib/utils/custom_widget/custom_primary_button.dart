import 'package:flutter/material.dart';
import 'package:fundme/utils/color_constant.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String title;
  final bool isTrailing; 
  final VoidCallback onTap;

  const CustomPrimaryButton({
    super.key,
    required this.title,
    required this.isTrailing,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: 48,
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.appPrimaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(title, style: const TextStyle(color: AppColors.appWhiteColor, fontSize: 16, fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
            ),
            isTrailing? const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.appWhiteColor,): Container()

          ],
        ),
      ),
    );
  }
}
