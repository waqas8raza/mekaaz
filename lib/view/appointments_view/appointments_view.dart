import 'package:flutter/material.dart';
import 'package:mekaaz/theme/app_colors/app_colors.dart';
import 'package:mekaaz/widgets/custom_text.dart';

class AppointmentView extends StatefulWidget {
  const AppointmentView({super.key});

  @override
  _AppointmentViewState createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: const Icon(Icons.calendar_month),
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        title: const Text(
          'Appointments',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Image.asset('assets/images/bell.png'),
            ),
          )
        ],
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 3,
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.brown,
          tabs: const [
            Tab(text: 'Upcoming'),
            Tab(text: 'Past'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: const [
                AppointmentCard(
                  isVirtual: true,
                ),
                SizedBox(height: 10),
                AppointmentCard(
                  isVirtual: false,
                ),
              ],
            ),
          ),
          // const SizedBox(height: 10),
          const Center(
            child: AppointmentCard(
              isVirtual: false,
            ),
          ),
        ],
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final bool isVirtual;

  const AppointmentCard({
    super.key,
    required this.isVirtual,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.lightGreyColor, width: 1.4),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  isVirtual
                      ? 'assets/images/appointment.png'
                      : 'assets/images/appointment.png',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(width: 16),
                 Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Appointment',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      CustomText(
                        text: 'Doctor name · Clinic name',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                      CustomText(
                        text: 'Clinic area address',
                        fontSize: 14,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.secondoryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child:  Center(
              child: CustomText(
                text: 'Physical: 12 Feb, 2023 - 08:00pm',
                fontSize: 14,
                color: AppColors.blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
