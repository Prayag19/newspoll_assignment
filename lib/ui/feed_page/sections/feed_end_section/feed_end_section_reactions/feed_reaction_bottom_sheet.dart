import 'package:flutter/material.dart';
import 'package:newspoll/ui/utils/extensions.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/bottom_sheet_tab.dart';
import '../../../../utils/imageAssetButton_widget.dart';

Future showBottom(Map jsonResponse, context) {
  return showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: MediaQuery.of(context).size.height*0.5,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                    context.responsive(8, axis: Axis.vertical))),
            child: Column(
              children: [
                const BottomSheetHandle(),
                SizedBox(
                  height: context.responsive(4, axis: Axis.vertical),
                ),
                const BottomSheetTitle(
                  titlelabel: 'Reactions',
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.responsive(12, axis: Axis.horizontal),
                      vertical: context.responsive(8, axis: Axis.vertical)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const BottomSheetTabs(
                        selectedIndex: 0,
                        position: 0,
                        label: "Top",
                      ),
                      SizedBox(
                        width: context.responsive(8, axis: Axis.horizontal),
                      ),
                      const BottomSheetTabs(
                        selectedIndex: 0,
                        position: 1,
                        label: "Newest",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.responsive(8, axis: Axis.vertical),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.kOffWhiteF8F8F8,
                      border: Border.all(color: Colors.black12, width: 1)),
                  width: MediaQuery.of(context).size.width,
                  height: context.responsive(50, axis: Axis.vertical),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.responsive(12, axis: Axis.horizontal),
                        vertical: context.responsive(8, axis: Axis.vertical)),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text:
                                "Remember to keep comments respectful and to follow our ",
                            style: TextStyle(
                                fontSize:
                                    context.responsive(11, axis: Axis.vertical),
                                color: Colors.black87)),
                        TextSpan(
                            text: "Community Guidelines",
                            style: TextStyle(
                                fontSize:
                                    context.responsive(11, axis: Axis.vertical),
                                color: Colors.blue)),
                      ]),
                    ),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: context.responsive(50, axis: Axis.vertical),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                context.responsive(12, axis: Axis.horizontal),
                            vertical: context.responsive(4, axis: Axis.vertical)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: context.responsive(40, axis: Axis.vertical),
                              width: context.responsive(40, axis: Axis.vertical),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          jsonResponse["profileAvatar"]))),
                            ),
                            SizedBox(
                              width: context.responsive(5, axis: Axis.horizontal),
                            ),
                            Container(
                              height: context.responsive(40, axis: Axis.vertical),
                              width: MediaQuery.of(context).size.width * 0.6,

                              //  context.responsive(260, axis: Axis.vertical),
                              child: TextField(
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: context.responsive(12,
                                        axis: Axis.vertical)),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: context.responsive(5,
                                            axis: Axis.vertical)),
                                    hintText: "Add comment..",
                                    hintStyle: TextStyle(
                                        fontSize: context.responsive(12,
                                            axis: Axis.vertical)),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none)),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: context.responsive(1, axis: Axis.vertical),
                              ),
                            ),
                            const ImageAssetButton(
                                iAsset: AppIcons.icReactionOpinionCommentsAdd,
                                iColor: AppColors.k687684,
                                iHeight: 15,
                                iWidth: 15)
                          ],
                        ))),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 1)),
                    child: ListView(
                      children:
                          List.generate(jsonResponse["users"].length, (index) {
                        return Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    context.responsive(12, axis: Axis.horizontal),
                                vertical:
                                    context.responsive(4, axis: Axis.vertical)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      context.responsive(25, axis: Axis.vertical),
                                  width:
                                      context.responsive(25, axis: Axis.vertical),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(context
                                          .responsive(25, axis: Axis.vertical)),
                                      image: DecorationImage(
                                          image: AssetImage(jsonResponse["users"]
                                              [index]["profileAvatar"]))),
                                ),
                                SizedBox(
                                  width: context.responsive(8,
                                      axis: Axis.horizontal),
                                ),
                                Expanded(
                                    child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        jsonResponse["users"][index]["name"] +
                                            " . " +
                                            jsonResponse["users"][index]["time"]
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: context.responsive(13,
                                                axis: Axis.vertical),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: context.responsive(2,
                                            axis: Axis.vertical),
                                      ),
                                      Text(
                                        jsonResponse["users"][index]["comment"],
                                        style: TextStyle(
                                          fontSize: context.responsive(13,
                                              axis: Axis.vertical),
                                        ),
                                      ),
                                      SizedBox(
                                        height: context.responsive(4,
                                            axis: Axis.vertical),
                                      ),
                                      Row(
                                        children: [
                                          const ImageAssetButton(
                                              iAsset: AppIcons
                                                  .icReactionOpinionCommentsLike,
                                              iColor: AppColors.k687684,
                                              iHeight: 15,
                                              iWidth: 15),
                                          SizedBox(
                                            width: context.responsive(10,
                                                axis: Axis.horizontal),
                                          ),
                                          const ImageAssetButton(
                                              iAsset: AppIcons
                                                  .icReactionOpinionCommentsDislike,
                                              iColor: AppColors.k687684,
                                              iHeight: 15,
                                              iWidth: 15),
                                          SizedBox(
                                            width: context.responsive(10,
                                                axis: Axis.horizontal),
                                          ),
                                          const ImageAssetButton(
                                              iAsset: AppIcons
                                                  .icReactionOpinionCommentsLove,
                                              iColor: AppColors.k687684,
                                              iHeight: 15,
                                              iWidth: 15),
                                        ],
                                      ),
                                      SizedBox(
                                        height: context.responsive(6,
                                            axis: Axis.vertical),
                                      ),
                                      Text(
                                        jsonResponse["users"][index]
                                                ["replies_count"] +
                                            " Replies",
                                        style: TextStyle(
                                            fontSize: context.responsive(13,
                                                axis: Axis.vertical),
                                            color: Colors.blue),
                                      ),
                                      SizedBox(
                                        height: context.responsive(8,
                                            axis: Axis.vertical),
                                      ),
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}
