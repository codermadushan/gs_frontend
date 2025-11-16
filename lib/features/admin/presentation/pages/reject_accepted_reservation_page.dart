import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/enums/reservation_status.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/input_field.dart';
import '../../../../core/widgets/texts.dart';
import '../cubits/update_reservation_status/update_reservation_status_cubit.dart';
import '../widgets/reject_accepted_reservation/reject_accepted_reservation_button.dart';

class RejectAcceptedReservationPage extends StatefulWidget {
  const RejectAcceptedReservationPage({super.key});

  @override
  State<RejectAcceptedReservationPage> createState() =>
      _RejectAcceptedReservationPageState();
}

class _RejectAcceptedReservationPageState
    extends State<RejectAcceptedReservationPage> {
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
              icon: const Icon(FontAwesomeIcons.arrowLeft),
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
          spacing: AppSize.gapMedium,
          children: [
            InputField(
              controller: _rejectionReasonController,
              lines: 3,
              hintText: 'Rejection reason',
              textAlign: TextAlign.center,
            ),

            RejectAcceptedReservationButton(
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
