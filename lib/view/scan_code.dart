import 'dart:async';
import 'package:aeon_class_attendance/view/check_in.dart';
import 'package:aeon_class_attendance/view/shapes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ScanCode extends StatefulWidget {
  const ScanCode({Key? key}) : super(key: key);

  @override
  State<ScanCode> createState() => _ScanCodeState();
}

class _ScanCodeState extends State<ScanCode> {
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
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 174, 22, 121),
                          Color.fromARGB(255, 255, 70, 191),
                        ],
                      ),
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
                    GestureDetector(
                      onTap: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            titlePadding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              bottom: 33,
                              top: 48,
                            ),
                            title: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(top: 2),
                                  width: 335,
                                  height: 61,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                        top: BorderSide(
                                            width: 1, color: Color(0xffEE3253)),
                                        left: BorderSide(
                                            width: 1, color: Color(0xffEE3253)),
                                        right: BorderSide(
                                            width: 1, color: Color(0xffEE3253)),
                                        bottom: BorderSide(
                                            width: 1, color: Color(0xffEE3253)),
                                      )),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.notoSans(
                                      color: const Color(0xff000000),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    cursorColor: const Color(0xffEE3253),
                                    decoration: InputDecoration(
                                        hintText: '店舗コード',
                                        hintStyle: GoogleFonts.notoSans(
                                          color: const Color(0xff000000),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        border: InputBorder.none),
                                  ),
                                ),
                                const SizedBox(
                                  height: 21,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 2),
                                  width: 335,
                                  height: 61,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                        top: BorderSide(
                                            width: 1, color: Color(0xffEE3253)),
                                        left: BorderSide(
                                            width: 1, color: Color(0xffEE3253)),
                                        right: BorderSide(
                                            width: 1, color: Color(0xffEE3253)),
                                        bottom: BorderSide(
                                            width: 1, color: Color(0xffEE3253)),
                                      )),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.notoSans(
                                      color: const Color(0xff000000),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: InputDecoration(
                                        hintText: 'パスコード',
                                        hintStyle: GoogleFonts.notoSans(
                                          color: const Color(0xff000000),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        border: InputBorder.none),
                                  ),
                                ),
                                const SizedBox(
                                  height: 51,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "確認",
                                    style: GoogleFonts.notoSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 0.32,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0.0,
                                    fixedSize: const Size(250, 46),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    primary:
                                        const Color.fromARGB(255, 126, 211, 23),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "イオンモール　橋本店",
                        style: GoogleFonts.notoSans(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
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
            GestureDetector(
              onTap: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    titlePadding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      bottom: 47,
                      top: 48,
                    ),
                    title: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 2),
                          width: 335,
                          height: 61,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(
                                  width: 1, color: Color(0xffEE3253)),
                              left: BorderSide(
                                  width: 1, color: Color(0xffEE3253)),
                              right: BorderSide(
                                  width: 1, color: Color(0xffEE3253)),
                              bottom: BorderSide(
                                  width: 1, color: Color(0xffEE3253)),
                            ),
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                              color: const Color(0xff000000),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                            cursorColor: const Color(0xffEE3253),
                            decoration: InputDecoration(
                                hintText: '会員番号を入力',
                                hintStyle: GoogleFonts.notoSans(
                                  color: const Color(0xff000000),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "確認",
                            style: GoogleFonts.notoSans(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.32,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            fixedSize: const Size(250, 46),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            primary: const Color.fromARGB(255, 126, 211, 23),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Text(
                "会員番号をスキャンしてください",
                style: GoogleFonts.notoSans(
                  color: const Color.fromARGB(255, 30, 36, 50),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.32,
                ),
              ),
            ),
            const SizedBox(
              height: 31,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckIn(),
                  ),
                );
              },
              child: Image.asset(
                "assets/images/QRcode.png",
                width: 138,
                height: 138,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
