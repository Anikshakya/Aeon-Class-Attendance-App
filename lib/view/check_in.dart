import 'dart:async';
import 'package:aeon_class_attendance/view/change_values.dart';
import 'package:aeon_class_attendance/view/shapes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CheckIn extends StatefulWidget {
  const CheckIn({Key? key}) : super(key: key);

  @override
  State<CheckIn> createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  var count = 0;
  String? _hour, _minutes, _date, _day;
  bool tikBlink = true;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (Timer t) => blink);
    _hour = _formatHour(DateTime.now());
    _minutes = _formatMinutes(DateTime.now());
    _date = _formatDate(DateTime.now());
    _day = _formatDay(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getDateTime());
    super.initState();
  }

  String _formatHour(DateTime hour) {
    return DateFormat('hh').format(hour);
  }

  String _formatMinutes(DateTime minute) {
    return DateFormat('mm').format(minute);
  }

  String _formatDate(DateTime date) {
    return DateFormat('yyyy/d/M').format(date);
  }

  String _formatDay(DateTime day) {
    return DateFormat('EEEE').format(day);
  }

  void _getDateTime() {
    final DateTime now = DateTime.now();
    final String formattedHour = _formatHour(now);
    final String formattedMinutes = _formatMinutes(now);
    final String formattedDate = _formatDate(now);
    final String formattedDay = _formatDay(now);
    setState(() {
      _hour = formattedHour;
      _minutes = formattedMinutes;
      _date = formattedDate;
      _day = formattedDay;
    });
  }

  blink() {
    setState(() {
      tikBlink = !tikBlink;
    });
    if (tikBlink == false) {
      return ':';
    } else {
      return ' ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                ClipPath(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: count == 0
                          ? CheckInValues().linearGradient()
                          : count == 1
                              ? CheckOutValues().linearGradient()
                              : count == 2
                                  ? NoClass().linearGradient()
                                  : NoValidId().linearGradient(),
                    ),
                  ),
                  clipper: CustomClipperCurve(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 62,
                    ),
                    Text(
                      "イオンモール　橋本店",
                      style: GoogleFonts.notoSans(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 130,
                    ),
                    Text(
                      _date.toString() + " ($_day)",
                      style: GoogleFonts.notoSans(
                        color: const Color.fromARGB(255, 254, 254, 254),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.32,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _hour.toString(),
                          style: GoogleFonts.notoSans(
                            color: Colors.white,
                            fontSize: 64,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.241778,
                          ),
                        ),
                        Text(
                          " ${blink()} ",
                          style: GoogleFonts.notoSans(
                            color: Colors.white,
                            fontSize: 62,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.241778,
                          ),
                        ),
                        Text(
                          _minutes.toString(),
                          style: GoogleFonts.notoSans(
                            color: Colors.white,
                            fontSize: 64,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.241778,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              "4901750404857",
              style: GoogleFonts.notoSans(
                color: const Color.fromARGB(255, 30, 36, 50),
                fontSize: 20,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.32,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              count == 3 ? NoValidId().errorMessage : "橋本いとは",
              style: GoogleFonts.notoSans(
                color: count == 3
                    ? const Color.fromARGB(255, 241, 68, 66)
                    : const Color.fromARGB(255, 30, 36, 50),
                fontSize: 34,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.241778,
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            Text(
              count == 2
                  ? ""
                  : count == 3
                      ? ""
                      : "11:30 ~ 12:30",
              style: GoogleFonts.notoSans(
                color: const Color.fromARGB(255, 30, 36, 50),
                fontSize: 15,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.32,
              ),
            ),
            Text(
              count == 2
                  ? ""
                  : count == 3
                      ? ""
                      : "七田式キリンクラス",
              style: GoogleFonts.notoSans(
                color: const Color.fromARGB(255, 30, 36, 50),
                fontSize: 15,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.32,
              ),
            ),
            const SizedBox(
              height: 85,
            ),
            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    if (count < 3) {
                      count++;
                    }
                  },
                );
              },
              child: Text(
                count == 0
                    ? CheckInValues().buttonText
                    : count == 1
                        ? CheckOutValues().buttonText
                        : count == 2
                            ? NoClass().buttonText
                            : count == 3
                                ? NoValidId().buttonText
                                : "",
                style: GoogleFonts.notoSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.32,
                ),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                fixedSize: const Size(275, 46),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                primary: count == 0
                    ? CheckInValues().buttonColor()
                    : count == 1
                        ? CheckOutValues().buttonColor()
                        : count == 2
                            ? NoClass().buttonColor()
                            : count == 3
                                ? NoValidId().buttonColor()
                                : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
