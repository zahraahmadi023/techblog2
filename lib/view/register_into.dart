import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tecgblog2_prac/component/myColors.dart';
import 'package:tecgblog2_prac/component/myString.dart';
import 'package:tecgblog2_prac/view/my_category.dart';
import 'package:validators/validators.dart';
class RegisterInto extends StatelessWidget {
  const RegisterInto({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/tcbot.svg",
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: MyStrings.welcom, style: textTheme.headline4)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ElevatedButton(
                  style: const ButtonStyle(),
                  onPressed: (() {
                    _showEmailBottomSheet(context, size, textTheme);
                  }),
                  child: Text(
                    "بزن بریم ",
                    style: textTheme.headline1,
                  )),
            ),
          ],
        ),
      ),
    ));
    
  }

  Future<dynamic> _showEmailBottomSheet(BuildContext context, Size size, TextTheme textTheme) {
    return  showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(MyStrings.insertYourEmail,style: textTheme.headline4
                ,),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextField(
                    onChanged: (value) {
                      //isEmail(value);////RegEXP
                      
                      print(value +"is Email" + isEmail(value).toString());
                    },
                    textAlign: TextAlign.center,
                    style: textTheme.headline4,
                    decoration: InputDecoration(
                      hintText: "techBlog@gmail.com",
                      hintStyle:textTheme.headline4 ,
                      
                    ),
                    
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: ElevatedButton(onPressed: ((){
                    Navigator.pop(context);
                    _showActivitcodeBottomSheet(context, size, textTheme);
                  }), child: Text("ادامه",style: textTheme.headline1,)),
                )
              ],),
            ),
          );
        }));
  }
Future<dynamic> _showActivitcodeBottomSheet(BuildContext context, Size size, TextTheme textTheme) {
    return  showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(MyStrings.activateCode,style: textTheme.headline4
                ,),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextField(
                    onChanged: (value) {
                      //isEmail(value);////RegEXP
                      
                      print(value +"is Email" + isEmail(value).toString());
                    },
                    textAlign: TextAlign.center,
                    style: textTheme.headline4,
                    decoration: InputDecoration(
                      hintText: "*********",
                      hintStyle:textTheme.headline4 ,
                      
                    ),
                    
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: ElevatedButton(onPressed: ((){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyCattegori()) );
                  }), child: Text("ادامه",style: textTheme.headline1,)),
                )
              ],),
            ),
          );
        }));
  }
}
