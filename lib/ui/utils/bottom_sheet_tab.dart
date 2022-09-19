import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_icons.dart';
import 'extensions.dart';
import 'imageAssetButton_widget.dart';

class BottomSheetTabs extends StatelessWidget {
  final String label;
  final int position;
  final int selectedIndex;
  const BottomSheetTabs({
    Key? key,
    required this.position,
    required this.selectedIndex,
    required this.label
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.responsive(28, axis: Axis.vertical),
      width: getTextWidth(
          label,
          TextStyle(
              fontSize: context.responsive(18,
                  axis: Axis.vertical),
              color: Colors.white,
              fontWeight: FontWeight.bold)) +
          context.responsive(25, axis: Axis.horizontal),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              context.responsive(20, axis: Axis.vertical)),
          color:(position==selectedIndex)? AppColors.k2B2828: AppColors.k7D7D7D),
      child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontSize:
                context.responsive(18, axis: Axis.vertical),
                color: Colors.white,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}



class BottomSheetTitle extends StatelessWidget {
  final String titlelabel;
  const BottomSheetTitle({
    Key? key,
    required this.titlelabel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.responsive(12, axis: Axis.horizontal),
          vertical: context.responsive(2, axis: Axis.vertical)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titlelabel,
            style: TextStyle(
                fontSize: context.responsive(20, axis: Axis.vertical),
                color: AppColors.k687684,
                fontWeight: FontWeight.bold),
          ),
          InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child:const ImageAssetButton(
                  iAsset: AppIcons.icCloseModalSheet,
                  iColor: Colors.black,
                  iHeight: 26,
                  iWidth: 26))
        ],
      ),
    );
  }
}

class BottomSheetHandle extends StatelessWidget {
  const BottomSheetHandle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.responsive(12, axis: Axis.horizontal),
            vertical: context.responsive(8, axis: Axis.vertical)),
        child: Center(
            child: Container(
                width: context.responsive(80, axis: Axis.horizontal),
                child: Image(
                    image: AssetImage(
                        "assets/images/modalSheetHandle.png")))));
  }
}