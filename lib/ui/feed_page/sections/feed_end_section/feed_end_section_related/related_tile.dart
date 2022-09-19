import 'package:flutter/material.dart';
import 'package:newspoll/ui/utils/extensions.dart';

class RelatedSectionTile extends StatelessWidget {
  const RelatedSectionTile({
    Key? key,
    required this.data,
    required this.index
  }) : super(key: key);

  final List data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.responsive(8, axis: Axis.vertical),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
                context.responsive(12, axis: Axis.vertical)),
            border: Border.all(color: Colors.black12.withOpacity(0.03))),
        height: context.responsive(69, axis: Axis.vertical),
        child: Row(
          children: [
            Container(
              height:
              context.responsive(69, axis: Axis.vertical),
              width:
              context.responsive(69, axis: Axis.vertical),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(context
                        .responsive(15, axis: Axis.vertical)),
                    bottomLeft: Radius.circular(
                      context.responsive(15,
                          axis: Axis.vertical),
                    )),
                image: DecorationImage(
                    image: AssetImage(data[index]["image"]),
                    fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.responsive(10,
                      axis: Axis.horizontal),
                  vertical: context.responsive(4,
                      axis: Axis.vertical),
                ),
                child: Text(
                  data[index]["content"],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: context.responsive(18,
                        axis: Axis.vertical),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}