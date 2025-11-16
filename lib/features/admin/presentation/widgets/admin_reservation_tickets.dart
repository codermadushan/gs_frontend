import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../domain/entities/admin_reservation_entity.dart';
import 'admin_reservation_ticket.dart';

class AdminReservationTickets extends StatelessWidget {
  final List<AdminReservationEntity> _reservations;
  final AsyncCallback _onRefresh;
  final String _navigateOnTap;

  const AdminReservationTickets({
    super.key,
    required List<AdminReservationEntity> reservations,
    required String navigateOnTap,
    required AsyncCallback onRefresh,
  }) : _reservations = reservations,
       _onRefresh = onRefresh,
       _navigateOnTap = navigateOnTap;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      backgroundColor: AppColor.foreground,
      color: AppColor.background,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: AppSize.gapLarge),
        separatorBuilder: (context, index) {
          return const SizedBox(height: AppSize.pagePadding);
        },

        itemCount: _reservations.length,
        itemBuilder: (context, index) {
          final reservation = _reservations[index];

          return Align(
            alignment: Alignment.center,
            child: AdminReservationTicket(
              onTap: () async {
                await Navigator.pushNamed(
                  context,
                  _navigateOnTap,
                  arguments: reservation,
                );
              },
              reservation: reservation,
            ),
          );
        },
      ),
    );
  }
}
