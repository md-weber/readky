import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readky/route/slide_page_route.dart';
import 'package:readky/view/screens/page_switch.dart';
import 'package:readky/view/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SvgPicture.asset('assets/icons/appname.svg'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            // Section 1 - Welcome Title
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 40),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              child: const Text(
                "Hii 👋 let's go back to reading. ",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                  height: 150 / 100,
                ),
              ),
            ),
            // Section 2 - Form
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    hintText: 'youremail@email.com',
                    labelText: 'Email',
                  ),
                  CustomTextField(
                    labelText: 'Password',
                    hintText: '********',
                    obsecureText: true,
                  ),
                ],
              ),
            ),
            // Section 3 - Register Button
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(SlidePageRoute(child: const PageSwitch()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: 'inter',
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.topCenter,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontWeight: FontWeight.w400),
                ),
                child: const Text('Forgot your password?'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
