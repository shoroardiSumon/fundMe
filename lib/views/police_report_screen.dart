import 'package:flutter/material.dart';
import 'package:fundme/utils/color_constant.dart';
import 'package:fundme/utils/custom_widget/custom_app_bar.dart';

class PoliceReportScreen extends StatefulWidget {
  const PoliceReportScreen({super.key});

  @override
  State<PoliceReportScreen> createState() => _PoliceReportScreenState();
}

class _PoliceReportScreenState extends State<PoliceReportScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.appBodyBgColor,
      appBar: CustomAppBar(
        title: "Police Report",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Police Report Screen")
              ],
            ),
          ),
        ),
      ),
    );
  }
}