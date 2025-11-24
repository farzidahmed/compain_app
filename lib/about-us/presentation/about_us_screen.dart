import 'package:bnp_app/about-us/model/about_us_repsponse.dart';
import 'package:bnp_app/constants/text_font_style.dart';
import 'package:bnp_app/networks/api_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    termsAndCOnditonRx.privecyPolicy();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About us".tr,
          style: TextFontStyle.headline16w400c3D4040mina,
        ),
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: termsAndCOnditonRx.getPrivecyPolicyStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                AboutResponse response = snapshot.data;
                return Column(
                  spacing: 14.h,
                  children: [
                    Html(
                      data: response.data?.description ?? "",
                      style: {
                        "p.fancy": Style(
                          color: Color(0xFFFFFFFF),
                          textAlign: TextAlign.center,
                          // padding:  EdgeInsets.all(16),
                          backgroundColor: Colors.grey,
                          margin: Margins(
                            left: Margin(50, Unit.px),
                            right: Margin.auto(),
                          ),
                          width: Width(300, Unit.px),
                          fontWeight: FontWeight.bold,
                        ),
                      },
                    ),
                    // HtmlWidget(
                    //   response.data?.text ?? "",
                    //   textStyle:
                    //       TextFontStyle.headline18w400cFFFFFFPoppins,
                    //   customStylesBuilder: (element) {
                    //     if (element.classes.contains('highlight')) {
                    //       return {'color': 'blue'};
                    //     }
                    //     return null;
                    //   },
                    //   customWidgetBuilder: (element) {
                    //     if (element.attributes['foo'] == 'bar') {
                    //       // Render a custom widget if needed
                    //     }
                    //     return null;
                    //   },
                    //   renderMode: RenderMode.column,
                    // ),
                  ],
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
