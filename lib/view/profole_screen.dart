import 'package:flutter/material.dart';
import 'package:tecgblog2_prac/component/myColors.dart';
import 'package:tecgblog2_prac/component/myString.dart';
import 'package:tecgblog2_prac/component/my_component.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.marginBody,
  });

  final Size size;
  final TextTheme textTheme;
  final double marginBody;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/avatar.png",height: 100,),
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ImageIcon(AssetImage("assets/icons/blue_pen.png",),color: Colors.blue,),
              const SizedBox(width:8,),
              Text(MyStrings.imageProfileEdit,style: textTheme.headline3,),
            ],

          ),
            const SizedBox(height:60,),
            Text("فاطمه امیری ", style: textTheme.headline4,),
            Text("zahraahmadi@gmail.com", style: textTheme.headline4,),
            const SizedBox(height:40,),
            TechDivider(size: size),
            InkWell(
              onTap: () {
                
              },
              splashColor: SolidColors.primaryColor,
              child: const SizedBox(
                height: 45,
                child: Center(child: Text(MyStrings.myFavBlog))),
            ),
            TechDivider(size: size),
            InkWell(
              onTap: () {
                
              },
              splashColor: SolidColors.primaryColor,
              child: const SizedBox(
                height: 45,
                child: Center(child: Text(MyStrings.myFavPodcast))),
            ),
            TechDivider(size: size),
            InkWell(
              onTap: () {
                
              },
              splashColor: SolidColors.primaryColor,
              child: const SizedBox(
                height: 45,
                child: Center(child: Text(MyStrings.logOut))),
            ),
            const SizedBox(height:60,),


          
        ],
      )
    );
  }
}


