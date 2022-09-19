
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newspoll/ui/utils/extensions.dart';

import '../../../../utils/app_colors.dart';



class FeedPageExpertOpinionWidget extends StatelessWidget {
  const FeedPageExpertOpinionWidget({
    Key? key,
    required this.jsonResponse2,
    required this.results,
  }) : super(key: key);

  final Map jsonResponse2;
  final Map results;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.responsive(120, axis: Axis.vertical),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: context.responsive(34, axis: Axis.vertical),
            child: Padding(
              padding:  EdgeInsets.only(
                left: 18.0,
                top:context.responsive(5, axis: Axis.vertical),
                bottom:context.responsive(5, axis: Axis.vertical),
              ),
              child: Text(
                "${jsonResponse2["opinion"]} Expert Opinion",
                style: TextStyle(
                    fontSize: context.responsive(18, axis: Axis.vertical),
                    fontWeight: FontWeight.bold,
                    color: AppColors.kFeedEndSectionUnselectedTab),
              ),
            ),
          ),
          Container(
            height: context.responsive(78, axis: Axis.vertical),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: context.responsive(78, axis: Axis.vertical),
                  child: Container(
                    width: context.responsive(77, axis: Axis.vertical),
                    height: context.responsive(77, axis: Axis.vertical),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      color: AppColors.kExpertOpinionCircleOuter
                          .withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(
                          context.responsive(10, axis: Axis.vertical)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: AppColors.kExpertOpinionCircleOuter
                              .withOpacity(0.1),
                        ),
                        child: Center(
                          child: Text(
                            "${jsonResponse2["yes"]}%",
                            style: TextStyle(
                                fontSize: context.responsive(15,
                                    axis: Axis.vertical),
                                fontWeight: FontWeight.bold,
                                color: AppColors.kExpertOpinionFont),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: List.generate(3, (index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical:
                          context.responsive(5, axis: Axis.vertical)),
                      child: Container(
                        width:
                        context.responsive(270, axis: Axis.horizontal),
                        height: context.responsive(13, axis: Axis.vertical),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: context.responsive(160,
                                  axis: Axis.horizontal),
                              height: context.responsive(6,
                                  axis: Axis.vertical),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(context
                                    .responsive(6, axis: Axis.vertical)),
                                color: AppColors.kExpertOpinionUnfilled,
                              ),
                              child: Container(
                                margin: EdgeInsets.only(right:context.responsive(160-(( (results.values.toList()[index][0])*160)/100) as double,
                                    axis: Axis.horizontal), ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      context.responsive(6,
                                          axis: Axis.vertical)),
                                  color: results.values.toList()[index][1],
                                ),
                              ),
                            ),
                            Container(
                              width: context.responsive(90,
                                  axis: Axis.horizontal),
                              child: Text("${results.keys.toList()[index]}",
                                  style: TextStyle(
                                      fontSize: context.responsive(11,
                                          axis: Axis.vertical),
                                      color: results.values.toList()[index][1])),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}