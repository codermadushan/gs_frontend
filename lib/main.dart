import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app_router.dart';
import 'core/app_theme.dart';
import 'core/cubits/app_barber_services/app_barber_services_cubit.dart';
import 'core/cubits/app_barbers/app_barbers_cubit.dart';
import 'core/cubits/app_user/app_user_cubit.dart';
import 'core/cubits/app_slideshow_images/app_slideshow_images_cubit.dart';
import 'core/cubits/app_user_reservations/app_user_reservations_cubit.dart';
import 'features/admin/presentation/cubits/accepted_reservations/accepted_reservations_cubit.dart';
import 'features/admin/presentation/cubits/pending_reservations/pending_reservations_cubit.dart';
import 'features/admin/presentation/cubits/update_reservation_status/update_reservation_status_cubit.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/reservations/presentation/cubits/available_time_slots/available_time_slots_cubit.dart';
import 'features/reservations/presentation/cubits/create_reservation/create_reservation_cubit.dart';
import 'features/reservations/presentation/cubits/delete_reservation/delete_reservation_cubit.dart';
import 'features/reservations/presentation/cubits/selected_date_cubit.dart';
import 'features/reservations/presentation/cubits/selected_service_options/selected_service_options_cubit.dart';
import 'features/reservations/presentation/cubits/selected_slot_cubit.dart';
import 'features/status_message/presentation/cubits/get_status_message/get_status_message_cubit.dart';
import 'features/status_message/presentation/cubits/new_status_message_cubit.dart';
import 'features/status_message/presentation/cubits/selected_message_color_cubit.dart';
import 'features/status_message/presentation/cubits/update_status_message/update_status_message_cubit.dart';
import 'init_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  initDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        // appWideStates
        BlocProvider(create: (context) => getIt<AppUserCubit>()),
        BlocProvider(create: (context) => getIt<AppSlideshowImagesCubit>()),
        BlocProvider(create: (context) => getIt<AppBarbersCubit>()),
        BlocProvider(create: (context) => getIt<AppBarberServicesCubit>()),
        BlocProvider(create: (context) => getIt<AppUserReservationsCubit>()),

        // admin
        BlocProvider(create: (context) => getIt<AcceptedReservationsCubit>()),
        BlocProvider(create: (context) => getIt<PendingReservationsCubit>()),
        BlocProvider(
          create: (context) => getIt<UpdateReservationStatusCubit>(),
        ),

        // auth
        BlocProvider(create: (context) => getIt<AuthCubit>()),

        // reservations
        BlocProvider(create: (context) => getIt<SelectedServiceOptionsCubit>()),
        BlocProvider(create: (context) => getIt<SelectedDateCubit>()),
        BlocProvider(create: (context) => getIt<AvailableTimeSlotsCubit>()),
        BlocProvider(create: (context) => getIt<SelectedSlotCubit>()),
        BlocProvider(create: (context) => getIt<CreateReservationCubit>()),
        BlocProvider(create: (context) => getIt<DeleteReservationCubit>()),

        // status_message
        BlocProvider(create: (context) => getIt<GetStatusMessageCubit>()),
        BlocProvider(create: (context) => getIt<UpdateStatusMessageCubit>()),
        BlocProvider(create: (context) => getIt<SelectedMessageColorCubit>()),
        BlocProvider(create: (context) => getIt<NewStatusMessageCubit>()),
      ],
      child: const GS(),
    ),
  );
}

class GS extends StatelessWidget {
  const GS({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      routes: AppRouter.routes(context),
      initialRoute: AppRouter.splashPage,
    );
  }
}
