import 'package:flutter/material.dart';
import 'package:flutter_application_cinemax/app/widget/colors.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CalendarIcon extends StatelessWidget {
  const CalendarIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(LucideIcons.calendar, color: textdetail, size: 18);
  }
}

class ClockIcon extends StatelessWidget {
  const ClockIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(LucideIcons.clock, color: textdetail, size: 18);
  }
}
