import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckProvider extends ChangeNotifier{
  final List<String> _projectDurationItems = ['Long', 'Small', 'Medium'];
  final List<String> _targetAmountItems = ['High', 'Low', 'Average'];
  final List<String> _numberOfBakersItems = ['More Than 1000', 'Less Than 1000'];
  final List<String> _backersFeedbackItems = ['Good', 'Bad'];
  final List<String> _previousRecordItems = ['Yes', 'No'];
  final List<String> _addressVerificationItems = ['Real', 'Fake'];
  final List<String> _projectCredibilityItems = ['Credible', 'Non Credible',];
  final List<String> _isTheCampaignRealisticItems = ['Yes', 'No'];
  final List<String> _calculationOfMoneyItems = ['Perfectly', 'Imperfectly'];
  final List<String> _isTheSourceCredibleItems = ['Yes', 'No'];
  final List<String> _rateOfCrowdFundingPlatformsItems = ['High', 'Medium', 'Low'];
  final List<String> _advertisementCostItems = ['High Cost', 'Average Cost', 'No Cost'];

  List<String> get projectDurationItems => _projectDurationItems;
  List<String> get targetAmountItems => _targetAmountItems;
  List<String> get numberOfBakersItems => _numberOfBakersItems;
  List<String> get backersFeedbackItems => _backersFeedbackItems;
  List<String> get previousRecordItems => _previousRecordItems;
  List<String> get addressVerificationItems => _addressVerificationItems;
  List<String> get projectCredibilityItems => _projectCredibilityItems;
  List<String> get isTheCampaignRealisticItems => _isTheCampaignRealisticItems;
  List<String> get calculationOfMoneyItems => _calculationOfMoneyItems;
  List<String> get isTheSourceCredibleItems => _isTheSourceCredibleItems;
  List<String> get rateOfCrowdFundingPlatformsItems => _rateOfCrowdFundingPlatformsItems;
  List<String> get advertisementCostItems => _advertisementCostItems;

  String? _selectedProjectDuration;
  String? _selectedTargetAmount;
  String? _selectedNumberOfBakers;
  String? _selectedBackersFeedback;
  String? _selectedPreviousRecord;
  String? _selectedAddressVerification;
  String? _selectedProjectCredibility;
  String? _selectedIsTheCampaignRealistic;
  String? _selectedCalculationOfMoney;
  String? _selectedIsTheSourceCredible;
  String? _selectedRateOfCrowdFundingPlatforms;
  String? _selectedAdvertisementCost;

  String? get selectedProjectDuration => _selectedProjectDuration;
  String? get selectedTargetAmount => _selectedTargetAmount;
  String? get selectedNumberOfBakers => _selectedNumberOfBakers;
  String? get selectedBackersFeedback => _selectedBackersFeedback;
  String? get selectedPreviousRecord => _selectedPreviousRecord;
  String? get selectedAddressVerification => _selectedAddressVerification;
  String? get selectedProjectCredibility => _selectedProjectCredibility;
  String? get selectedIsTheCampaignRealistic => _selectedIsTheCampaignRealistic;
  String? get selectedCalculationOfMoney => _selectedCalculationOfMoney;
  String? get selectedIsTheSourceCredible => _selectedIsTheSourceCredible;
  String? get selectedRateOfCrowdFundingPlatforms => _selectedRateOfCrowdFundingPlatforms;
  String? get selectedAdvertisementCost => _selectedAdvertisementCost;

  CheckProvider() {
    _selectedProjectDuration = null;
    _selectedTargetAmount = null;
    _selectedNumberOfBakers = null;
    _selectedBackersFeedback = null;
    _selectedPreviousRecord = null;
    _selectedAddressVerification = null;
    _selectedProjectCredibility = null;
    _selectedIsTheCampaignRealistic = null;
    _selectedCalculationOfMoney = null;
    _selectedIsTheSourceCredible = null;
    _selectedRateOfCrowdFundingPlatforms = null;
    _selectedAdvertisementCost = null;
  }

  void updateProjectDurationDDWN(String seletedValue){
    _selectedProjectDuration = seletedValue;
    notifyListeners();
  }

  void updateTargetAmountDDWN(String seletedValue){
    _selectedTargetAmount = seletedValue;
    notifyListeners();
  }

  void updateNumberOfBackersDDWN(String seletedValue){
    _selectedNumberOfBakers = seletedValue;
    notifyListeners();
  }

  void updateBackersFeedbackDDWN(String seletedValue){
    _selectedBackersFeedback = seletedValue;
    notifyListeners();
  }

  void updatePreviousRecordDDWN(String seletedValue){
    _selectedPreviousRecord = seletedValue;
    notifyListeners();
  }

  void updateAddressVerificationDDWN(String seletedValue){
    _selectedAddressVerification = seletedValue;
    notifyListeners();
  }

  void updateProjectCredibilityDDWN(String seletedValue){
    _selectedProjectCredibility = seletedValue;
    notifyListeners();
  }

  void updateIsTheCampaignRealisticDDWN(String seletedValue){
    _selectedIsTheCampaignRealistic = seletedValue;
    notifyListeners();
  }

  void updateCalculationOfMoneyDDWN(String seletedValue){
    _selectedCalculationOfMoney = seletedValue;
    notifyListeners();
  }

  void updateIsTheSourceCredibleDDWN(String seletedValue){
    _selectedIsTheSourceCredible = seletedValue;
    notifyListeners();
  }
  void updateRateOfCrowdFundingPlatformsDDWN(String seletedValue){
    _selectedRateOfCrowdFundingPlatforms = seletedValue;
    notifyListeners();
  }

  void updateAdvertisementCostDDWN(String seletedValue){
    _selectedAdvertisementCost = seletedValue;
    notifyListeners();
  }


  void resetAllDropdown(){
    _selectedProjectDuration = null;
    _selectedTargetAmount = null;
    _selectedNumberOfBakers = null;
    _selectedBackersFeedback = null;
    _selectedPreviousRecord = null;
    _selectedAddressVerification = null;
    _selectedProjectCredibility = null;
    _selectedIsTheCampaignRealistic = null;
    _selectedCalculationOfMoney = null;
    _selectedIsTheSourceCredible = null;
    _selectedRateOfCrowdFundingPlatforms = null;
    _selectedAdvertisementCost = null;
    notifyListeners();
  }


  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void updateIsLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }


  Future<dynamic> makePredictionRequest(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    try {
      var data = FormData.fromMap({
        'project_duration': _selectedProjectDuration ?? '',
        'target_amount': _selectedTargetAmount ?? '',
        'no_of_backers': _selectedNumberOfBakers ?? '',
        'backers_feedback': _selectedBackersFeedback ?? '',
        'previous_record': _selectedPreviousRecord ?? '',
        'address_verification': _selectedAddressVerification ?? '',
        'project_credibility': _selectedProjectCredibility ?? '',
        'is_the_campaign_realistic': _selectedIsTheCampaignRealistic ?? '',
        'calculation_of_money': _selectedCalculationOfMoney ?? '',
        'is_the_source_credible': _selectedIsTheSourceCredible ?? '',
        'rate_of_crowdfunding_platforms': _selectedRateOfCrowdFundingPlatforms ?? '',
        'advertisement_cost': _selectedAdvertisementCost ?? '',
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String ipAddressPort = prefs.getString('ip_address') ?? '';


      if(ipAddressPort.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red.shade900,
            content: const Text('Please add IP Address with Port'),
            duration: const Duration(seconds: 2), // Optional duration
            behavior: SnackBarBehavior.floating,
          ),
        );
        _isLoading = false;
        notifyListeners();
        return;
      }

      String baseURL = "http://$ipAddressPort/predict";

      var dio = Dio();
      var response = await dio.post(
        baseURL,
        data: data,
      );

      if (response.statusCode == 200) {
        _isLoading = false;
        notifyListeners();
        print("my response==");
        print(response);
        return response.data["result"].toString();
      } else {
        _isLoading = false;
        notifyListeners();
        print(response.statusMessage);
        return "error";
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print(e.toString());
      return "error";
    }
  }

}