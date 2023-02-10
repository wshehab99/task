import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/presentation/resources/size_manger.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar(
      {super.key,
      this.currentIndex = 0,
      required this.onTap,
      required this.icons});
  final int currentIndex;
  final List<String> icons;
  final void Function(int index) onTap;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 7,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: SizeManager.s7),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          for (int i = 0; i < icons.length; i++)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (currentIndex == i)
                  Container(
                    height: SizeManager.s3,
                    width: SizeManager.s25,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2)),
                  ),
                IconButton(
                  onPressed: () {
                    onTap(i);
                  },
                  icon: SvgPicture.asset(icons[i]),
                ),
              ],
            )
        ]),
      ),
    );
  }
}
