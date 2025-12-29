import 'package:flutter/material.dart';

import '../features/admin/presentation/pages/accepted_reservation_details_page.dart';
import '../features/admin/presentation/pages/accepted_reservations_page.dart';
import '../features/admin/presentation/pages/complete_accepted_reservation_page.dart';
import '../features/admin/presentation/pages/pending_reservation_details_page.dart';
import '../features/admin/presentation/pages/pending_reservations_page.dart';
import '../features/admin/presentation/pages/reject_accepted_reservation_page.dart';
import '../features/admin/presentation/pages/reject_pending_reservation_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/otp_verification_page.dart';
import '../features/auth/presentation/pages/splash_page.dart';
import '../features/home/presentation/pages/app_information_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/reservations/presentation/pages/date_time_selection_page.dart';
import '../features/reservations/presentation/pages/reservation_details_page.dart';
import '../features/reservations/presentation/pages/service_selection_page.dart';
import '../features/status_message/presentation/pages/update_message_page.dart';

sealed class AppRouter {
  // auth
  static const loginPage = '/login';
  static const otpVerificationPage = '/otp-verification';
  static const splashPage = '/splash';

  // home
  static const homePage = '/home';
  static const appInformationPage = '/app-information';

  // reservations
  static const dateTimeSelectionPage = '/date-time-selection';
  static const serviceSelectionPage = '/service-selection';
  static const reservationDetailsPage = '/reservation-details-page';

  // admin
  static const acceptedReservationsPage = '/accepted-reservations';
  static const acceptedReservationDetailsPage = '/accepted-reservation-details';
  static const completeAcceptedReservationPage =
      '/complete-accepted-reservation';
  static const rejectAcceptedReservationPage = '/reject-accepted-reservation';
  static const pendingReservationsPage = '/pending-reservations';
  static const pendingReservationDetailsPage = '/pending-reservation-details';
  static const rejectPendingReservationPage = '/reject-pending-reservation';

  // status_message
  static const updateMessagePage = '/update-message';

  static Map<String, Widget Function(BuildContext)> routes(
    BuildContext context,
  ) {
    return {
      // auth
      loginPage: (context) => const LoginPage(),
      otpVerificationPage: (context) => const OtpVerificationPage(),
      splashPage: (context) => const SplashPage(),

      // home
      homePage: (context) => const HomePage(),
      appInformationPage: (context) => const AppInformationPage(),

      // reservations
      dateTimeSelectionPage: (context) => const DateTimeSelectionPage(),
      serviceSelectionPage: (context) => const ServiceSelectionPage(),
      reservationDetailsPage: (context) => const ReservationDetailsPage(),

      // admin
      acceptedReservationsPage: (context) => const AcceptedReservationsPage(),
      acceptedReservationDetailsPage: (context) =>
          const AcceptedReservationDetailsPage(),
      completeAcceptedReservationPage: (context) =>
          const CompleteAcceptedReservationPage(),
      rejectAcceptedReservationPage: (context) =>
          const RejectAcceptedReservationPage(),
      pendingReservationsPage: (context) => const PendingReservationsPage(),
      pendingReservationDetailsPage: (context) =>
          const PendingReservationDetailsPage(),
      rejectPendingReservationPage: (context) =>
          const RejectPendingReservationPage(),

      // status_message
      updateMessagePage: (context) => const UpdateMessagePage(),
    };
  }
}
