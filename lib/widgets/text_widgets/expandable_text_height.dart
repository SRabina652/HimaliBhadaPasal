import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himali_bhada_pasal/utils/colors.dart';
import 'package:himali_bhada_pasal/utils/dimensions.dart';
import 'package:himali_bhada_pasal/widgets/text_widgets/small_text.dart';

class ExpandableText extends StatefulWidget {
  String text;
  ExpandableText({super.key,required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool textHidden= true;

  double textHeight= Dimensions.screenHeight/5.65;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(widget.text.length> textHeight){
      firstHalf= widget.text.substring(0,textHeight.toInt());
      secondHalf=widget.text.substring(textHeight.toInt() +1, widget.text.length);
    }else{
      firstHalf=widget.text;
      secondHalf="";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(text: firstHalf,size: Dimensions.font20/1.4,):Column(
        children: [
          SmallText(text: textHidden?(firstHalf + "..."):(firstHalf+secondHalf),size: Dimensions.font20/1.3,color: AppColors.paraColor),
          InkWell(
            onTap: (){
              setState(() {
                textHidden=!textHidden;
              });
            },
            child: Row(
              children: [
                SmallText(text: textHidden?"Show all":"Show Less",color: AppColors.mainColor,size: Dimensions.font20/1.3,),
                Icon(
                  textHidden?Icons.arrow_drop_down_outlined:Icons.arrow_drop_up_outlined,color: AppColors.mainColor,size: Dimensions.iconSize24*1.3,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
