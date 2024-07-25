import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FSFonts {
  static final TextStyle regularFonts12 = GoogleFonts.raleway(
      color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500);

  static final TextStyle regularFonts16 = GoogleFonts.raleway(
      color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);

  static final TextStyle buttonRegularFonts16 = GoogleFonts.raleway(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      shadows: <Shadow>[
        Shadow(
          offset: const Offset(-1, 1),
          blurRadius: 1.0,
          color: Colors.black.withOpacity(0.5),
        ),
      ]);

  static final TextStyle regularFonts14 = GoogleFonts.raleway(
      color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500);

  static final TextStyle hintRegularFonts14 = GoogleFonts.raleway(
      color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500);

  static final TextStyle regularFonts18 = GoogleFonts.raleway(
      color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500);

  static final TextStyle regularFonts20 = GoogleFonts.raleway(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500);

  static final TextStyle mediumFonts20 = GoogleFonts.raleway(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500);

  static final TextStyle errorFonts = GoogleFonts.raleway(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500);

  static final TextStyle semiBoldFonts16 = GoogleFonts.raleway(
      color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600);

  static final TextStyle semiBoldFonts20 = GoogleFonts.raleway(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600);

  static final TextStyle semiBoldFonts24 = GoogleFonts.raleway(
      color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600);

  static final TextStyle semiBoldFonts22 = GoogleFonts.raleway(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700);

  static final TextStyle semiBoldFonts35 = GoogleFonts.raleway(
      color: Colors.black, fontSize: 35, fontWeight: FontWeight.w600);

  static final TextStyle boldFonts35 = GoogleFonts.raleway(
    color: Colors.black,
    fontSize: 35,
    fontWeight: FontWeight.w700,
    shadows: <Shadow>[
      Shadow(
        offset: const Offset(2.0, 2.0),
        blurRadius: 3.0,
        color: Colors.black.withOpacity(0.5),
      ),
    ],
  );

  static final TextStyle boldFonts40 = GoogleFonts.raleway(
      color: Colors.black, fontSize: 40, fontWeight: FontWeight.w700);
}
