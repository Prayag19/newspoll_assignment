import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newspoll/ui/utils/extensions.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_icons.dart';

class FeedPageMedSection extends StatelessWidget {
  const FeedPageMedSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height:  context.responsive(
        87,
        axis: Axis.vertical,
      ),
      decoration:const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/feed_flying_coins.png"),fit: BoxFit.contain, scale: 1,opacity: 0.3 ),
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
          gradient:LinearGradient(
              colors: [AppColors.kFeedMedSectionBgGradientBlue, AppColors.kFeedMedSectionBgGradientPink],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter)),

      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal :context.responsive(8, axis:Axis.horizontal)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: context.responsive(10, axis: Axis.horizontal),),
            Container(
              width: context.responsive(200, axis: Axis.horizontal),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height:context.responsive(24, axis: Axis.vertical),
                    child: Text("CHANGE", style: TextStyle(fontSize: context.responsive(12, axis: Axis.vertical),color: Colors.white, fontWeight: FontWeight.bold ),),
                  ),
                  // SizedBox(height: context.responsive(2, axis: Axis.vertical),),
                  Container(
                    height:context.responsive(38, axis: Axis.vertical),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("11%", style: TextStyle(fontSize: context.responsive(30, axis: Axis.vertical),color: Colors.white, fontWeight: FontWeight.bold ),),
                        SizedBox(width: context.responsive(8, axis: Axis.horizontal),),
                        Container(
                          width: context.responsive(28, axis: Axis.horizontal),
                          height: context.responsive(26, axis: Axis.vertical),
                          child: Image.asset("assets/images/feed_change_growth.png"),
                        ),
                        SizedBox(width: context.responsive(8, axis: Axis.horizontal),),
                        Container(
                          width: context.responsive(65, axis: Axis.horizontal),
                          child: Container(
                            height:context.responsive(38, axis: Axis.vertical),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  height:context.responsive(14, axis: Axis.vertical),
                                  child: Text("24H", style: TextStyle(fontSize: context.responsive(12, axis: Axis.vertical),color: Colors.white, fontWeight: FontWeight.bold ),),
                                ),
                                Container(
                                  height:context.responsive(14, axis: Axis.vertical),
                                  child: Text("+25495\$", style: TextStyle(fontSize: context.responsive(12, axis: Axis.vertical),color: Colors.white, fontWeight: FontWeight.bold ),),
                                ),
                              ],
                            ),
                          ),



                        ),
                      ],
                    ),
                  ),
                ],
              ),

            ),
            SizedBox(width: context.responsive(8, axis: Axis.horizontal),),
            Container(
              width: context.responsive(60, axis: Axis.horizontal),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height:context.responsive(24, axis: Axis.vertical),
                    child: Text("\$09", style: TextStyle(fontSize: context.responsive(20, axis: Axis.vertical),color: Colors.white, fontWeight: FontWeight.bold ),),
                  ),
                  SizedBox(height: context.responsive(8, axis: Axis.vertical),),
                  Container(
                    width: context.responsive(60, axis: Axis.horizontal),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(context.responsive(10, axis: Axis.horizontal)),
                        color:AppColors.kFeedMedSectionPollYes
                    ),
                    height:context.responsive(24, axis: Axis.vertical) ,
                    child: Center(child: Text("YES", style: TextStyle(fontSize: context.responsive(16, axis: Axis.vertical),fontWeight: FontWeight.bold),)),
                  )

                ],
              ),
            ),
            SizedBox(width: context.responsive(8, axis: Axis.horizontal),),
            Container(width: context.responsive(60, axis: Axis.horizontal),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height:context.responsive(24, axis: Axis.vertical),
                    child: Text("\$89", style: TextStyle(fontSize: context.responsive(20, axis: Axis.vertical),color: Colors.white, fontWeight: FontWeight.bold ),),
                  ),
                  SizedBox(height: context.responsive(8, axis: Axis.vertical),),
                  Container(
                    width: context.responsive(60, axis: Axis.horizontal),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(context.responsive(10, axis: Axis.horizontal)),
                        color:AppColors.kFeedMedSectionPollNo
                    ),
                    height:context.responsive(24, axis: Axis.vertical) ,
                    child: Center(child: Text("NO", style: TextStyle(fontSize: context.responsive(16, axis: Axis.vertical), color: Colors.white, fontWeight: FontWeight.bold),)),
                  )

                ],
              ),
            ),
            SizedBox(width: context.responsive(8, axis: Axis.horizontal),),

          ],
        ),
      ),
    );
  }
}