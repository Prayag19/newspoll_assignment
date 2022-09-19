import 'package:flutter/material.dart';
import 'package:newspoll/ui/feed_page/sections/feed_end_section/feed_end_section_related/related_tile.dart';
import 'package:newspoll/ui/utils/extensions.dart';

import 'feed_end_section_bottom_sheet.dart';

class FeedEndRelated extends StatefulWidget {
  const FeedEndRelated({Key? key}) : super(key: key);

  @override
  State<FeedEndRelated> createState() => _FeedEndRelatedState();
}

class _FeedEndRelatedState extends State<FeedEndRelated> {
  List<Map> jsonResponse = [
    {
      "image": "assets/images/related_image_1.png",
      "content": """ Liz Truss will be UK’s next Prime Minister?""",
    },
    {
      "image": "assets/images/related_iamge_2.png",
      "content": """British Pound will fall after Prime Minister elections?""",
    },
    {
      "image": "assets/images/related_image_3.png",
      "content": """British Railway Strikes will end by before Sept. 2022?""",
    },
  ];
  List data = [];

  @override
  Widget build(BuildContext context) {
    data.addAll(jsonResponse);
    data.addAll(jsonResponse);
    return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onVerticalDragUpdate: (s) {
            if (s.delta.dy < 0) {
              print(s.delta.dy);
              showRelatedBottom(data, context);
            }
          },
          child: Container(
            height: context.responsive(220, axis: Axis.vertical),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.responsive(16, axis: Axis.horizontal),
                vertical: context.responsive(4, axis: Axis.vertical),
              ),
              child: Column(
                children: [
                  Container(
                    height: context.responsive(171, axis: Axis.vertical),
                    child: ListView(
                      children: List.generate(2, (index) {
                        return InkWell(
                          onTap: () {
                            showRelatedBottom(data, context);
                          },
                          child: RelatedSectionTile(
                            data: data,
                            index: index,
                          ),
                        );
                      }),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          showRelatedBottom(data, context);
                        },
                        child: Text("...more",
                            style: TextStyle(
                                fontSize:
                                    context.responsive(13, axis: Axis.vertical),
                                color: Colors.black38)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
