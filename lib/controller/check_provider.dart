import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckProvider extends ChangeNotifier{
  final List<String> _projectDurationItems = ['Long', 'Small', 'Medium'];
  final List<String> _targetAmountItems = ['High', 'Low', 'Average'];
  final List<String> _numberOfBakersItems = ['More Than 1000', 'Less Than 1000'];
  final List<String> _backersFeedbackItems = ['Good', 'Bad'];
  final List<String> _previousRecordItems = ['Yes', 'No'];

  List<String> get projectDurationItems => _projectDurationItems;
  List<String> get targetAmountItems => _targetAmountItems;
  List<String> get numberOfBakersItems => _numberOfBakersItems;
  List<String> get backersFeedbackItems => _backersFeedbackItems;
  List<String> get previousRecordItems => _previousRecordItems;

  String? _selectedProjectDuration;
  String? _selectedTargetAmount;
  String? _selectedNumberOfBakers;
  String? _selectedBackersFeedback;
  String? _selectedPreviousRecord;

  String? get selectedProjectDuration => _selectedProjectDuration;
  String? get selectedTargetAmount => _selectedTargetAmount;
  String? get selectedNumberOfBakers => _selectedNumberOfBakers;
  String? get selectedBackersFeedback => _selectedBackersFeedback;
  String? get selectedPreviousRecord => _selectedPreviousRecord;

  CheckProvider() {
    _selectedProjectDuration = null;
    _selectedTargetAmount = null;
    _selectedNumberOfBakers = null;
    _selectedBackersFeedback = null;
    _selectedPreviousRecord = null;
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

  void resetAllDropdown(){
    _selectedProjectDuration = null;
    _selectedTargetAmount = null;
    _selectedNumberOfBakers = null;
    _selectedBackersFeedback = null;
    _selectedPreviousRecord = null;
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