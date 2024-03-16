import 'package:assistant_ai/ui/manager/auth/auth_provider.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();

  Country selectedCountry = Country(
    phoneCode: '7',
    countryCode: 'RU',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Russian Federation',
    example: 'Russian Federation',
    displayName: 'Russian Federation',
    displayNameNoCountryCode: 'RU',
    e164Key: '',
  );

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeMQ = MediaQuery.of(context).size;
    final authProvider = context.watch<AuthProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: sizeMQ.height * 0.1),
              SizedBox(
                height: 200,
                width: 200,
                child: Lottie.asset('assets/Animation_1710533762339.json'),
              ),
              const Text(
                'Чат-портал:\nМир общения и творчества',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: sizeMQ.height * 0.02),
              TextFormField(
                controller: _phoneController,
                maxLength: 10,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  setState(() {
                    _phoneController.text = value;
                  });
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  counterText: '',
                  hintText: 'Электронный номер',
                  // prefixIcon: Icon(CupertinoIcons.phone),
                  prefixIcon: Container(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0, top: 11),
                    child: InkWell(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                            bottomSheetHeight: sizeMQ.height * 0.5,
                          ),
                          showPhoneCode: true,
                          // optional. Shows phone code before the country name.
                          onSelect: (Country country) {
                            setState(() {
                              selectedCountry = country;
                            });
                          },
                        );
                      },
                      child: Text(
                        '${selectedCountry.flagEmoji} +${selectedCountry.phoneCode}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  suffixIcon: _phoneController.text.length > 9
                      ? authProvider.isLoading
                          ? const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : InkWell(
                              onTap: () {
                                /// вход с помощью номера
                                authProvider.signInWithPhoneNumber(
                                    phoneParam:
                                        '+${selectedCountry.phoneCode}${_phoneController.text}',
                                    context: context);
                              },
                              child: Container(
                                height: 18,
                                width: 18,
                                margin: const EdgeInsets.all(14),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                                child: const Icon(
                                  CupertinoIcons.check_mark,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            )
                      : null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
