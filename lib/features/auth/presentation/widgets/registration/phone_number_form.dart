import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/app_bar_back_button.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/auth_button.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/text_field.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/registration/country_picker.dart';

class PhoneNumberForm extends StatefulWidget {
  const PhoneNumberForm({super.key});

  @override
  State<PhoneNumberForm> createState() => _PhoneNumberFormState();
}

class _PhoneNumberFormState extends State<PhoneNumberForm> {
  final GlobalKey<FormFieldState> inputKey = GlobalKey<FormFieldState>();
  String flag = "🇳🇬";
  String phoneCode = "+234";
  String phoneNumber = "";
  String phoneNo = "";
  void onSelect(Country country) {
    setState(() {
      flag = country.flagEmoji;
      phoneCode = "+${country.phoneCode}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 30, right: 30),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarBackButton(onTap: () {}),
            const SizedBox(
              height: 100,
            ),
            const TextWidget(
              text: "Registration",
              fontWeight: FontWeight.bold,
              fontSize: 38,
            ),
            const SizedBox(
              height: 20,
            ),
            const TextWidget(
              text: "Enter your phone number to verify your account",
              color: Color(0xFF9796A1),
              fontSize: 14,
            ),
            InputFieldWidget(
                keyboardType: TextInputType.phone,
                prefixicon: GestureDetector(
                  onTap: () {
                    pickCountry(context, onSelect);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: TextWidget(
                      text: flag,
                      fontSize: 40,
                    ),
                  ),
                ),
                label: "$phoneCode$phoneNo",
                hintText: "9012345678",
                onChanged: (val) {
                  setState(() {
                    phoneNo = val!;
                    phoneNumber = "$phoneCode$phoneNo";
                  });
                },
                textFieldkey: inputKey),
            PrimaryOrangeButton(
              label: "Verify",
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
