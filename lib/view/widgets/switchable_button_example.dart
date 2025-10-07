import 'package:flutter/material.dart';

class SwitchableButtonExample extends StatefulWidget {
  const SwitchableButtonExample({super.key});

  @override
  State<SwitchableButtonExample> createState() =>
      _SwitchableButtonExampleState();
}

class _SwitchableButtonExampleState extends State<SwitchableButtonExample> {
  Alignment _containerAlignment = Alignment.centerLeft;
  Color textColor = Colors.white;
  Color textColorActive = Colors.black;
  bool activeLeft = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            height: 70,
            child: Stack(
              children: [
                AnimatedContainer(
                  height: 70,
                  alignment: _containerAlignment,
                  duration: const Duration(seconds: 1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withValues(alpha: 0.10),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _containerAlignment = Alignment.centerLeft;
                          activeLeft = true;
                        });
                      },
                      child: Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        color: Colors.black.withValues(alpha: 0),
                        alignment: Alignment.center,
                        child: AnimatedDefaultTextStyle(
                          style: TextStyle(
                            color: (activeLeft == true)
                                ? textColorActive
                                : textColor,
                          ),
                          duration: const Duration(seconds: 1),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _containerAlignment = Alignment.centerRight;
                          activeLeft = false;
                        });
                      },
                      child: Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        color: Colors.black.withValues(alpha: 0),
                        alignment: Alignment.center,
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(seconds: 1),
                          style: TextStyle(
                            color: (activeLeft == false)
                                ? textColorActive
                                : textColor,
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
