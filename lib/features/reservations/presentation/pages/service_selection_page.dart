import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_router.dart';
import '../../../../core/cubits/app_barber_services/app_barber_services_cubit.dart';
import '../../../../core/entities/barber_entity.dart';
import '../../../../core/widgets/input_field.dart';
import '../../../../core/constants/app_size.dart';
import '../cubits/selected_service_options/selected_service_options_cubit.dart';
import '../models/reservation_data.dart';
import '../widgets/service_selection_page/estimations_section.dart';
import '../widgets/service_selection_page/service_selection_app_bar.dart';
import '../widgets/service_selection_page/service_selection_next_button.dart';
import '../widgets/service_selection_page/services_section/services_section.dart';

class ServiceSelectionPage extends StatefulWidget {
  const ServiceSelectionPage({super.key});

  @override
  State<ServiceSelectionPage> createState() => _ServiceSelectionPageState();
}

class _ServiceSelectionPageState extends State<ServiceSelectionPage> {
  late final BarberEntity _barber;

  late final AppBarberServicesCubit _appBarberServicesCubit;
  late final SelectedServiceOptionsCubit _selectedServiceOptionsCubit;

  final _additionalInfoController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _appBarberServicesCubit = context.read<AppBarberServicesCubit>();

    _selectedServiceOptionsCubit = context.read<SelectedServiceOptionsCubit>();
    _selectedServiceOptionsCubit.clear();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _barber = ModalRoute.settingsOf(context)!.arguments as BarberEntity;
    _appBarberServicesCubit.loadBarberServices(_barber.id);
  }

  @override
  void dispose() {
    _additionalInfoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ServiceSelectionAppBar(
            name: _barber.name,
            imageUrl: _barber.imageUrl,
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.pagePadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSize.gapLarge),

                  const ServicesSection(),

                  const SizedBox(height: AppSize.gapLarge),

                  InputField(
                    controller: _additionalInfoController,
                    hintText: 'Additional informations',
                    lines: 3,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: AppSize.gapLarge),

                  ServiceSelectionNextButton(
                    onPressed: () {
                      final data = ReservationData(
                        barberId: _barber.id,
                        additionalInfo: _additionalInfoController.text.trim(),
                      );

                      Navigator.pushNamed(
                        context,
                        AppRouter.dateTimeSelectionPage,
                        arguments: data,
                      );
                    },
                  ),

                  const SizedBox(height: AppSize.gapLarge),
                ],
              ),
            ),
          ),
        ],
      ),

      persistentFooterButtons: const [EstimationsSection()],
    );
  }
}
