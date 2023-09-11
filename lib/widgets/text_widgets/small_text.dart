import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  Color? color;
  double size;
  final String text;

  SmallText(
      {super.key,
        required this.text,
        this.color = const Color(0xff85817f),
        this.size = 12});

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: GoogleFonts.roboto(
        color: color,
        fontSize: size,
        ),
    );
  }
}
