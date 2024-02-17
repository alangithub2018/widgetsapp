import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Nisi do et cillum enim ad reprehenderit fugiat dolore officia voluptate consectetur. Id aute proident aliqua occaecat cupidatat nostrud Lorem et id quis. Labore exercitation in dolor incididunt. Aliqua velit laborum cupidatat cupidatat aliqua. Ea sunt laborum laboris aliquip. Laboris eu cupidatat dolor deserunt est magna labore proident. Ea ut velit et veniam veniam.', 'assets/images/1.png'),
  SlideInfo('Entrega rapida', 'Dolor anim ex culpa et. Exercitation ut minim ex elit. In enim tempor consequat id non nostrud.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Consectetur est aliqua ad aute sunt ex excepteur occaecat ut ad tempor officia laboris. Ex voluptate officia ut aliquip veniam est dolore laboris anim sit magna. Sit cupidatat velit occaecat sunt minim laboris deserunt. Consequat sunt velit dolore elit qui dolore laborum. Duis nostrud in adipisicing adipisicing laborum. Dolor dolore deserunt anim ipsum consequat.', 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() { 
      final page = pageViewController.page ?? 0;

      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
     });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map(
              (slideData) => _Slide(
                title: slideData.title,
                caption: slideData.caption,
                imageUrl: slideData.imageUrl
                )
              ).toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
              )
            ),
            endReached ?
              Positioned(
                bottom: 30,
                right: 30,
                child: FadeInRight(
                  from: 15,
                  delay: const Duration(seconds: 1),
                  child: FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text('Comenzar'),),
                )
                  ) : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20,),
            Text(title, style: titleStyle,),
            const SizedBox(height: 10,),
            Text(caption, style: captionStyle,),
          ],
        ),
      ),);
  }
}
