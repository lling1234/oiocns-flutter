import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orginone/dart/core/target/base/target.dart';
import 'package:orginone/widget/common_widget.dart';


class Item extends StatelessWidget {
  final ITarget choicePeople;

  final VoidCallback? next;

  final ValueChanged? onChanged;

  final ITarget? selected;

  const Item(
      {Key? key,
      required this.choicePeople,
      this.next,
      this.onChanged,
      this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade200, width: 0.5)),
        ),
        child: Row(
          children: [
            Expanded(
              child: CommonWidget.commonRadioTextWidget(
                choicePeople.metadata.name ?? "",
                choicePeople,
                groupValue: selected,
                onChanged: (v) {
                  // choicePeople.isSelected = !choicePeople.isSelected;
                  if (onChanged != null) {
                    onChanged!(v);
                  }
                },
              ),
            ),
            GestureDetector(
              onTap: next,
              child: Icon(
                Icons.navigate_next,
                size: 32.w,
              ),
            )
          ],
        ),
      ),
    );
  }
}
