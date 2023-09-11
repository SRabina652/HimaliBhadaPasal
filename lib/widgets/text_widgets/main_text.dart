import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himali_bhada_pasal/utils/dimensions.dart';

class MainText extends StatelessWidget {
  final String text;
  final Color color;
  double size;
  TextOverflow textOverflow;

  MainText(
      {super.key,
      required this.text,
      this.color = const Color(0xFF332d2b),
      this.size = 0,
      this.textOverflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      maxLines: 1,
      style: GoogleFonts.roboto(
        color: color,
        fontSize: size==0?Dimensions.font20:size,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
