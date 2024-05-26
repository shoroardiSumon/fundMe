import 'package:flutter/material.dart';
import 'package:fundme/utils/app_navigator.dart';
import 'package:fundme/utils/color_constant.dart';
import 'package:fundme/utils/custom_widget/custom_primary_button.dart';
import 'package:fundme/views/check_screen.dart';
import 'package:fundme/views/donate_screen.dart';
import 'package:fundme/views/police_report_screen.dart';
import 'package:fundme/views/suggestion_screen.dart';
import 'package:fundme/views/update_ip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBodyBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.appSecondaryColor
                  ),
                  child: const Text("Welcome to fundMe", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
                ),

                const SizedBox(height: 60,),

                CustomPrimaryButton(
                  title: "Prediction", 
                  isTrailing: true, 
                  onTap: () {
                    Navigator.of(context).push(appNavigator(const CheckScreen(), const Offset(1, 0), 500));
                  },
                ),

                const SizedBox(height: 20,),

                CustomPrimaryButton(
                  title: "Donate", 
                  isTrailing: true, 
                  onTap: () {
                    Navigator.of(context).push(appNavigator(const DonateScreen(), const Offset(1, 0), 500));
                  },
                ),

                const SizedBox(height: 20,),

                CustomPrimaryButton(
                  title: "Suggestion", 
                  isTrailing: true, 
                  onTap: () {
                    Navigator.of(context).push(appNavigator(const SuggestionScreen(), const Offset(1, 0), 500));
                  },
                ),

                const SizedBox(height: 20,),

                CustomPrimaryButton(
                  title: "Police Report", 
                  isTrailing: true, 
                  onTap: () {
                    Navigator.of(context).push(appNavigator(const PoliceReportScreen(), const Offset(1, 0), 500));
                  },
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(appNavigator(const UpdateIPScreen(), const Offset(1, 0), 500));
        },
        backgroundColor: AppColors.appPrimaryColor,
        child: const Icon(Icons.update_rounded, color: AppColors.appWhiteColor,)
      
      ),
    );
  }
}