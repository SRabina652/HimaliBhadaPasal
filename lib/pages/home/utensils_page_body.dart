import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himali_bhada_pasal/utils/dimensions.dart';
import 'package:himali_bhada_pasal/widgets/column/app_column.dart';
import 'package:himali_bhada_pasal/widgets/text_widgets/main_text.dart';
import 'package:himali_bhada_pasal/widgets/text_widgets/small_text.dart';

import '../../utils/colors.dart';
import '../../widgets/text_and_icon/text_and_icon.dart';

class UtensilsPageBody extends StatefulWidget {
  const UtensilsPageBody({super.key});

  @override
  State<UtensilsPageBody> createState() => _UtensilsPageBodyState();
}

class _UtensilsPageBodyState extends State<UtensilsPageBody> {
  PageController controller = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        _currPageValue = controller.page!;
        print("the page value of the page is: " + _currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("the size of the screen is: " +
        MediaQuery.of(context).size.height.toString());
    return Column(
      children: [
        //Slider section in home page
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: controller,
              itemCount: 5,
              itemBuilder: (context, positions) {
                return _buildPageItem(positions);
              }),
        ),
        //dot section in home page
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(
          height: Dimensions.height30,
        ),
        // for popular text
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MainText(text: "Popular Items"),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 3),
                  child: MainText(
                    text: ".",
                    color: Colors.black38,
                  )),
              SizedBox(
                width: Dimensions.width15,
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 2),
                  child: SmallText(text: "Items Pairing")),
            ],
          ),
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (item, context) {
              return Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width15,
                      right: Dimensions.width15,
                      bottom: Dimensions.height15),
                  child: Row(
                    children: [
                      Container(
                        height: Dimensions.listViewImageHeight,
                        width: Dimensions.listViewImageWidth,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius30),
                            color: Colors.white54,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  "assets/image/nine.jpg",
                                ))),
                      ),
                      Expanded(
                          child: Container(
                        height: Dimensions.listViewContainerSize,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
                            )),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.width15,
                              right: Dimensions.width15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MainText(text: "Kaas ko thali (original)"),
                              SizedBox(
                                height: Dimensions.height5,
                              ),
                              SmallText(
                                  text:
                                      "Original with the longlasting texture"),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextAndIcon(
                                      icon: Icons.circle_sharp,
                                      text: "Original",
                                      iconColor: AppColors.iconColor1),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  TextAndIcon(
                                      icon: Icons.location_on,
                                      text: "2.4",
                                      iconColor: AppColors.mainColor),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ))
                    ],
                  ));
            }),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    //for the animation of the box with the matrix4 while sliding
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(children: [
        Container(
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(
              left: Dimensions.width15, right: Dimensions.width15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294CD),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/one.jpg"),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.height30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 4,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0, -5),
                  )
                ]),
            child: Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width15,
                  right: Dimensions.width15,
                  top: Dimensions.height10),
              child: AppColumn(text:"Spoons And Other Utensils" ,),
            ),
          ),
        ),
      ]),
    );
  }
}
