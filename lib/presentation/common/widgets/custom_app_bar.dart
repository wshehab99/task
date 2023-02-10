import 'package:flutter/material.dart';
import 'package:task/presentation/common/widgets/search_text_field.dart';

import '../../resources/size_manger.dart';
import '../../resources/string_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: SizeManager.s51,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeManager.s57),
          child: Row(
            children: [
              Text(
                StringManager.home,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.notifications))
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeManager.s33),
          child: SearchTextField(),
        ),
      ],
    );
  }
}
