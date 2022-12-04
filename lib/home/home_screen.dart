import 'package:doctor/customs/custom_listtile.dart';
import 'package:doctor/fakedata/fakedata.dart';
import 'package:doctor/login/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  child: RichText(
                    text: const TextSpan(
                      text: "Product",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Arena",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 22,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container()),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text(
                                  "Log Out",
                                  style: TextStyle(fontSize: 32),
                                ),
                                content: const Text(
                                  "Are you sure you want to log out form the console?",
                                  style: TextStyle(fontSize: 18),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        "Cancel",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: ((context) =>
                                                  LoginScreen()),
                                            ),
                                            (route) => false);
                                      },
                                      child: const Text(
                                        "Yes",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      )),
                                ],
                              ));
                    },
                    icon: Icon(Icons.exit_to_app))
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      Row(
                        children: [
                          Container(
                            child: const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/dravatar.png"),
                              radius: 50,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "My profile",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Dr. John Doe",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        child: const Text(
                          "Patient list for today",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: patientData.length,
                            itemBuilder: ((context, index) {
                              return CustomListTile(
                                  patientData: patientData, index: index);
                            }),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: const Text(
                              "Tommorow",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: patientData2.length,
                            itemBuilder: ((context, index) {
                              return CustomListTile(
                                  patientData: patientData2, index: index);
                            }),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: const Text(
                              "Tommorow",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: patientData3.length,
                            itemBuilder: ((context, index) {
                              return CustomListTile(
                                  patientData: patientData3, index: index);
                            }),
                          ),
                        ],
                      ),
                    ],
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
