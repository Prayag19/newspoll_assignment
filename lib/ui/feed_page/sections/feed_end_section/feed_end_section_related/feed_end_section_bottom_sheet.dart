import 'package:flutter/material.dart';
import 'package:newspoll/ui/feed_page/sections/feed_end_section/feed_end_section_related/related_tile.dart';
import 'package:newspoll/ui/utils/extensions.dart';

import '../../../../utils/bottom_sheet_tab.dart';

Future showRelatedBottom(data, context) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
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
                titlelabel: 'Related',
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
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 1)),
                  child: ListView(
                    children: List.generate(data.length, (index) {
                      return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                context.responsive(16, axis: Axis.horizontal),
                            vertical:
                                context.responsive(8, axis: Axis.vertical),
                          ),
                          child: RelatedSectionTile(
                            data: data,
                            index: index,
                          ));
                    }),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
