import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:tecgblog2_prac/models/data_models.dart';
import 'package:tecgblog2_prac/component/myString.dart';
import 'package:tecgblog2_prac/component/my_component.dart';

import '../models/fake_data.dart';
import '../component/myColors.dart';

class MyCattegori extends StatefulWidget {
  @override
  State<MyCattegori> createState() => _MyCattegoriState();
}

class _MyCattegoriState extends State<MyCattegori> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),

        ///listTags
        child: Padding(
          padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 32,
                ),
                SvgPicture.asset(
                  "assets/images/tcbot.svg",
                  height: 100,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  MyStrings.successfulRegistration,
                  style: textTheme.headline4,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    hintText: "نام و نام خانوادگی",
                    hintStyle: textTheme.headline4,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  MyStrings.chooseCats,
                  style: textTheme.headline4,
                ),
                const SizedBox(
                  height: 16,
                ),
                //taglist
                SizedBox(
                  width: double.infinity,
                  height: 85,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    physics:
                        const ClampingScrollPhysics(), /////////scrol is list by all page
                    shrinkWrap: true,
                    itemCount: tagList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            crossAxisCount: 2,
                            childAspectRatio: 0.3),

                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            setState(() {
                              selectedTags.add(tagList[index]);
                          
                            });
                          },
                          child: MainTags(textTheme: textTheme, index: index));
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Image.asset(
                  "assets/icons/down_cat_arrow.png",
                  scale: 3,
                ),
                //list2
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 85,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    physics:
                        const ClampingScrollPhysics(), /////////scrol is list by all page
                    shrinkWrap: true,
                    itemCount: selectedTags.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            crossAxisCount: 2,
                            childAspectRatio: 0.2),

                    itemBuilder: (context, index) {
                      return Container(
                        height: 60,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: SolidColors.surface,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                              selectedTags[index].title,
                              style: textTheme.headline4,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                      selectedTags.removeAt(index);
                                    
                                  });
                              
                                },
                                child: const Icon(CupertinoIcons.delete,size: 20,color: Colors.grey,))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                  const SizedBox(height:32,
                              ),
                ElevatedButton(onPressed: ((){}), child: Text("ادامه")),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
