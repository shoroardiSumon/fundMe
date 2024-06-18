import 'package:flutter/material.dart';
import 'package:fundme/controller/payment_provider.dart';
import 'package:fundme/utils/color_constant.dart';
import 'package:fundme/utils/custom_widget/custom_app_bar.dart';
import 'package:fundme/utils/custom_widget/custom_primary_button.dart';
import 'package:provider/provider.dart';

class DonateScreen extends StatefulWidget {
  const DonateScreen({super.key});

  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PaymentProvider>().updateIsSavePaymentMethod(false);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBodyBgColor,
      appBar: const CustomAppBar(
        title: "Donate",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<PaymentProvider>(
            builder: (context, paymentProvider, _) {
              return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      
                      TextFormField(
                        controller: cardNumberController,
                        decoration: InputDecoration(
                          labelText: 'Card/Account Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your card number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: expiryDateController,
                        decoration: InputDecoration(
                          labelText: 'Expiry Date',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter expiry date';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: cvvController,
                        decoration: InputDecoration(
                          labelText: 'CVV',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter CVV';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: cardHolderNameController,
                        decoration: InputDecoration(
                          labelText: 'Card/Account Holder Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter card holder name';
                          }
                          return null;
                        },
                      ),
            
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: amountController,
                        decoration: InputDecoration(
                          labelText: 'Amount',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the amount';
                          }
                          return null;
                        },
                      ),
            
                      const SizedBox(height: 10,),
            
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: paymentProvider.isSavePaymentMethod,
                            visualDensity: const VisualDensity(horizontal: -4),
                            activeColor: AppColors.appPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            onChanged: (value) {
                              paymentProvider.updateIsSavePaymentMethod(value?? false);
                            },
                          ),
                          Text('Save this payment info', style: TextStyle(color: paymentProvider.isSavePaymentMethod? AppColors.appPrimaryColor : AppColors.appGreyColor700, fontSize: 16, fontWeight: FontWeight.w400),),
                        ],
                      ),

                      const SizedBox(height: 32.0),
                      CustomPrimaryButton(
                        title: "Payment", 
                        isTrailing: false,
                        onTap: () {
                          
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          ),
        ),
      );
  }
}