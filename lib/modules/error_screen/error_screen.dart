// ignore_for_file: file_names, sized_box_for_whitespace, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:the_last3/layout/home_layout/home_layout.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  _ErrorScreen createState() => _ErrorScreen();
}

class _ErrorScreen extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset('assets/images/10_Connection Lost.png',
                fit: BoxFit.cover, height: double.infinity),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('No Connection',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Your internet connection was interrupted, Please retry.',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.w100),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Material(
                    color: const Color(0xFF40588B),
                    elevation: 10,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Container(
                      width: 100,
                      height: 40,
                      child: TextButton(
                        child: const Text('RETRY',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Homelayout()));
                          //  super.widget
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  )
                  // shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(30)),
                  // elevation: 10,
                  // color: const Color(0xFF40588B),
                  // onTap: () {
                  //   // toast('RETRY');
                  // },
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
