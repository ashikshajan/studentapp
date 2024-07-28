import 'package:flutter/material.dart';
import 'package:studentapp/utils/app_utils.dart';

class CommonlistWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color clr;

  final String trailingCount;
  final String trailinghead;
  final bool isTrailingColumn;

  final Function? onTap;

  const CommonlistWidget({
    super.key,
    required this.title,
    required this.trailingCount,
    required this.trailinghead,
    required this.isTrailingColumn,
    required this.subtitle,
    required this.clr,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap == null ? () {} : () => onTap!(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          trailing: !isTrailingColumn
              ? Text("$trailinghead $trailingCount",
                  style: textStyle(font: 22.0, ftWeight: FontWeight.w400))
              : Column(
                  children: [
                    Text(trailingCount,
                        style:
                            textStyle(font: 22.0, ftWeight: FontWeight.w400)),
                    Text(trailinghead,
                        style: textStyle(font: 22.0, ftWeight: FontWeight.w400))
                  ],
                ),
          tileColor: clr.withOpacity(0.6),
          title: Text(title,
              style: textStyle(font: 20.0, ftWeight: FontWeight.w500)),
          subtitle: Text(subtitle,
              style: textStyle(font: 17.0, ftWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}
