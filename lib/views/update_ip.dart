import 'package:flutter/material.dart';
import 'package:fundme/utils/custom_widget/custom_app_bar.dart';
import 'package:fundme/utils/custom_widget/custom_primary_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateIPScreen extends StatefulWidget {
  const UpdateIPScreen({super.key});

  @override
  State<UpdateIPScreen> createState() => _UpdateIPScreenState();
}

class _UpdateIPScreenState extends State<UpdateIPScreen> {
  TextEditingController ipController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getIP();
  }

  void getIP()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ipAddressPort = prefs.getString('ip_address') ?? '';
    setState(() {
      ipController.text = ipAddressPort;
    });
  }

  @override
  void dispose() {
    super.dispose();
    ipController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Update IP"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: ipController,
                  decoration: const InputDecoration(
                    labelText: 'IP address',
                  ),
                  validator: (value) {
                    if(value==null || value.isEmpty){
                      return "Please enter IP Address";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 50,),

                CustomPrimaryButton(
                  title: "Update", 
                  isTrailing: false, 
                  onTap: () async{
                    if(_formKey.currentState!.validate()){
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setString('ip_address', ipController.text);
                      print("updated");

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green.shade900,
                          content: const Text('IP is Updated'),
                          duration: const Duration(seconds: 2), // Optional duration
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                    
                  },
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}