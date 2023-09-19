import 'package:flutter/material.dart';
import '../core/constant/color_palatte.dart';
import '../core/constant/dimension_constant.dart';
import '../pages/main_page.dart';
import '../widgets/app_text.dart';
import '../widgets/button_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<String> images = ["welcome-1.jpg", "welcome-2.jpg", "welcome-3.jpg"];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: SafeArea(child: Scaffold(
        body: PageView.builder(itemBuilder: (context, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/" + images[index]),
                    fit: BoxFit.cover)),
            child: Container(
              margin: const EdgeInsets.only(
                  top: 100, left: kDefaultPadding, right: kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: "Trips",
                        size: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      AppText(
                        text: "Mountain",
                        size: 30,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 300,
                        child: AppText(
                          text:
                              "We will built it step by step. We will also build the ui and do api request. "
                              "We will cover http get request and load the data using flutter cubit or bloc.",
                          size: 16,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(MainPage.routeName);
                        },
                        child: ButtonNext(
                          width: 100,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexDots) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: index == indexDots ? 25 : 12,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? ColorPalette.primaryColor
                                : ColorPalette.primaryColor.withOpacity(0.5)),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
        }),
      )),
    );
  }
}
