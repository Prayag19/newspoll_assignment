import 'package:flutter/material.dart';
import 'package:newspoll/ui/utils/extensions.dart';

class ImageAssetButton extends StatelessWidget {
  final String iAsset;
  final Color iColor;
  final double iWidth;
  final double iHeight;


  const ImageAssetButton({
    Key? key,
    required this.iAsset,
    required this.iColor,
    required this.iHeight,
    required this.iWidth
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.responsive(iWidth,
            axis: Axis.horizontal),
        height: context.responsive(iHeight,
            axis: Axis.vertical),
        child:  ImageIcon(
          AssetImage(iAsset),
          color: iColor,
        ));
  }
}