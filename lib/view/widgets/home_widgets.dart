import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:studentapp/utils/app_utils.dart';

class CategoryCardGrid extends StatelessWidget {
  final String icon;
  final String label;
  final Color clr;

  final Function? onTap;

  const CategoryCardGrid({
    super.key,
    required this.icon,
    required this.label,
    required this.clr,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap == null ? () {} : () => onTap!(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: AppUtil.screensize(context).width / 2.3,
          height: AppUtil.screensize(context).height / 3.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Card(
            color: clr,
            margin: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 7,
            child: buildContent(),
          ),
        ),
      ),
    );
  }

  buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          assetSvg("$icon.svg"),
          height: 60,
        ),
        const SizedBox(
          height: 30,
        ),
        FittedBox(
          child: Text(
            label,
            style: textStyle(
                clr: Colors.black, ftWeight: FontWeight.w500, font: 22.0),
          ),
        ),
      ],
    );
  }
}

class CategoryCardList extends StatelessWidget {
  final String label;
  final Color clr;

  final Function? onTap;

  const CategoryCardList({
    super.key,
    required this.label,
    required this.clr,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap == null ? () {} : () => onTap!(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 50, 8, 8),
        child: Container(
          height: 55,
          width: AppUtil.screensize(context).width,
          decoration: BoxDecoration(
            color: clr,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              label,
              style: textStyle(
                  clr: Colors.black, ftWeight: FontWeight.w500, font: 22.0),
            ),
          ),
        ),
      ),
    );
  }
}
