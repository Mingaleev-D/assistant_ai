import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:lottie/lottie.dart';

class OPTPage extends StatefulWidget {
  const OPTPage({Key? key}) : super(key: key);

  @override
  State<OPTPage> createState() => _OPTPageState();
}

class _OPTPageState extends State<OPTPage> {
  final _otpNumberController = TextEditingController();
  final focusNode = FocusNode();
  String? otpCode;

  @override
  void dispose() {
    _otpNumberController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeMQ = MediaQuery.of(context).size;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Colors.blueGrey.shade800,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.2),
        border: Border.all(
          color: const Color.fromRGBO(30, 60, 87, 1),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );

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
                child: Lottie.asset('assets/opt_123.json'),
              ),
              SizedBox(height: sizeMQ.height * 0.05),
              const Text(
                'Верификация ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: sizeMQ.height * 0.05),
              SizedBox(
                height: 50,
                child: Pinput(
                  length: 6,
                  controller: _otpNumberController,
                  focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  onCompleted: (value) {
                    setState(() {
                      otpCode = value;
                    });
                  },
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color.fromRGBO(30, 60, 87, 1),
                      ),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: sizeMQ.height * 0.05),
              ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 4),
                onPressed: () {},
                child: const Text(
                  'Не получил(а) код 😭',
                  style: TextStyle(
                      color: Colors.blueGrey, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
