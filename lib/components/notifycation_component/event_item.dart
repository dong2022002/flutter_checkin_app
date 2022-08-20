import 'package:checkin_app/components/notifycation_component/grey_text.dart';
import 'package:checkin_app/core/values/app_style.dart';
import 'package:checkin_app/route/route_name.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  const EventItem(
      {Key? key,
      required this.pathImage,
      required this.auth,
      required this.headerText,
      required this.time})
      : super(key: key);
  final String pathImage;
  final String headerText;
  final String auth;
  final String time;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: (() {
          Navigator.pushNamed(context, RouteName.notifacationDetailPage);
        }),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: size.width * 0.2,
              height: size.height * 0.1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(pathImage), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(100)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // height: size.height * 0.1,
                    width: size.width * 0.63,
                    child: RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: headerText,
                        style: AppStyles.h5,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.61,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GreyText(text: auth),
                        GreyText(text: time),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
