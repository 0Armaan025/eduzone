import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduzone_clone/common/constants/constants.dart';
import 'package:eduzone_clone/common/widgets/nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String todaysDate = "";
  String year = "";
  String hoursStudied = "";
  String minsStudied = "";
  String secsStudied = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var now = new DateTime.now();
    var formatter = new DateFormat('dd');
    String formattedDate = formatter.format(now);
    print(formattedDate);
    todaysDate = formattedDate;
    setState(() {});
    formatter = new DateFormat('yyyy');
    formattedDate = formatter.format(now);
    year = formattedDate;
    setState(() {});
    getData();
  }

  void getData() {
    setState(() {});
    var data = firestore
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      hoursStudied = snapshot.get('totalHoursStudied');
      email = snapshot.get('email');
      name = snapshot.get('name');
      final mins = Duration(hours: int.parse(hoursStudied)).inMinutes;
      minsStudied = mins.toString();
      final secs = (mins * 60).toString();
      secsStudied = secs;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: size.height * 0.9,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.lightBlue[100],
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Hey There, $name.",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 120),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "$todaysDate February, $year",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 128.0),
                child: Card(
                  elevation: 2.0,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.lightBlue,
                          Colors.lightBlueAccent,
                        ],
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          'Time elapsed studying_',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text('$hoursStudied hours',
                            style: GoogleFonts.poppins(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w600,
                              fontSize: 26,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text('$minsStudied MINUTES',
                            style: GoogleFonts.poppins(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w400,
                              fontSize: 22,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('$secsStudied SECS',
                            style: GoogleFonts.poppins(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w300,
                              fontSize: 18,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 128.0),
                child: Card(
                  elevation: 2.0,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.lightBlue,
                          Colors.lightBlueAccent,
                        ],
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          'Most Competitive Buddy :-',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text('HITEN',
                            style: GoogleFonts.poppins(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w600,
                              fontSize: 26,
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        Text('Time spent:-',
                            style: GoogleFonts.poppins(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text('16.2 HOURS',
                            style: GoogleFonts.poppins(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 88.0),
                child: Text(
                  '"Eduzone believes that $name,\nyou can surely do it!,\nget back to studying!"',
                  style: GoogleFonts.poppins(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: NavBarWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
