import 'package:boxing/models/prem_article_model.dart';
import 'package:boxing/values/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PremArticleDetailScreen extends StatelessWidget {
  final String sectionTitle;
  final PremArticleModel item;
  const PremArticleDetailScreen(
      {super.key, required this.item, required this.sectionTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            primary: true,
            backgroundColor: Color.fromRGBO(255, 210, 75, 1),
            title: Text(
              sectionTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            pinned: true,
            expandedHeight: 320.0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Container(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: Get.back,
                  child: Container(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      AppIcons.back,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(item.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ColoredBox(
                  color: Color.fromRGBO(255, 210, 75, 0.6),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.all(25),
                    child: Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          DefaultTextStyle(
            style: Theme.of(context).textTheme.bodyMedium?.copyWith() ??
                const TextStyle(),
            child: SliverList.list(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Text(
                    item.desc,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Manrope',
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
