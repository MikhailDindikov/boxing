import 'package:boxing/values/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SystemScreen extends StatefulWidget {
  final String type;
  const SystemScreen({super.key, required this.type});

  @override
  State<SystemScreen> createState() => _SystemScreenState();
}

class _SystemScreenState extends State<SystemScreen> {
  late WebViewController _controller;

  @override
  void initState() {
    String type = '';
    if (widget.type == 'Privacy Policy') {
      type =
          'https://www.termsfeed.com/live/e0a5d917-fdf0-4007-b1e3-4dba7b68ae70';
    } else if (widget.type == 'Terms of Use') {
      type =
          'https://www.termsfeed.com/live/0f8f7928-8484-4021-a0de-377c49899de7';
    } else {
      type = 'https://form.123formbuilder.com/6815085/the-style-boxing-way';
    }

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(type));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: Get.back,
                      child: Container(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          AppIcons.back,
                          color: Color.fromRGBO(255, 210, 75, 1),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.type.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(255, 210, 75, 1),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0,
                    child: IgnorePointer(
                      child: Container(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: Get.back,
                          child: Container(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              AppIcons.back,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                child: WebViewWidget(
                  controller: _controller,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
