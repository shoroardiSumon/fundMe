import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PoliceReportProvider extends ChangeNotifier{
  void makingPhoneCall(String number) async {
    var url = Uri.parse("tel:$number");
    if (await launchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  void sendingSMS( String number) async {
    var url = Uri.parse("sms:$number");
    if (await launchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}