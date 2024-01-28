import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialapp/shared/network/local/cache_helper.dart';

class MessageItem {
  bool isConnected;
  int messNotVue;
  String image;
  String date;
  String name;
  String msg;
  final String productName;
  final int quantity;
  final String price;
  final String oldPrice;
  final String email;
  final String status;
  MessageItem(
    this.name,
    this.msg,
    this.isConnected,
    this.image,
    this.messNotVue,
    this.date,
    this.productName,
    this.quantity,
    this.price,
    this.oldPrice,
    this.email,
    this.status,
  );
}

List<MessageItem> msgItemList = [
  MessageItem(
      'Smith Mathew',
      'Hi, David. Hope you’re doing Well',
      true,
      'assets/images/Ellipse 7.png',
      3,
      '21 Feb',
      'Product A',
      5,
      '1580400',
      '80',
      'Smith_Mathew@gmail.com',
      'Waiting for paiement'),
  MessageItem(
      'Malik',
      'Are you ready for today’s part Malika ?',
      false,
      'assets/images/Ellipse 13.png',
      0,
      '02 Mars',
      'Product A',
      10,
      '505000',
      '80',
      'Smith_Mathew@gmail.com',
      'Waiting for paiement'),
  MessageItem(
      'John Walton',
      'I’am sending you a parcel rece',
      false,
      'assets/images/Ellipse 9.png',
      0,
      '19 Jan',
      'Product A',
      15,
      '284000',
      '80',
      'Smith_Mathew@gmail.com',
      'Waiting for paiement'),
  MessageItem(
      'Monica Randawa',
      'Hope you’re doing well today',
      true,
      'assets/images/Ellipse 10.png',
      1,
      '05 Feb',
      'Product A',
      4,
      '3000000',
      '80',
      'Smith_Mathew@gmail.com',
      'Waiting for paiement'),
  MessageItem(
      'Innoxent Jay ',
      'Let’s get back to the work, You',
      true,
      'assets/images/Ellipse 11.png',
      2,
      '27 May',
      'Product A',
      8,
      '270800',
      '80',
      'Smith_Mathew@gmail.com',
      'Waiting for paiement'),
  MessageItem(
      'Harry Samit',
      'Listen david, i have a problem',
      false,
      'assets/images/Ellipse 13.png',
      0,
      '30 Nov',
      'Product A',
      20,
      '6579300',
      '80',
      'Smith_Mathew@gmail.com',
      'Waiting for paiement'),
  MessageItem(
      'Smith Mathew',
      'Hi, David. Hope you’re doing Well',
      true,
      'assets/images/Ellipse 7.png',
      0,
      '07 Mar',
      'Product A',
      13,
      '256000',
      '80',
      'Smith_Mathew@gmail.com',
      'Waiting for paiement'),
  MessageItem(
      'Malik',
      'Are you ready for today’s part Malika ?',
      false,
      'assets/images/Ellipse 9.png',
      0,
      '10 Sep',
      'Product A',
      2,
      '760500',
      '80',
      'Smith_Mathew@gmail.com',
      'Waiting for paiement'),
  MessageItem(
      'John Walton',
      'I’am sending you a parcel rece',
      true,
      'assets/images/Ellipse 11.png',
      4,
      '16 Mar',
      'Product A',
      6,
      '350000',
      '80',
      'Smith_Mathew@gmail.com',
      'Waiting for paiement'),
  MessageItem(
      'Monica Randawa',
      'Hope you’re doing well today..',
      true,
      'assets/images/Ellipse 10.png',
      1,
      '05 Feb',
      'Product A',
      5,
      '269000',
      '80',
      'Smith_Mathew@gmail.com',
      'Waiting for paiement'),
  MessageItem(
      'Innoxent Jay ',
      'Let’s get back to the work, You..',
      false,
      'assets/images/Ellipse 13.png',
      0,
      '02 Mars',
      'Product A',
      19,
      '2200000',
      '80',
      'Smith_Mathew@gmail.com',
      'Waiting for paiement'),
];

List<Widget> imgList = [
  const Image(
    image: AssetImage('assets/images/img_3.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/pan.jpeg'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_3.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/pan.jpeg'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
];
List<Widget> imgList2 = [
  const Image(
    image: AssetImage('assets/images/img_7.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_7.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_7.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_7.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
];
List<Widget> imgList3 = [
  const Image(
    image: AssetImage('assets/images/img_8.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_3.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_8.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_3.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
];
List<Widget> imgList4 = [
  const Image(
    image: AssetImage('assets/images/img_9.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_9.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_9.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_9.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
];
List<Widget> imgList5 = [
  const Image(
    image: AssetImage('assets/images/img_11.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_11.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_11.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_11.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
];
List<Widget> imgList6 = [
  const Image(
    image: AssetImage('assets/images/img_10.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_10.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_10.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_10.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
];
List<Widget> imgList7 = [
  const Image(
    image: AssetImage('assets/images/img_12.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_12.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_12.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_12.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
];
List<Widget> imgList8 = [
  const Image(
    image: AssetImage('assets/images/img_13.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_13.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_13.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_13.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
];
List<Widget> imgList9 = [
  const Image(
    image: AssetImage('assets/images/img_14.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_14.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_14.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('assets/images/img_14.png'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
];
// ignore: non_constant_identifier_names
List<Widget> Paiement = [
  Padding(
    padding: const EdgeInsets.only(right: 5),
    child: Container(
      width: 25.w,
      height: 16.h,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: .4),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Image(
        image: const AssetImage('assets/images/img_1.png'),
        // fit: BoxFit.f,
        width: 20.w,
        height: 15.w,
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.only(right: 5),
    child: Container(
      width: 25.w,
      height: 16.h,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: .4),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Image(
        image: const AssetImage('assets/images/img_1.png'),
        // fit: BoxFit.f,
        width: 20.w,
        height: 15.w,
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.only(right: 5),
    child: Container(
      width: 25.w,
      height: 16.h,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: .4),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Image(
        image: const AssetImage('assets/images/img_1.png'),
        // fit: BoxFit.f,
        width: 20.w,
        height: 15.w,
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.only(right: 5),
    child: Container(
      width: 25.w,
      height: 16.h,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: .4),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Image(
        image: const AssetImage('assets/images/img_1.png'),
        // fit: BoxFit.f,
        width: 20.w,
        height: 15.w,
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.only(right: 5),
    child: Container(
      width: 25.w,
      height: 16.h,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: .4),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Image(
        image: AssetImage('assets/images/img_1.png'),
        // fit: BoxFit.f,
        width: 20.w,
        height: 15.w,
      ),
    ),
  ),
];

String userId = CacheHelper.getData(key: 'UserId');
String userEmail = CacheHelper.getData(key: 'userEmail');
String isLogin = CacheHelper.getData(key: 'isLogin');

Widget loadingLogo() => Center(
      child: Image.asset('assets/images/ADM_logo_animation.gif'),
    );

String? uId;
