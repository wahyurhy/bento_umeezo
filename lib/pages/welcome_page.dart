import 'package:bento_umeezo/home.dart';
import 'package:bento_umeezo/misc/colors.dart';
import 'package:bento_umeezo/widgets/app_large_text.dart';
import 'package:bento_umeezo/widgets/app_text.dart';
import 'package:bento_umeezo/widgets/responsive_button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int pageChanged = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth <= 600) {
              return OnboardingList(pageController: _pageController, paddingTop: 200,);
            } else {
              return OnboardingList(pageController: _pageController, paddingTop: 50,);
            }
          }
      ),
    );
  }
}

class OnboardingList extends StatelessWidget {
  PageController pageController;
  final double paddingTop;
  OnboardingList({super.key, required this.pageController, required this.paddingTop,});

  List bg = [
    'bg-app-1.png',
    'bg-app-2.png',
  ];

  List images = [
    'welcome-one.png',
    'welcome-two.png',
  ];

  List textHeader = [
    'Buat bekal Bento favoritmu',
    'Tidak usah pusing lagi cari resep Bento'
  ];

  List textFooter = [
    'Tersedia berbagai resep Bento yang dapat kamu ikuti dengan bahan-bahan yang terjangkau',
    'Karena resep-resep sudah tersedia dalam aplikasi Bento Umeezo'
  ];

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        controller: pageController,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/" + bg[index]),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: paddingTop),
                      child: Image.asset("images/" + images[index])),
                  const SizedBox(
                    height: 14,
                  ),
                  SizedBox(
                    width: 257,
                    child: AppLargeText(
                      text: textHeader[index],
                      textAlign: TextAlign.center,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 287,
                    child: AppText(
                      text: textFooter[index],
                      textAlign: TextAlign.center,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextButton(
                      onPressed: () {
                        if (index == images.length - 1) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => const MyHomePage()));
                        }
                        nextPage();
                      },
                      child: ResponsiveButton(
                        width: index == images.length - 1 ? 157 : 55,
                        text: index == images.length - 1 ? "Yuk Mulai!" : "",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(images.length, (indexDots) {
                      return Container(
                        width: 8,
                        height: index == indexDots ? 20 : 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? AppColors.bottonColorBrown
                                : AppColors.bottonColorBrown.withOpacity(0.5)),
                        margin: const EdgeInsets.only(left: 2.5, right: 2.5),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
        });
  }
}

