import 'package:boxing/models/article_model.dart';
import 'package:boxing/models/section_model.dart';
import 'package:boxing/screens/prem_articles_screen.dart';
import 'package:boxing/screens/premium_screen.dart';
import 'package:boxing/screens/settings_screen.dart';
import 'package:boxing/values/app_icons.dart';
import 'package:boxing/values/app_images.dart';
import 'package:boxing/values/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ArcticlesScreen extends StatelessWidget {
  const ArcticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 210, 75, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            if (AppUtils.isPrem.value) {
              Get.to(() => PremArticlesScreen());
            } else {
              Get.to(() => PremiumScreen());
            }
          },
          child: Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              AppIcons.score,
            ),
          ),
        ),
        title: Text(
          'THE Style - Boxing Way'.toUpperCase(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => const SettingsScreen());
            },
            child: SvgPicture.asset(
              AppIcons.settings,
            ),
          ),
          const SizedBox(
            width: 23,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 86,
              ),
              SizedBox(
                height: 261,
                child: Stack(
                  children: [
                    Positioned(
                      top: 14,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Get Ready for New Era'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'That strategy doesn\'t need to be\nso rigid that it leaves no room for fun'
                                .toUpperCase(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      AppImages.man,
                      height: 261,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 32),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Get.to(() => ArticleDetailScreen(
                            model: articles[index],
                          ));
                    },
                    child: _ArticleCard(
                      model: articles[index],
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 12,
                  ),
                  itemCount: articles.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ArticleCard extends StatelessWidget {
  final ArticleModel model;
  const _ArticleCard({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Stack(
        children: [
          Image.asset(
            AppImages.block,
            height: 90,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Positioned(
            right: 6,
            child: SizedBox(
              height: 90,
              width: 132,
              child: Center(
                child: SvgPicture.asset(
                  model.iconPath,
                ),
              ),
            ),
          ),
          Positioned(
            top: 12,
            left: 25,
            child: Text(
              model.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ArticleDetailScreen extends StatefulWidget {
  final ArticleModel model;
  const ArticleDetailScreen({super.key, required this.model});

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 210, 75, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        elevation: 0,
        titleSpacing: 0,
        leading: Container(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: Get.back,
            child: Container(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                height: 24,
                AppIcons.back,
                color: Colors.black,
              ),
            ),
          ),
        ),
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.model.title.toUpperCase(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding:
              const EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 32),
          itemBuilder: (context, index) => _SectionCard(
            model: widget.model.sections[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 24,
          ),
          itemCount: widget.model.sections.length,
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final SectionModel model;
  const _SectionCard({required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (model.title.isNotEmpty)
          Text(
            model.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: 'Manrope',
              color: Colors.black,
            ),
          ),
        if (model.title.isNotEmpty)
          const SizedBox(
            height: 12,
          ),
        Text(
          model.text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Manrope',
            color: Colors.black,
          ),
        ),
        if (model.imagePath != null)
          const SizedBox(
            height: 12,
          ),
        if (model.imagePath != null)
          Image.asset(
            model.imagePath!,
          ),
      ],
    );
  }
}
