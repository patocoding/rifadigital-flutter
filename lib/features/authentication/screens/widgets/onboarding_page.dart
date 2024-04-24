
import 'package:firstly/features/authentication/controller/onboarding_controller.dart';
import 'package:firstly/utils/constants/colors.dart';
import 'package:firstly/utils/constants/sizes.dart';
import 'package:firstly/utils/device/device_utility.dart';
import 'package:firstly/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key, required this.title, required this.image, required this.subtitle,
  });

  final String title, image, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(24.0),
    child: Column(
      children: [
        
        Image(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.6,
          image:  AssetImage(image)
          ),
           Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          )
      ],
    )
    );
  }
}

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(top: TDeviceUtils.getAppBarHeight() , right: TSizes.defaultSpacing, child: TextButton(onPressed: () => OnBoardingController.instance.skipPage()
    , 
    child: const Text('Pular'),
    )
    );
  }
}

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelper.isDarkMode(context);
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: TSizes.defaultSpacing,
    child: 
    SmoothPageIndicator(
    controller: controller.pageController, 
    count: 3,
    onDotClicked: controller.dotNavigationClick,
    effect: ExpandingDotsEffect(activeDotColor: dark ? TColors.light : TColors.dark, dotHeight: 6),)
    );
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

 

  @override
  Widget build(BuildContext context) {
    final dark = THelper.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpacing,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
      onPressed: ()=>{
        OnBoardingController.instance.nextPage()
      },
      style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: dark ? Colors.white : Colors.black),
      child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}