import 'package:firstly/features/authentication/controller/onboarding_controller.dart';
import 'package:firstly/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import 'widgets/onboarding_page.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children:  const [
              OnBoardingPage(
                title:'Venda suas rifas para inúmeras pessoas.',
                subtitle: 'Uma comunidade gigante de Rifeiros!',
                image: TImages.onBoardingGif,
                ),
                OnBoardingPage(
                title:'Segurança em primeiro lugar.',
                subtitle: 'Asseguramos sua compra e venda com o método Rifa Segura!',
                image: TImages.onBoardingGif,
                ),
                OnBoardingPage(
                title:'Não sei mais o que colocar',
                subtitle: 'Mas vou enrolar aqui pra ficar um texto namoral!',
                image: TImages.onBoardingGif,
                ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}





