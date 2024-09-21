import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors/app_colors.dart';

Widget weekDayOne(BuildContext context) {
  DateTime? selectedDate;
  return SizedBox(
    width: double.maxFinite,
    child: EasyDateTimeLine(
      initialDate: selectedDate ?? DateTime.now(),
      locale: 'en_US',
      headerProps: const EasyHeaderProps(
        dateFormatter: DateFormatter.fullDateDMY(),
        monthPickerType: MonthPickerType.switcher,
        showHeader: false,
      ),
      dayProps: const EasyDayProps(
        width: 48,
        height: 84,
      ),
      onDateChange: (selectedDates) {
        selectedDate = selectedDates;
      },
      itemBuilder: (context, dateTime, isSelected, onTap) {
        return GestureDetector(
            onTap: onTap,
            child: isSelected
                ? Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          EasyDateFormatter.shortDayName(
                            dateTime,
                            'en_US',
                          ),
                          style: const TextStyle(color: AppColors.whiteColor),
                        ),
                        Text(
                          dateTime.day.toString(),
                          style: const TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                : Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                          color: AppColors.bottombarColor1, width: 1),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          EasyDateFormatter.shortDayName(
                            dateTime,
                            'en_US',
                          ),
                          style: const TextStyle(color: AppColors.blackColor),
                        ),
                        Text(dateTime.day.toString(),
                            style: const TextStyle(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ));
      },
    ),
  );
}