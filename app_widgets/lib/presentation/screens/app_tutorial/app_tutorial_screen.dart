import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
    this.title,
    this.caption,
    this.imageUrl,
  );
}

final slides = <SlideInfo>[
  SlideInfo(
      'Computación en la nube',
      'Veniam ex excepteur dolor adipisicing magna ea Lorem et consequat amet. Aute commodo officia consequat culpa qui. Sit incididunt esse qui Lorem est veniam sunt Lorem do ex exercitation cillum elit.',
      'assets/oboarding1.png'),
  SlideInfo(
      'Desarrollo de aplicaciones',
      'Consectetur deserunt non duis aute laborum quis ad laborum veniam aliqua ullamco reprehenderit proident eiusmod. Quis id ex sint nisi commodo laborum nulla duis qui enim commodo sunt. Laborum ea aliqua deserunt cillum ad sunt exercitation velit magna dolor velit magna mollit reprehenderit. Consectetur fugiat cupidatat do veniam veniam anim. Adipisicing velit ipsum anim laboris veniam qui incididunt. Eiusmod voluptate occaecat fugiat laborum.',
      'assets/oboarding2.png'),
  SlideInfo(
      'Flutter Developer',
      'Ad ipsum ut enim ea adipisicing minim laborum sunt commodo eiusmod. Cillum exercitation sunt aliquip est. Reprehenderit occaecat excepteur dolore qui dolor do aute consequat tempor magna magna commodo mollit amet. Occaecat eiusmod veniam dolor qui id. Irure et commodo proident sint non anim aliquip enim id laborum proident veniam reprehenderit.',
      'assets/oboarding3.png'),
  SlideInfo(
      'Women engineer',
      'Elit tempor et commodo ullamco nulla. Do enim aliqua occaecat labore cillum commodo in irure commodo. Nostrud pariatur culpa sint consequat et aute eiusmod aliqua amet. Id do reprehenderit do eu consequat magna. Magna veniam laboris consequat esse eu velit in nostrud.',
      'assets/oboarding4.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideData) => _SlideCustom(
                    title: slideData.title,
                    caption: slideData.caption,
                    imgaeUrl: slideData.imageUrl,
                  ),
                )
                .toList(),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Salir'),
            ),
          ),
          endReached
              ? Positioned(
                  right: 30,
                  bottom: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Comenzar'),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _SlideCustom extends StatelessWidget {
  final String title;
  final String caption;
  final String imgaeUrl;
  const _SlideCustom({
    required this.title,
    required this.caption,
    required this.imgaeUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imgaeUrl),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
