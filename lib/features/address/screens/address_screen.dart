import 'package:flutter/material.dart';
import 'package:fyp/common/custom_button.dart';
import 'package:fyp/common/custom_textfield.dart';
import 'package:fyp/constants/utils.dart';
import 'package:fyp/features/address/services/address_services.dart';
import 'package:fyp/models/worker.dart';
import 'package:fyp/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  final Worker worker;
  const AddressScreen({super.key, required this.worker});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final _addressFormKey = GlobalKey<FormState>();

  String addressToBeUsed = '';

  final AddressServices addressServices = AddressServices();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pinCodeController.dispose();
    cityController.dispose();
  }

  void addAddress() {}

  void payPressed(String addressFromProvider) {
    addressToBeUsed = '';
    bool isForm = flatBuildingController.text.isNotEmpty ||
        areaController.text.isNotEmpty ||
        pinCodeController.text.isNotEmpty ||
        cityController.text.isNotEmpty;

    if (isForm) {
      if (_addressFormKey.currentState!.validate()) {
        addressToBeUsed =
            '${flatBuildingController.text}, ${areaController.text}, ${cityController.text} - ${pinCodeController.text}';
        if (Provider.of<UserProvider>(context, listen: false)
            .user
            .address
            .isEmpty) {
          addressServices.saveUserAddress(
              context: context, address: addressToBeUsed);
        }
        addressServices.placeOrder(
          context: context,
          address: addressToBeUsed,
          totalSum: widget.worker.fee,
          worker: widget.worker,
        );
      } else {
        throw Exception("Please enter all the values!");
      }
    } else if (addressFromProvider.isNotEmpty) {
      addressToBeUsed = addressFromProvider;
      addressServices.placeOrder(
        context: context,
        address: addressToBeUsed,
        totalSum: widget.worker.fee,
        worker: widget.worker,
      );
    } else {
      showSnackBar(context, 'error');
    }
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;

    return Scaffold(
      appBar: AppBar(
        title: Text('address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Text(
                        address,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'OR',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              Form(
                key: _addressFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      labelText: "Flat, House no, Building",
                      controller: flatBuildingController,
                      hintText: 'Email',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      labelText: "Area, Street",
                      controller: areaController,
                      hintText: 'Name',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      labelText: "PinCode",
                      controller: pinCodeController,
                      hintText: 'Password',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      labelText: "Town/City",
                      controller: cityController,
                      hintText: 'Password',
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: 'Pay',
                      onTap: () {
                        payPressed(address);
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
