import '../enums/reservation_status.dart';

ReservationStatus getReservationStatus(String value) {
  if (value == ReservationStatus.pending.name) {
    return ReservationStatus.pending;
  }

  if (value == ReservationStatus.accepted.name) {
    return ReservationStatus.accepted;
  }

  if (value == ReservationStatus.rejected.name) {
    return ReservationStatus.rejected;
  }

  return ReservationStatus.completed;
}
