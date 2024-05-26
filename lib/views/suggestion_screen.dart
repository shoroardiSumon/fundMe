import 'package:flutter/material.dart';
import 'package:fundme/utils/color_constant.dart';
import 'package:fundme/utils/custom_widget/custom_app_bar.dart';

class SuggestionScreen extends StatefulWidget {
  const SuggestionScreen({super.key});

  @override
  State<SuggestionScreen> createState() => _SuggestionScreenState();
}

class _SuggestionScreenState extends State<SuggestionScreen> {

  String sugg = 'Creating a personal finance management app can be an engaging and valuable software project. This app helps users track their income, expenses, and savings, providing insights into their financial health. The objective is to develop an app that assists users in managing their finances efficiently by tracking income, expenses, savings, and generating financial reports. Key features include secure user registration and authentication, an intuitive dashboard for an overview of financial status, expense and income tracking, budget planning, detailed reports and analytics, and timely notifications. Ensuring robust security with data encryption and secure cloud storage is paramount. The technology stack comprises React Native for a cross-platform mobile app, Node.js with Express for the backend, MongoDB for data storage, and JWT for secure user sessions. This app will empower users to gain better control over their finances, encourage saving, and provide a clear understanding of their spending habits, leading to more informed financial decisions. By leveraging modern technology, the app offers a comprehensive solution for personal finance management, making it an essential tool for anyone looking to improve their financial well-being.';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBodyBgColor,
      appBar: const CustomAppBar(
        title: "Suggestion",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sugg)
              ],
            ),
          ),
        ),
      ),
    );
  }
}