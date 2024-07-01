//import 'package:employee_onboarding/modules/homescreen/presentation/views/home_page_desktopview.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telphanews/modules/homescreen/presentation/views/home_page_desktopview.dart';
import 'package:telphanews/modules/homescreen/presentation/views/home_page_mobileview.dart';
import 'package:telphanews/responsive.dart';
import 'package:telphanews/utils/components/ui_helpers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        UIHelpers.hideKeyBoard();
        SystemNavigator.pop();
      },
      child: const Responsive(
        mobile: HomePageMobileView(),
        desktop: HomePageDesktopView(),
      ),
    );
  }
}
