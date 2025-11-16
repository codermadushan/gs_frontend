import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_media.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/constants/app_style.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/texts.dart';

class AppInformationPage extends StatelessWidget {
  static const _avatarSize = 80.0;

  const AppInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: AppSize.pagePadding),
          child: Center(
            child: AppIconButton(
              backgroundColor: AppColor.foreground,
              foregroundColor: AppColor.background,
              icon: const Icon(FontAwesomeIcons.arrowLeft),
              onPressed: () async {
                await Navigator.maybePop(context);
              },
            ),
          ),
        ),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.pagePadding),
          child: AppCard(
            padding: const EdgeInsets.all(AppSize.pagePadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: AppSize.pagePadding,
                  children: [
                    Container(
                      width: _avatarSize,
                      height: _avatarSize,
                      decoration: BoxDecoration(
                        color: AppColor.muted,
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage(AppMedia.developerImage),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(color: AppColor.foreground),
                      ),
                    ),

                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: AppStyle.h5.copyWith(
                            color: AppColor.mutedForeground,
                          ),
                          text: 'Developed by\n',
                          children: const [
                            TextSpan(
                              text: 'Madushan Wijewardhana',
                              style: AppStyle.h4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const Divider(
                  height: AppSize.pagePadding * 2,
                  color: AppColor.border,
                ),

                const SizedBox(height: AppSize.pagePadding),

                const Row(
                  spacing: AppSize.pagePadding,
                  children: [
                    Icon(FontAwesomeIcons.phone, color: AppColor.success),

                    AppTextH5('+94 76 226 7979'),
                  ],
                ),

                const SizedBox(height: AppSize.pagePadding),

                const Row(
                  spacing: AppSize.pagePadding,
                  children: [
                    Icon(
                      FontAwesomeIcons.solidEnvelope,
                      color: AppColor.cardForeground,
                    ),

                    AppTextH5('codermadushan@gmail.com'),
                  ],
                ),

                const SizedBox(height: AppSize.pagePadding),

                const Row(
                  spacing: AppSize.pagePadding,
                  children: [
                    Icon(
                      FontAwesomeIcons.github,
                      color: AppColor.accentForeground,
                    ),

                    AppTextH5('@codermadushan'),
                  ],
                ),

                const SizedBox(height: AppSize.pagePadding),

                const Divider(
                  height: AppSize.pagePadding * 2,
                  color: AppColor.border,
                ),

                const AppTextBody(
                  '© 2025 Madushan Wijewardhana. All rights reserved',
                  textAlign: TextAlign.center,
                  color: AppColor.mutedForeground,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
