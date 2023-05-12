// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecgblog2_prac/Services/dio_services.dart';
import 'package:tecgblog2_prac/component/myColors.dart';
import 'package:tecgblog2_prac/component/myString.dart';
import 'package:tecgblog2_prac/component/my_component.dart';
import 'package:tecgblog2_prac/view/home_screen.dart';
import 'package:tecgblog2_prac/view/profole_screen.dart';
import 'package:share_plus/share_plus.dart';

import '../component/api_constant.dart';


final GlobalKey<ScaffoldState> _Key=GlobalKey();
class MainScreen extends StatelessWidget{
  RxInt selectedIndex = 0.obs;

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //DioService().getMethods("https://techblog.sasansafari.com/Techblog/api/home/?command=index");
    DioService().getMethods(ApiConstants.getHomeItem);
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var marginBody = size.width / 10;
    return Scaffold(
      key: _Key,
      drawer: Drawer(
        backgroundColor: SolidColors.scaffoldBg,
        child: Padding(
          padding: EdgeInsets.only(left:marginBody,right: marginBody),
          child: ListView(
            children: [
              DrawerHeader(child: 
              Center(
                child: Image.asset("assets/images/logo.png",scale: 3,),
              )),
              ListTile(
                title:Text("پروفایل کاربری ",style: textTheme.headline4,),
                onTap: (){},
                
              ),
              const Divider(color: SolidColors.dividerColor,),
              
              ListTile(
                title:Text("درباره تک بلاگ  ",style: textTheme.headline4,),
                onTap: (){
                    myLunchUrl(MyStrings.techBlogGithubUrl);
                },
                
              ),
              const Divider(color: SolidColors.dividerColor,),
              ListTile(
                title:Text("اشتراگ گذاری تگ بلاگ  ",style: textTheme.headline4,),
                onTap: ()async{
                await  Share.share(MyStrings.shareText);
                },
                
              ),
              const Divider(color: SolidColors.dividerColor,),
              ListTile(
                title:Text("تگ بلاگ در گیت هاب  ",style: textTheme.headline4,),
                onTap: (){
                  myLunchUrl(MyStrings.techBlogGithubUrl);
                },
                
              ),
              const Divider(color: SolidColors.dividerColor,)
            ]
            ),
        ),

      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: SolidColors.scaffoldBg,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap:() {
                _Key.currentState!.openDrawer();

              },
              child: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            Image.asset(
              "assets/images/logo.png",
              height: size.height / 13.6,
            ),
            const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Center(
              child: Positioned.fill(
                child:
                
                Obx(() => 
                IndexedStack( 
                  index: selectedIndex.value,
                  children: [
                  HomeScreen(size: size, textTheme: textTheme, marginBody: marginBody),
                  ProfileScreen(size: size, textTheme: textTheme, marginBody: marginBody),
                  
                  ///(size: size, textTheme: textTheme, marginBody: marginBody)

                ],),
                )
              )),
          BottomNavigation(
              size: size,
              marginBody: marginBody,
              changeScreen: (int value) {
              
                  selectedIndex.value=value;
              
              }),
        ],
      ),
    );
  }
  
  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   // throw UnimplementedError();
  // }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.size,
    required this.marginBody,
    required this.changeScreen,
  });

  final Size size;
  final double marginBody;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 8,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: GradientColors.bottomNavBackground,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: marginBody, left: marginBody),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              gradient: LinearGradient(
                colors: GradientColors.bottomNav,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    changeScreen(0);
                  },
                  icon: const ImageIcon(
                    AssetImage("assets/icons/home.png"),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    
                  
                  },
                  icon: const ImageIcon(
                    AssetImage("assets/icons/write.png"),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    changeScreen(1);
                  },
                  icon: const ImageIcon(
                    AssetImage("assets/icons/user.png"),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
