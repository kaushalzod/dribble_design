import 'package:dribble_design/app/modules/my_subscriptions_tab/model/subs_detail_model.dart';
import 'package:dribble_design/core/extensions/color_ext.dart';
import 'package:dribble_design/core/utils/color_const.dart';
import 'package:flutter/material.dart';

class SubscriptionData {
  static final List<SubsDetailModel> list = [
    SubsDetailModel(
      logo: "",
      isAddSub: true,
      name: "Add a subscription",
      price: "",
      subsType: SubsType.month,
      bgColor: ColorConst.primary.toInt32,
      textColor: Colors.white.toInt32,
    ),
    SubsDetailModel(
      logo: "figma.png",
      name: "Figma",
      price: "12",
      subsType: SubsType.month,
      bgColor: Color(0xfff9be06).toInt32,
      textColor: Colors.black.toInt32,
    ),
    SubsDetailModel(
      logo: "hbo.png",
      name: "HBO Max",
      price: "9.99",
      subsType: SubsType.month,
      bgColor: Color(0xfffe5eb4).toInt32,
      textColor: Colors.white.toInt32,
    ),
    SubsDetailModel(
      logo: "spotify.png",
      name: "Spotify",
      price: "8",
      subsType: SubsType.month,
      bgColor: Color(0xff0fb762).toInt32,
      textColor: Colors.white.toInt32,
    ),
    SubsDetailModel(
      logo: "playstation.png",
      name: "PlayStation Plus",
      price: "67.57",
      subsType: SubsType.year,
      bgColor: Color(0xff7e4cfa).toInt32,
      textColor: Colors.white.toInt32,
    ),
    SubsDetailModel(
      logo: "youtube.png",
      name: "Youtube",
      price: "8.97",
      subsType: SubsType.month,
      bgColor: Color(0xffff6335).toInt32,
      textColor: Colors.white.toInt32,
    ),
    SubsDetailModel(
      logo: "amazon.png",
      name: "Amazon Prime",
      price: "8.97",
      subsType: SubsType.month,
      bgColor: Colors.pinkAccent.toInt32,
      textColor: Colors.white.toInt32,
    ),
    SubsDetailModel(
      logo: "dribble.png",
      name: "Dribble",
      price: "5.56",
      subsType: SubsType.month,
      bgColor: Color(0xffa602ef).toInt32,
      textColor: Colors.white.toInt32,
    ),
    SubsDetailModel(
      logo: "apple.png",
      name: "Apple Tv",
      price: "6.23",
      subsType: SubsType.month,
      bgColor: Color(0xfffea260).toInt32,
      textColor: Colors.white.toInt32,
    ),
  ];
}
