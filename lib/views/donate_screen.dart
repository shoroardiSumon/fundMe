import 'package:flutter/material.dart';
import 'package:fundme/utils/color_constant.dart';
import 'package:fundme/utils/custom_widget/custom_app_bar.dart';

class DonateScreen extends StatefulWidget {
  const DonateScreen({super.key});

  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.appBodyBgColor,
      appBar: CustomAppBar(
        title: "Donate",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Donate Screen")
              ],
            ),
          ),
        ),
      ),
    );
  }
}