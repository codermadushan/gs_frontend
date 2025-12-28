import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/app_barbers/app_barbers_cubit.dart';
import '../../../../core/cubits/app_slideshow_images/app_slideshow_images_cubit.dart';
import '../../../../core/cubits/app_user/app_user_cubit.dart';
import '../../../../core/cubits/app_user_reservations/app_user_reservations_cubit.dart';
import '../../../../core/entities/user_entity.dart';
import '../../../../core/enums/user_role.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/widgets/sign_out_button.dart';
import '../../../../core/widgets/texts.dart';
import '../../../status_message/presentation/widgets/status.dart';
import '../widgets/home_page/app_information_button.dart';
import '../widgets/home_page/barbers_section/barbers_section.dart';
import '../widgets/home_page/admin_button.dart';
import '../widgets/home_page/slideshow_section/slideshow_section.dart';
import '../widgets/home_page/reservations_section/reservations_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AppUserCubit _appUserCubit;
  late final AppBarbersCubit _appBarbersCubit;
  late final AppSlideshowImagesCubit _appSlideshowImagesCubit;
  late final AppUserReservationsCubit _appUserReservationsCubit;

  late final UserEntity _user;

  void _initializeUser() {
    _appUserCubit = context.read<AppUserCubit>();
    _user = (_appUserCubit.state as AppUserSuccess).user;
  }

  void _loadBarbers() {
    _appBarbersCubit = context.read<AppBarbersCubit>();
    _appBarbersCubit.loadBarbers();
  }

  void _loadImages() {
    _appSlideshowImagesCubit = context.read<AppSlideshowImagesCubit>();
    _appSlideshowImagesCubit.loadImages();
  }

  void _loadReservations() {
    _appUserReservationsCubit = context.read<AppUserReservationsCubit>();
    _appUserReservationsCubit.loadUserReservations();
  }

  @override
  void initState() {
    super.initState();

    _initializeUser();

    _loadBarbers();

    _loadImages();

    _loadReservations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: AppSize.pagePadding),
          child: Center(
            child: _user.role == UserRole.admin
                ? const AdminButton()
                : const SignOutButton(),
          ),
        ),
        title: AppTextH2('Hi, ${_user.name}'),
        centerTitle: false,
        titleSpacing: AppSize.pagePadding,

        actions: [
          _user.role == UserRole.admin
              ? const SignOutButton()
              : const AppInformationButton(),
        ],
        actionsPadding: const EdgeInsets.only(right: AppSize.pagePadding),
      ),

      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSize.gapLarge),

            Status(),

            SizedBox(height: AppSize.gapLarge),

            SlideshowSection(),

            SizedBox(height: AppSize.gapLarge),

            BarbersSection(),

            SizedBox(height: AppSize.gapLarge),

            ReservationsSection(),

            SizedBox(height: AppSize.gapLarge),
          ],
        ),
      ),
    );
  }
}
