import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newspoll/ui/utils/extensions.dart';

import '../../../../utils/app_icons.dart';



class ResearchNews extends StatelessWidget {
  const ResearchNews({
    Key? key,
    required this.jsonResponse,
  }) : super(key: key);

  final List<Map> jsonResponse;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.responsive(105, axis: Axis.vertical),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(jsonResponse.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black12)),
              width: context.responsive(200, axis: Axis.horizontal),
              height: context.responsive(88, axis: Axis.vertical),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: context.responsive(30, axis: Axis.vertical),
                    margin: EdgeInsets.symmetric(
                        horizontal:
                        context.responsive(8, axis: Axis.horizontal)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: context.responsive(6, axis: Axis.vertical)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            jsonResponse[index]["Name"],
                            style: TextStyle(
                                fontSize:
                                context.responsive(11, axis: Axis.vertical),
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                          Text(
                            jsonResponse[index]["Date"],
                            style: TextStyle(
                                fontSize:
                                context.responsive(11, axis: Axis.vertical),
                                color: Colors.black54),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                      width: context.responsive(180, axis: Axis.horizontal),
                      height: context.responsive(48, axis: Axis.vertical),
                      child: Text(jsonResponse[index]["Content"],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: TextStyle(
                            fontSize:
                            context.responsive(9.5, axis: Axis.vertical),
                          ))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {},
                          child: Container(
                              width:
                              context.responsive(20, axis: Axis.horizontal),
                              height:
                              context.responsive(20, axis: Axis.vertical),
                              child:  const ImageIcon(
                                AssetImage(
                                    AppIcons.icFeedEndSectionRightBendArrow),
                                color: Colors.black,
                              )))
                    ],
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}