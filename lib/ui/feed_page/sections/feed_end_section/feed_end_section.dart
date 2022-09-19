import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newspoll/ui/utils/extensions.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constant.dart';
import 'feed_end_section_research/research_section.dart';
import 'feed_end_section_reactions/feed_end_section_reactions.dart';
import 'feed_end_section_related/feed_end_section_related.dart';



class FeedPageEndSection extends StatefulWidget {
  const FeedPageEndSection({
    Key? key,
  }) : super(key: key);

  @override
  State<FeedPageEndSection> createState() => _FeedPageEndSectionState();
}

class _FeedPageEndSectionState extends State<FeedPageEndSection> {
  List tabs = ["Research & News", "Reactions", "Related"];
  int selectedTab = 0;
  List<Widget> tabSections = [
    FeedEndSectionResearch(),
    FeedEndReaction(),
    FeedEndRelated()
  ];
  late PageController _pageController;

  double getTextWidth(String text, TextStyle style) {
    TextPainter textPainter = TextPainter()
      ..text = TextSpan(text: text, style: style)
      ..textDirection = TextDirection.ltr
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.width;
  }
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: context.responsive(270, axis: Axis.vertical),
      // color: Colors.red,
      child: Column(
        children: [
          Container(
            height: context.responsive(45, axis: Axis.vertical),
            color: Colors.white,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  tabs.length,
                      (index) => InkWell(
                    onTap: () {
                      _pageController.animateToPage(index,
                          duration: AppConstants.animationDuration,
                          curve: Curves.fastOutSlowIn);
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 1,
                          ),
                          Text(
                            tabs[index],
                            style: TextStyle(
                                fontSize: context.responsive(16,
                                    axis: Axis.vertical),
                                fontWeight: FontWeight.bold,
                                color: (index == selectedTab)
                                    ? AppColors.kFeedEndSectionSelectedTab
                                    : AppColors
                                    .kFeedEndSectionUnselectedTab),
                          ),
                          Container(
                            height: context.responsive(2,
                                axis: Axis.vertical),
                            width: context.responsive(getTextWidth(tabs[index],TextStyle(
                                fontSize: context.responsive(16,
                                    axis: Axis.vertical),
                                fontWeight: FontWeight.bold,
                                color: (index == selectedTab)
                                    ? AppColors.kFeedEndSectionSelectedTab
                                    : AppColors
                                    .kFeedEndSectionUnselectedTab)),
                                axis: Axis.vertical),
                            color: (index == selectedTab)
                                ? AppColors.kFeedEndSectionSelectedTab
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ),
          Container(
            height: context.responsive(225, axis: Axis.vertical),
            child: PageView(
              controller: _pageController,
              children: tabSections,
              onPageChanged: (value) {
                selectedTab = value;
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }
}





