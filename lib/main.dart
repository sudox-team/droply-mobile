import 'package:droply/data/api/droply_api.dart';
import 'package:droply/data/devices/devices_repository.dart';
import 'package:droply/data/devices/providers/test_devices_provider.dart';
import 'package:droply/data/entries/entries_repository.dart';
import 'package:droply/data/entries/providers/test_entries_provider.dart';
import 'package:droply/data/managers/connection_manager.dart';
import 'package:droply/presentation/auth/auth_screen.dart';
import 'package:droply/presentation/common/app_bar.dart';
import 'package:droply/presentation/common/tab_bar.dart';
import 'package:droply/presentation/device_name/device_name_screen.dart';
import 'package:droply/presentation/main/main_screen.dart';
import 'package:droply/presentation/settings/settings_screen.dart';
import 'package:droply/presentation/statistics/statistics_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants.dart';

void main() async {
  runApp(
    EasyLocalization(
      fallbackLocale: Locale('en', 'US'),
      supportedLocales: [Locale('en', 'US'), Locale('ru', 'RU')],
      path: 'assets/translations',
      child: App(),
    ),
  );
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  final ConnectionManager _connectionManager = ConnectionManager(DroplyApi());

  @override
  void initState() {
    _connectionManager.start();
    super.initState();
  }

  @override
  void dispose() {
    _connectionManager.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarDividerColor: null,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => _connectionManager),
          RepositoryProvider(
            create: (context) => DevicesRepository(
              provider: TestDevicesProvider(),
            ),
          ),
          RepositoryProvider(
            create: (context) => EntriesRepository(
              provider: TestEntriesProvider(),
            ),
          ),
        ],
        child: MaterialApp(
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          title: "Droply",
          routes: {
            AppNavigation.authRouteName: (context) => AuthScreen(),
            AppNavigation.deviceNameRouteName: (context) => DeviceNameScreen(),
            AppNavigation.mainRouteName: (context) => MainScreen(),
            AppNavigation.settingsRouteName: (context) => SettingsScreen(),
            AppNavigation.statisticsRouteName: (context) => StatisticsScreen(),
          },
          theme: ThemeData(
            splashColor: AppColors.rippleEffectColor,
            highlightColor: AppColors.highlightButtonColor,
            scaffoldBackgroundColor: AppColors.backgroundColor,
            primaryIconTheme: IconThemeData(color: AppColors.primaryIconsColor),
            tabBarTheme: TabBarTheme(
              indicator: TabBarIndicator(),
              labelPadding: EdgeInsets.symmetric(
                horizontal: TabBarStyles.tabHorizontalPadding,
              ),
              labelColor: AppColors.accentColor,
              labelStyle: TextStyle(
                fontSize: 15,
                fontWeight: AppFonts.semibold,
                fontFamily: AppFonts.openSans,
              ),
              unselectedLabelColor: AppColors.secondaryTextColor,
              unselectedLabelStyle: TextStyle(
                fontSize: 15,
                fontWeight: AppFonts.semibold,
                fontFamily: AppFonts.openSans,
              ),
            ),
            appBarTheme: AppBarTheme(
              brightness: Brightness.light,
              color: AppColors.backgroundColor,
              centerTitle: true,
              elevation: AppBarStyles.elevation,
              shadowColor: AppColors.dividerColor,
              textTheme: TextTheme(
                headline6: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontSize: 18,
                  fontFamily: AppFonts.openSans,
                  fontWeight: AppFonts.bold,
                ),
              ),
            ),
            buttonTheme: ButtonThemeData(
              splashColor: AppColors.rippleEffectColor,
              highlightColor: AppColors.highlightButtonColor,
              padding: EdgeInsets.only(top: 16, bottom: 16),
            ),
            bottomSheetTheme: BottomSheetThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                padding: EdgeInsets.only(
                  left: 14,
                  right: 14,
                  top: 14,
                  bottom: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: AppColors.onAccentColor,
                onSurface: AppColors.onAccentColor,
                backgroundColor: AppColors.accentColor,
                textStyle: TextStyle(
                  fontFamily: AppFonts.openSans,
                  fontWeight: AppFonts.semibold,
                  fontSize: 16,
                ),
              ),
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: AppColors.accentColor,
            ),
          ),
          home: MainScreen(),
        ),
      ),
    );
  }
}
