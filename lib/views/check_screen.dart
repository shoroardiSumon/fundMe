import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fundme/controller/check_provider.dart';
import 'package:fundme/utils/app_navigator.dart';
import 'package:fundme/utils/color_constant.dart';
import 'package:fundme/utils/custom_widget/custom_app_bar.dart';
import 'package:fundme/utils/custom_widget/custom_primary_button.dart';
import 'package:fundme/utils/custom_widget/custom_secondary_button.dart';
import 'package:fundme/views/result_screen.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({super.key});

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CheckProvider>().resetAllDropdown();
      context.read<CheckProvider>().updateIsLoading(false);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBodyBgColor,
      appBar: const CustomAppBar(
        title: "Prediction",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<CheckProvider>(
            builder: (context, checkProvider, _) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDropdown('Project Duration', checkProvider.selectedProjectDuration, checkProvider.projectDurationItems, (value) {
                      checkProvider.updateProjectDurationDDWN(value!);
                    }),
                    const SizedBox(height: 15),
                    _buildDropdown('Target Amount', checkProvider.selectedTargetAmount, checkProvider.targetAmountItems, (value) {
                      checkProvider.updateTargetAmountDDWN(value!);
                    }),
                    const SizedBox(height: 15),
                    _buildDropdown('Number of Backers', checkProvider.selectedNumberOfBakers, checkProvider.numberOfBakersItems, (value) {
                      checkProvider.updateNumberOfBackersDDWN(value!);
                    }),
                    const SizedBox(height: 15),
                    _buildDropdown('Backers Feedback', checkProvider.selectedBackersFeedback, checkProvider.backersFeedbackItems, (value) {
                      checkProvider.updateBackersFeedbackDDWN(value!);
                    }),
                    const SizedBox(height: 15),
                    _buildDropdown('Previous Record', checkProvider.selectedPreviousRecord, checkProvider.previousRecordItems, (value) {
                      checkProvider.updatePreviousRecordDDWN(value!);
                    }),
                    const SizedBox(height: 15),
                    _buildDropdown('Address Verification', checkProvider.selectedAddressVerification, checkProvider.addressVerificationItems, (value) {
                      checkProvider.updateAddressVerificationDDWN(value!);
                    }),
                    const SizedBox(height: 15),
                    _buildDropdown('Project Credibility', checkProvider.selectedProjectCredibility, checkProvider.projectCredibilityItems, (value) {
                      checkProvider.updateProjectCredibilityDDWN(value!);
                    }),
                    const SizedBox(height: 15),
                    _buildDropdown('Is The Campaign Realistic?', checkProvider.selectedIsTheCampaignRealistic, checkProvider.isTheCampaignRealisticItems, (value) {
                      checkProvider.updateIsTheCampaignRealisticDDWN(value!);
                    }),
                    const SizedBox(height: 15),
                    _buildDropdown('Calculation of Money', checkProvider.selectedCalculationOfMoney, checkProvider.calculationOfMoneyItems, (value) {
                      checkProvider.updateCalculationOfMoneyDDWN(value!);
                    }),
                    const SizedBox(height: 15),
                    _buildDropdown('Is The Source Credible?', checkProvider.selectedIsTheSourceCredible, checkProvider.isTheSourceCredibleItems, (value) {
                      checkProvider.updateIsTheSourceCredibleDDWN(value!);
                    }),
                    const SizedBox(height: 15),
                    _buildDropdown('Rate of Crowd Funding Platforms', checkProvider.selectedRateOfCrowdFundingPlatforms, checkProvider.rateOfCrowdFundingPlatformsItems, (value) {
                      checkProvider.updateRateOfCrowdFundingPlatformsDDWN(value!);
                    }),
                    const SizedBox(height: 15),
                    _buildDropdown('Advertisement Cost', checkProvider.selectedAdvertisementCost, checkProvider.advertisementCostItems, (value) {
                      checkProvider.updateAdvertisementCostDDWN(value!);
                    }),

                    const SizedBox(height: 60,),

                    checkProvider.selectedProjectDuration!=null 
                        && checkProvider.selectedTargetAmount != null 
                        && checkProvider.selectedNumberOfBakers != null
                        && checkProvider.selectedBackersFeedback != null
                        && checkProvider.selectedPreviousRecord != null
                        && checkProvider.selectedAddressVerification != null 
                        && checkProvider.selectedProjectCredibility != null
                        && checkProvider.selectedIsTheCampaignRealistic != null
                        && checkProvider.selectedCalculationOfMoney != null
                        && checkProvider.selectedIsTheSourceCredible != null 
                        && checkProvider.selectedRateOfCrowdFundingPlatforms != null
                        && checkProvider.selectedAdvertisementCost != null? 

                    Skeletonizer(
                      enabled: checkProvider.isLoading,
                      ignoreContainers: false,
                      containersColor: AppColors.appGreyColor,
                      effect: const ShimmerEffect(),
                      child: CustomPrimaryButton(
                        title: "Result", 
                        isTrailing: false, 
                        onTap: () async{
                          var response = await checkProvider.makePredictionRequest(context);
                          if(response == "Successful" || response == "Unsuccessful"){
                            Navigator.of(context).push(appNavigator(ResultScreen(result: response), const Offset(1, 0), 500));
                          }else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red.shade900,
                                content: const Text('Something went wrong!'),
                                duration: const Duration(seconds: 2), // Optional duration
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          }
                        },
                      ),
                    ) : CustomSecondaryButton(
                      title: "Result", 
                      isTrailing: false, 
                      onTap: () {},
                    ),

                    const SizedBox(height: 50,),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String? selectedValue, List<String> items, Function(String?) onChanged) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(width: 2,),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: DropdownButton2<String>(
              hint: const Text('Please select'),
              value: selectedValue,
              underline: const SizedBox(),
              style: const TextStyle(color: Colors.black),
              onChanged: onChanged,
              isExpanded: true,
              items: [
                for (var item in items)
                  DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}