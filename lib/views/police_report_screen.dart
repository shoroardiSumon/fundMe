import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fundme/controller/police_report_provider.dart';
import 'package:fundme/utils/color_constant.dart';
import 'package:fundme/utils/custom_widget/custom_app_bar.dart';
import 'package:fundme/utils/custom_widget/custom_primary_button.dart';
import 'package:fundme/utils/custom_widget/custom_secondary_button.dart';
import 'package:fundme/utils/police_contacts.dart';
import 'package:provider/provider.dart';
class PoliceReportScreen extends StatefulWidget {
  const PoliceReportScreen({super.key});

  @override
  State<PoliceReportScreen> createState() => _PoliceReportScreenState();
}

class _PoliceReportScreenState extends State<PoliceReportScreen> {
  String selectedDistrict = '';
  String selectedPoliceStation = '';
  String policeStationNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBodyBgColor,
      appBar: const CustomAppBar(
        title: "Police Report",
      ),
      body: Consumer<PoliceReportProvider>(
        builder: (context, policeReportProvider, _) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Select District'),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: DropdownButton2<String>(
                    hint: const Text("Select District"),
                    underline: const SizedBox(),
                    items: policeContacts.keys.map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                  
                    value: selectedDistrict.isEmpty ? null : selectedDistrict,
                    onChanged: (value) {
                      setState(() {
                        selectedDistrict = value!;
                        selectedPoliceStation = '';
                        policeStationNumber = '';
                      });
                    },
                    isExpanded: true,
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Select Police Station'),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: DropdownButton2<String>(
                    hint: const Text("Select Police Station"),
                    underline: const SizedBox(),
                    items: selectedDistrict.isEmpty? [] : policeContacts[selectedDistrict]!.keys.map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                  
                    value: selectedPoliceStation.isEmpty ? null : selectedPoliceStation,
                    onChanged: (value) {
                      setState(() {
                        selectedPoliceStation = value!;
                        policeStationNumber = policeContacts[selectedDistrict]![value]!;
                      });
                    },
                    isExpanded: true,
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Police Station Contact Number'),
                const SizedBox(height: 10),
                Text(
                  policeStationNumber,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
          
                const SizedBox(height: 20),
          
                policeStationNumber.isNotEmpty? CustomPrimaryButton(
                  title: "Send SMS", 
                  isTrailing: false, 
                  onTap: () {
                    policeReportProvider.sendingSMS(policeStationNumber);
                  },
                ) : CustomSecondaryButton(
                  title: "Send SMS", 
                  isTrailing: false, 
                  onTap: () {
                  },
                ),
          
                const SizedBox(height: 15),
          
                policeStationNumber.isNotEmpty? CustomPrimaryButton(
                  title: "Make a Call", 
                  isTrailing: false, 
                  onTap: () {
                    policeReportProvider.makingPhoneCall(policeStationNumber);
                  },
                ) : CustomSecondaryButton(
                  title: "Make a Call", 
                  isTrailing: false, 
                  onTap: () {
                  },
                ),
          
              ],
            ),
          );
        }
      )
    );
  }
}
