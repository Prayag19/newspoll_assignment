import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newspoll/ui/utils/extensions.dart';
import '../../../../utils/app_colors.dart';
import 'research_widget.dart';
import 'expert_opinion.dart';

class FeedEndSectionResearch extends StatefulWidget {
  const FeedEndSectionResearch({
    Key? key,
  }) : super(key: key);

  @override
  State<FeedEndSectionResearch> createState() => _FeedEndSectionResearchState();
}

class _FeedEndSectionResearchState extends State<FeedEndSectionResearch> {
  List<Map> jsonResponse = [
    {
      "Name": "Thehill",
      "Date": "1 Sept",
      "Content":
          "Last week, the dire warnings that appeared in the Wall Street Journal, The Economist and Foreign Affairs about China's imminent war with or...",
    },
    {
      "Name": "BBC",
      "Date": "1 Sept",
      "Content":
          " Most people the BBC spoke to do not believe China is about to attack Taiwan.\"They're a bunch of gangsters,\" said one man fishing on the..."
    },
    {
      "Name": "Thehill",
      "Date": "1 Sept",
      "Content":
          "Last week, the dire warnings that appeared in the Wall Street Journal, The Economist and Foreign Affairs about China's imminent war with or...",
    },
  ];
  Map jsonResponse2 = {
    "opinion": 215,
    "yes": 12,
    "no": 88,
    "not_resolve": 1,
  };

  @override
  Widget build(BuildContext context) {
    Map results = {
      "${jsonResponse2["yes"]}% Buy Yes": [
        jsonResponse2["yes"],
        AppColors.kExpertOpinionFont
      ],
      "${jsonResponse2["no"]}% Buy No": [
        jsonResponse2["no"],
        AppColors.kFeedEndSectionUnselectedTab
      ],
      "${jsonResponse2["not_resolve"]}% No Resolve": [
        jsonResponse2["not_resolve"],
        AppColors.kFeedEndSectionUnselectedTab
      ],
    };

    return SingleChildScrollView(
      //physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      child: Container(
        height: context.responsive(225, axis: Axis.vertical),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FeedPageExpertOpinionWidget(
                jsonResponse2: jsonResponse2, results: results),
            ResearchNews(jsonResponse: jsonResponse)
          ],
        ),
      ),
    );
  }
}
