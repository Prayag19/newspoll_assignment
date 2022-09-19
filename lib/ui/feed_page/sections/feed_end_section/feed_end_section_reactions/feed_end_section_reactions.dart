import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newspoll/ui/utils/app_colors.dart';
import 'package:newspoll/ui/utils/app_icons.dart';
import 'package:newspoll/ui/utils/extensions.dart';
import 'package:newspoll/ui/utils/imageAssetButton_widget.dart';

import 'feed_reaction_bottom_sheet.dart';

class FeedEndReaction extends StatefulWidget {
  const FeedEndReaction({Key? key}) : super(key: key);

  @override
  State<FeedEndReaction> createState() => _FeedEndReactionState();
}

class _FeedEndReactionState extends State<FeedEndReaction> {
  Map jsonResponse = {
    "username": "user",
    "profileAvatar": "assets/images/user.png",
    "opinion": "215",
    "comments": "95K",
    "users": [
      {
        "name": "Linda",
        "profileAvatar": "assets/images/linda_avatar.png",
        "time": "1h ago",
        "comment":
            """If China does indeed attack Taiwan soon, October is the likely time since the Taiwan Strait waters will be calm, facilitating amphibious operations. The drills around Taiwan allowed China to build up forces in Fujian, which is part of what's needed before an invasion.""",
        "replies_count": "5",
        "like_count": "0",
        "dislike_count": "0",
      },
      {
        "name": "TomBN",
        "profileAvatar": "assets/images/tombn_avatar.png",
        "time": "3h ago",
        "comment":
            """I will be surprised if #China will in fact attack Taiwan. Doing so requires lots of courage, which China lacks.""",
        "replies_count": "0",
        "like_count": "0",
        "dislike_count": "0",
      },
      {
        "name": "Prof.alison",
        "time": "1h ago",
        "profileAvatar": "assets/images/linda_avatar.png",
        "comment":
            """If China does indeed attack Taiwan soon, October is the likely time since the Taiwan Strait waters will be calm, facilitating amphibious operations. The drills around Taiwan allowed China to build up forces in Fujian, which is part of what's needed before an invasion.""",
        "replies_count": "5",
        "like_count": "0",
        "dislike_count": "0",
      },
      {
        "name": "Prof.alison",
        "time": "9h ago",
        "profileAvatar": "assets/images/proalison.png",
        "comment":
            """The Pentagon has not changed its assessment that China is not planning to invade Taiwan in the next two years, the Defense Department’s top policy office said Monday, despite Beijing’s launching unprecedented military drills around the island last week. In answer to a question about whether the military has a new assessment as to whether China will take Taiwan by force in the next two years given the events of the last week, Colin Kahl, the undersecretary of defense for policy, said succinctly: “No.”.""",
        "replies_count": "5",
        "like_count": "0",
        "dislike_count": "0",
      },
      {
        "name": "Pik",
        "time": "9h ago",
        "profileAvatar": "assets/images/pik.png",
        "comment":
            """More Australians think that China will attack Australia than Taiwanese believe China will attack Taiwan.""",
        "replies_count": "1",
        "like_count": "0",
        "dislike_count": "0",
      },
      {
        "name": "David",
        "time": "1d ago",
        "profileAvatar": "assets/images/david.png",
        "comment": """scary things going on in the world.""",
        "replies_count": "1",
        "like_count": "0",
        "dislike_count": "0",
      },
    ],
  };
  final TextEditingController _addComment = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:
          const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onVerticalDragUpdate: (s){
          if(s.delta.dy<0){
            showBottom(jsonResponse, context);
          }
        },
        child: Container(
          height: context.responsive(220, axis: Axis.vertical),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: context.responsive(220, axis: Axis.vertical),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.responsive(16, axis: Axis.horizontal),
                    vertical: context.responsive(4, axis: Axis.vertical),
                  ),
                  child: Column(
                    children: [
                      buildReactionOpinionButtons(context),
                      Column(
                        children: List.generate(2, (index) {
                          return InkWell(
                            onTap: () {
                              showBottom(jsonResponse, context);
                            },
                            child: buildReactionTile(context, index),
                          );
                        }),
                      ),
                      SizedBox(
                          height: context.responsive(
                        5,
                        axis: Axis.vertical,
                      )),
                      buildTextFieldAddComment(context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildReactionOpinionButtons(BuildContext context) {
    return Container(
                    height: context.responsive(45, axis: Axis.vertical),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              context.responsive(4, axis: Axis.horizontal),
                          vertical:
                              context.responsive(4, axis: Axis.vertical)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: context.responsive(100,
                                    axis: Axis.horizontal),
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    const ImageAssetButton(
                                        iAsset: AppIcons.icReactionOpinion,
                                        iColor: AppColors.k687684,
                                        iHeight: 24,
                                        iWidth: 24),
                                    SizedBox(
                                      width: context.responsive(4,
                                          axis: Axis.horizontal),
                                    ),
                                    Text(jsonResponse["opinion"],
                                        style: TextStyle(
                                            fontSize: context.responsive(12,
                                                axis: Axis.vertical)))
                                  ],
                                ),
                              ),
                              Container(
                                width: context.responsive(100,
                                    axis: Axis.horizontal),
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    const ImageAssetButton(
                                        iAsset: AppIcons
                                            .icReactionOpinionComments,
                                        iColor: AppColors.k687684,
                                        iHeight: 24,
                                        iWidth: 24),
                                    SizedBox(
                                      width: context.responsive(4,
                                          axis: Axis.horizontal),
                                    ),
                                    Text(jsonResponse["comments"],
                                        style: TextStyle(
                                            fontSize: context.responsive(12,
                                                axis: Axis.vertical)))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              //  print("pressed");
                              showBottom(jsonResponse, context);
                            },
                            child: const ImageAssetButton(
                                iAsset: AppIcons.icReactionOpinionMore,
                                iColor: AppColors.k687684,
                                iHeight: 24,
                                iWidth: 24),
                          )
                        ],
                      ),
                    ),
                  );
  }

  Container buildReactionTile(BuildContext context, int index) {
    return Container(
                            height:
                                context.responsive(55, axis: Axis.vertical),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: context.responsive(4,
                                    axis: Axis.vertical),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: context.responsive(34,
                                        axis: Axis.vertical),
                                    width: context.responsive(34,
                                        axis: Axis.vertical),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10000),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              jsonResponse["users"][index]
                                                      ["profileAvatar"]
                                                  .toString()),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  SizedBox(
                                    width: context.responsive(4,
                                        axis: Axis.horizontal),
                                  ),
                                  Expanded(
                                    child: RichText(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: jsonResponse["users"][index]
                                                    ["name"]
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: context.responsive(
                                                    13,
                                                    axis: Axis.vertical))),
                                        TextSpan(text: "  "),
                                        TextSpan(
                                          text: jsonResponse["users"][index]
                                                  ["comment"]
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: context.responsive(13,
                                                axis: Axis.vertical),
                                          ),
                                        ),
                                        TextSpan(
                                         text: "...more",
                                          style: TextStyle(
                                            color: Colors.black26,
                                            fontSize: context.responsive(13,
                                                axis: Axis.vertical),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  )
                                ],
                              ),
                            ));
  }

  Container buildTextFieldAddComment(BuildContext context) {
    return Container(
                    height: context.responsive(50, axis: Axis.vertical),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              context.responsive(4, axis: Axis.horizontal),
                          vertical:
                              context.responsive(2, axis: Axis.vertical)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height:
                                context.responsive(48, axis: Axis.vertical),
                            width: context.responsive(200,
                                axis: Axis.horizontal),
                            child: TextField(
                              maxLines: 1,
                              controller: _addComment,
                              style: TextStyle(
                                  fontSize: context.responsive(12,
                                      axis: Axis.vertical)),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: context.responsive(5,
                                          axis: Axis.vertical)),
                                  hintText: "Add comment..",
                                  hintStyle: TextStyle(
                                      fontSize: context.responsive(16,
                                          axis: Axis.vertical)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _addComment.text = "${_addComment.text} 😍";
                              setState(() {});
                            },
                            child: Text(
                              "😍",
                              style: TextStyle(
                                  fontSize: context.responsive(16,
                                      axis: Axis.vertical)),
                            ),
                          ),
                          SizedBox(
                            width: context.responsive(5, axis: Axis.vertical),
                          ),
                          InkWell(
                            onTap: () {
                              _addComment.text = "${_addComment.text} 😭";
                              setState(() {});
                            },
                            child: Text(
                              "😭",
                              style: TextStyle(
                                  fontSize: context.responsive(16,
                                      axis: Axis.vertical)),
                            ),
                          ),
                          SizedBox(
                            width: context.responsive(5, axis: Axis.vertical),
                          ),
                          const ImageAssetButton(
                              iAsset: AppIcons.icReactionOpinionCommentsAdd,
                              iColor: AppColors.k687684,
                              iHeight: 16,
                              iWidth: 16)
                        ],
                      ),
                    ),
                  );
  }
}
