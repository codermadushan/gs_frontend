part of './init_dependencies.dart';

final getIt = GetIt.instance;

void _common() {
  getIt.registerLazySingleton(() => AppSecureStorage.instance);
}

void _appWideStates() {
  getIt
    ..registerLazySingleton(() => AppUserCubit())
    ..registerLazySingleton(() => AppSlideshowImagesCubit())
    ..registerLazySingleton(() => AppBarbersCubit())
    ..registerLazySingleton(() => AppBarberServicesCubit())
    ..registerLazySingleton(() => AppUserReservationsCubit());
}

void _admin() {
  getIt
    ..registerLazySingleton<AdminDataSource>(
      () => AdminRemoteDataSource(getIt()),
    )
    ..registerLazySingleton<AdminRepository>(
      () => AdminRemoteRepository(getIt()),
    )
    ..registerLazySingleton(() => LoadAllReservations(getIt()))
    ..registerLazySingleton(() => AcceptedReservationsCubit(getIt()))
    ..registerLazySingleton(
      () => UpdateReservationStatusCubit(UpdateReservationStatus(getIt())),
    )
    ..registerLazySingleton(() => PendingReservationsCubit(getIt()));
}

void _auth() {
  getIt
    ..registerLazySingleton<AuthDataSource>(() => AuthRemoteDataSource(getIt()))
    ..registerLazySingleton<AuthRepository>(() => AuthRemoteRepository(getIt()))
    ..registerLazySingleton(
      () => AuthCubit(
        appUserCubit: getIt(),

        sendOtp: SendOtp(getIt()),
        verifyOtp: VerifyOtp(getIt()),
        verifyToken: VerifyToken(getIt()),
        logOut: LogOut(getIt()),
      ),
    );
}

void _barbers() {
  getIt
    ..registerLazySingleton<BarbersDataSource>(
      () => BarbersRemoteDataSource(getIt()),
    )
    ..registerLazySingleton<BarbersRepository>(
      () => BarbersRemoteRepository(getIt()),
    )
    ..registerSingleton(
      BarbersCubit(appBarbersCubit: getIt(), loadBarbers: LoadBarbers(getIt())),
    )
    ..registerSingleton(
      BarberServicesCubit(
        appBarberServicesCubit: getIt(),
        loadBarberServices: LoadBarberServices(getIt()),
      ),
    );
}

void _reservations() {
  getIt
    ..registerLazySingleton<ReservationsDataSource>(
      () => ReservationsRemoteDataSource(getIt()),
    )
    ..registerLazySingleton<ReservationsRepository>(
      () => ReservationsRemoteRepository(getIt()),
    )
    ..registerLazySingleton(
      () => AvailableTimeSlotsCubit(LoadAvailableTimeSlots(getIt())),
    )
    ..registerLazySingleton(() => SelectedServiceOptionsCubit())
    ..registerLazySingleton(() => SelectedSlotCubit())
    ..registerLazySingleton(() => SelectedDateCubit())
    ..registerLazySingleton(
      () => CreateReservationCubit(CreateReservation(getIt())),
    )
    ..registerSingleton(
      UserReservationsCubit(
        loadUserReservations: LoadUserReservations(getIt()),
        appUserReservationsCubit: getIt(),
      ),
    )
    ..registerLazySingleton(
      () => DeleteReservationCubit(DeleteReservation(getIt())),
    );
}

void _slideshow() {
  getIt
    ..registerLazySingleton<SlideshowDataSource>(
      () => SlideshowRemoteDataSource(getIt()),
    )
    ..registerLazySingleton<SlideshowRepository>(
      () => SlideshowRemoteRepository(getIt()),
    )
    ..registerSingleton(
      SlideshowCubit(
        appSlideshowImagesCubit: getIt(),

        loadImages: LoadImages(getIt()),
      ),
    );
}

void _statusMessage() {
  getIt
    ..registerLazySingleton<StatusMessageDataSource>(
      () => StatusMessageRemoteDataSource(getIt()),
    )
    ..registerLazySingleton<StatusMessageRepository>(
      () => StatusMessageRemoteRepository(getIt()),
    )
    ..registerLazySingleton(
      () => GetStatusMessageCubit(getStatusMessage: GetStatusMessage(getIt())),
    );
}

void initDependencies() {
  _common();
  _appWideStates();
  _admin();
  _auth();
  _barbers();
  _reservations();
  _slideshow();
  _statusMessage();
}
