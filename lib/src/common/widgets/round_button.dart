import 'package:flutter/material.dart';
import 'package:s_bin/gen/colors.gen.dart';
import 'package:s_bin/src/common/app_tags.dart';
import 'package:s_bin/src/common/widgets/app_colors.dart';

class RoundButton extends StatelessWidget {
  final Function onClick;
  final String text;

  const RoundButton({
    super.key,
    required this.onClick,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 40),
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        //margin: const EdgeInsets.only(top: 20, bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.verdantGrn,
            boxShadow: const [
              BoxShadow(offset: Offset(0, 4), color: ColorName.dustyGray)
            ]),
        child: Center(
            child: Text(
          text,
          style: AppTags.font16weight500,
        )),
      ),
    );
  }
}
