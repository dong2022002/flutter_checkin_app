import 'package:checkin_app/core/values/app_color.dart';
import 'package:checkin_app/core/values/app_style.dart';
import 'package:checkin_app/modules/auth/auth_provider/user_provider.dart';
import 'package:checkin_app/modules/history_checkin/history_checkin_provider.dart/DataHistoryCheckinProvider.dart';
import 'package:checkin_app/modules/home/components/event_category_view.dart';
import 'package:checkin_app/modules/home/components/logo_school.dart';
import 'package:checkin_app/modules/home/components/name_home_page.dart';
import 'package:checkin_app/modules/home/components/search_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeAdminPage extends StatefulWidget {
  const HomeAdminPage({Key? key}) : super(key: key);

  @override
  State<HomeAdminPage> createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer2<UserProvider, DataHistoryCheckinProvider>(
        builder: ((context, user, dataEvent, child) {
      return Scaffold(
        backgroundColor: AppColors.kBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Stack(
            children: [
              const LogoSchool(),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.8,
                      height: size.height * 0.085,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: NameHomePage(name: 'Chi đoàn ${user.chiDoan.ten}'),
                    ),
                    // SizedBox(height: size.height * 0.04),
                    SearchView(onPress: () {}),
                    titleContentView(),
                    const Divider(
                      color: AppColors.kPrimaryColor,
                    ),
                    EventCategoryView(
                      user: user,
                      dataEvent: dataEvent,
                      isAdmin: true,
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.only(top: 8),
                    //   child: EventMore(),
                    // ),

                    const Divider(
                      color: AppColors.kPrimaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }));
  }
}

Padding titleContentView() {
  return Padding(
    padding: const EdgeInsets.only(top: 16, left: 4, right: 4),
    child: Text(
      'Sự kiện liên chi đoàn',
      style: AppStyles.h5.copyWith(
        fontSize: 20,
        color: AppColors.kPrimaryColor,
      ),
    ),
  );
}
