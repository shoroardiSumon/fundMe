import 'package:flutter/material.dart';
import 'package:fundme/utils/color_constant.dart';
import 'package:fundme/utils/custom_widget/custom_app_bar.dart';

class ResultScreen extends StatefulWidget {
  final String result;
  const ResultScreen({super.key, required this.result});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Result"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            height: MediaQuery.of(context).size.height-kToolbarHeight,
            width: double.infinity,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100,),
                Icon(widget.result =="Successful"? Icons.check_circle_outline_rounded : Icons.error_outline_rounded, size: 100, color: AppColors.appPrimaryColor,),

                const SizedBox(height: 20,),

                Text(widget.result, style: const TextStyle(fontSize: 24),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}