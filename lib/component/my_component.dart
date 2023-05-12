import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import '../models/fake_data.dart';
import 'myColors.dart';
import 'dart:developer' as developer;

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

class MainTags extends StatelessWidget {
  MainTags({super.key, required this.textTheme, required this.index});

  final TextTheme textTheme;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        gradient: LinearGradient(
            colors: GradientColors.tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            const ImageIcon(
              AssetImage("assets/icons/hashtagicon.png"),
              size: 14.0,
              color: Colors.white,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              tagList[index].title,
              style: textTheme.headline2,
            )
          ],
        ),
      ),
    );
  }
}

myLunchUrl(String url) async {
  var mUri = Uri.parse(url);
  if (await canLaunchUrl(mUri)) {
    await launchUrl(mUri);
  } else {
    developer.log("couldnot lonch in url${mUri.toString()}");
  }
}
