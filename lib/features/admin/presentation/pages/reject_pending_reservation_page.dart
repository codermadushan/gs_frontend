import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/enums/reservation_status.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/input_field.dart';
import '../../../../core/widgets/texts.dart';
import '../cubits/update_reservation_status/update_reservation_status_cubit.dart';
import '../widgets/reject_pending_reservation/reject_pending_reservation_button.dart';

class RejectPendingReservationPage extends StatefulWidget {
  const RejectPendingReservationPage({super.key});

  @override
  State<RejectPendingReservationPage> createState() =>
      _RejectPendingReservationPageState();
}

class _RejectPendingReservationPageState
    extends State<RejectPendingReservationPage> {
  late final UpdateReservationStatusCubit _updateReservationStatusCubit;

  late final int _reservationId;

  final _rejectionReasonController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _updateReservationStatusCubit = context
        .read<UpdateReservationStatusCubit>();
  }

  @override
  void dispose() {
    _rejectionReasonController.dispose();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _reservationId = ModalRoute.settingsOf(context)!.arguments as int;
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
        title: const AppTextH2('Reject reservation'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.pagePadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            InputField(
              controller: _rejectionReasonController,
              hintText: 'Rejection reason',
              textAlign: TextAlign.center,
              lines: 3,
            ),

            const SizedBox(height: AppSize.gapMedium),

            RejectPendingReservationButton(
              onPressed: () {
                _updateReservationStatusCubit.updateReservationStatusParams(
                  reservationId: _reservationId,
                  status: ReservationStatus.rejected,
                  rejectionReason: _rejectionReasonController.text.trim(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
