import 'package:flutter/material.dart';
import 'package:travel/widgets/app_bar/custom_app_bar.dart';
import 'package:travel/widgets/custom_elevated_button.dart';

import '../../core/app_export.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool privacyPolicy = false;

  bool toggleValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      appBar: CustomAppBar(
        height: 50.v,
      ),
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Settings',
              style: CustomTextStyles.headlineLargeGray200,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10.v),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.v),
              decoration: AppDecoration.surface2
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Your opinion is important!', style: theme.textTheme.titleLarge,),
                  SizedBox(height: 8.v),
                  Text('We need your feedback to get better', style: CustomTextStyles.bodyLargeLightgreen50,),
                  SizedBox(height: 10.v),
                  CustomElevatedButton(
                    text: 'Rate app',
                    buttonStyle: ElevatedButton.styleFrom(
                      disabledBackgroundColor:
                          theme.colorScheme.primary.withOpacity(.3),
                      // Background Color
                      disabledForegroundColor:
                          theme.colorScheme.onPrimaryContainer.withOpacity(.3),
                      //Text Color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.v),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 30.v),
              decoration: AppDecoration.surface2
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _menuItem(context,
                      imagePath: ImageConstant.imgShield,
                      title: "Safety",
                      widgetToEnd: Icon(
                        Icons.arrow_forward_ios,
                        color: appTheme.blueGray400,
                      )),
                  SizedBox(height: 30.v),
                  _menuItem(context,
                      imagePath: ImageConstant.imgBell,
                      title: "Notification",
                      widgetToEnd: Switch(
                          thumbColor: WidgetStateProperty.resolveWith<Color>(
                              (Set<WidgetState> states) {
                            if (states.contains(WidgetState.disabled)) {
                              return Colors.white.withOpacity(.48);
                            }
                            return Colors.white;
                          }),
                          value: toggleValue,
                          onChanged: (value) {
                            setState(() {
                              toggleValue = value;
                            });
                          })),
                ],
              ),
            ),
            SizedBox(height: 20.v),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 30.v),
              decoration: AppDecoration.surface2
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _menuItem(context,
                      imagePath: ImageConstant.imgStar, title: "Rate app"),
                  SizedBox(height: 30.v),
                  _menuItem(context,
                      imagePath: ImageConstant.imgDoc,
                      title: "Privacy policy",
                      onTap: () => {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(BuildContext context,
      {String imagePath = '',
      String title = '',
      Function? onTap,
      Widget? widgetToEnd}) {
    return InkWell(
      onTap: () => {onTap?.call()},
      child: Row(children: [
        CustomImageView(
            imagePath: imagePath, height: 24.adaptSize, width: 24.adaptSize),
        Expanded(
          child: Padding(
              padding: EdgeInsets.only(left: 15.h, top: 2.v),
              child: Text(title, style: theme.textTheme.bodyLarge)),
        ),
        widgetToEnd ?? Container(),
      ]),
    );
  }
}
