import 'package:flutter/cupertino.dart';
import 'package:himali_bhada_pasal/widgets/text_widgets/small_text.dart';

import '../../utils/dimensions.dart';

class TextAndIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const TextAndIcon(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,size: Dimensions.iconSize24,),
        SizedBox(width: 10,),
        SmallText(text: text,)
      ],
    );
  }
}
