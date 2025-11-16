enum ReservationStatus { pending, rejected, accepted, completed }

extension ReservationStateExt on ReservationStatus {
  String get label {
    switch (this) {
      case ReservationStatus.pending:
        return 'Pending';
      case ReservationStatus.rejected:
        return 'Rejected';

      case ReservationStatus.accepted:
        return 'Accepted';

      case ReservationStatus.completed:
        return 'Completed';
    }
  }
}
