import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_login/otp_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String dialCodeDigits = "+00";
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0),
              child: Image.asset("images/login.jpg"),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: const Center(
                child: Text(
                  "Phone (OTP) Authentication",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            SizedBox(
              width: 400.0,
              height: 60.0,
              child: CountryCodePicker(
                onChanged: (country) {
                  setState(() {
                    dialCodeDigits = country.dialCode!;
                  });
                },
                initialSelection: "IT",
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                favorite: const ["+1", "US", "+92", "PAK"],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 10.0,
                top: 10.0,
                right: 10.0,
              ),
              child: TextField(
                maxLength: 12,
                keyboardType: TextInputType.number,
                controller: _controller,
                decoration: InputDecoration(
                    hintText: "Phone Number",
                    prefix: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(dialCodeDigits),
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OTPControllerScreen(
                            phone: _controller.text,
                            codeDigits: dialCodeDigits,
                          )));
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
