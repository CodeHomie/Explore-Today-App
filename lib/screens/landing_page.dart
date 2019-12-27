import 'package:explore_app/constants/constants.dart';
import 'package:explore_app/styles/explore_app_theme.dart';
import 'package:explore_app/ui_views/landing_page_actionbar_view.dart';
import 'package:explore_app/ui_views/top_headlines_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ExploreAppTheme.background,
      child: Scaffold(
        backgroundColor: ExploreAppTheme.background,
        body: Stack(
          children: <Widget>[backgroundImage(),gradientHomeShadow(),landingPageBody()],
        ),
      ),
    );
  }

  Widget gradientHomeShadow() => Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: ExploreAppTheme.background,
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topRight,
                colors: [Colors.black, ExploreAppTheme.nearlyTransparent])),
      );

      Widget backgroundImage() => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.4, left: MediaQuery.of(context).size.width * 0.0),
        child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
                      image: new AssetImage("assets/images/bg_photo.png"),
                      fit: BoxFit.cover,
                    )
        ),
      ),
      ) ;

  Widget landingPageBody() => ListView(
        children: <Widget>[
          LandingPageActionBarView(),
          exploreHomeTitle(),
          TopHeadlinesView()
        ],
      );

  Widget exploreHomeTitle() => Padding(
      padding: EdgeInsets.only(left: 25.0, top: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            Constants.EXPLORE_HEADING,
            style: TextStyle(
              fontFamily: Constants.POPPINS,
              fontWeight: FontWeight.w600,
              fontSize: 30.0,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            Constants.EXPLORE_SUBHEADING,
            style: TextStyle(
              fontFamily: Constants.OPEN_SANS,
              fontWeight: FontWeight.w400,
              fontSize: 11.5,
              color: Colors.white,
              letterSpacing: 0.7,
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
        ],
      ));
}