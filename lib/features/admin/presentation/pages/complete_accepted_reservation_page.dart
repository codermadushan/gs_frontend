import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/enums/reservation_status.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/input_field.dart';
import '../../../../core/widgets/texts.dart';
import '../cubits/update_reservation_status/update_reservation_status_cubit.dart';
import '../widgets/complete_accepted_reservation/complete_accepted_reservation_button.dart';

class CompleteAcceptedReservationPage extends StatefulWidget {
  const CompleteAcceptedReservationPage({super.key});

  @override
  State<CompleteAcceptedReservationPage> createState() =>
      _CompleteAcceptedReservationPageState();
}

class _CompleteAcceptedReservationPageState
    extends State<CompleteAcceptedReservationPage> {
  late final UpdateReservationStatusCubit _updateReservationStatusCubit;

  late final int _reservationId;

  final _formKey = GlobalKey<FormState>();

  final _finalPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _updateReservationStatusCubit = context
        .read<UpdateReservationStatusCubit>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _reservationId = ModalRoute.settingsOf(context)!.arguments as int;
  }

  @override
  void dispose() {
    _finalPriceController.dispose();

    super.dispose();
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
        title: const AppTextH2('Complete reservation'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.pagePadding),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              InputField(
                controller: _finalPriceController,
                hintText: 'Final price',
                textAlign: TextAlign.center,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (input) {
                  if (input == null || input.isEmpty) {
                    return 'Final price is required';
                  }

                  return null;
                },
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: AppSize.gapMedium),

              CompleteAcceptedReservationButton(
                onPressed: () {
                  final valid = _formKey.currentState!.validate();
                  if (!valid) return;

                  _updateReservationStatusCubit.updateReservationStatusParams(
                    reservationId: _reservationId,
                    status: ReservationStatus.completed,
                    finalPrice: int.parse(_finalPriceController.text.trim()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
