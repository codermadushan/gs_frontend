import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/input_field.dart';
import '../../../../core/widgets/texts.dart';
import '../cubits/new_status_message_cubit.dart';
import '../widgets/color_circles.dart';
import '../widgets/update_message_button.dart';

class UpdateMessagePage extends StatefulWidget {
  const UpdateMessagePage({super.key});

  @override
  State<UpdateMessagePage> createState() => _UpdateMessagePageState();
}

class _UpdateMessagePageState extends State<UpdateMessagePage> {
  late final NewStatusMessageCubit _newStatusMessageCubit;

  @override
  void initState() {
    super.initState();

    _newStatusMessageCubit = context.read<NewStatusMessageCubit>();
    _newStatusMessageCubit.clear();
  }

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
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () async {
                await Navigator.maybePop(context);
              },
            ),
          ),
        ),

        title: const AppTextH2('Update Note'),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.pagePadding),

        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: .min,
              children: [
                const SizedBox(height: AppSize.gapLarge),

                InputField(
                  lines: 3,
                  onChanged: (message) {
                    _newStatusMessageCubit.updateMessage(message);
                  },
                  hintText: 'Enter note here',
                  textAlign: .center,
                ),

                const SizedBox(height: AppSize.gapSmall),

                const ColorCircles(),

                const SizedBox(height: AppSize.gapLarge),

                const UpdateMessageButton(),

                const SizedBox(height: AppSize.gapLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
