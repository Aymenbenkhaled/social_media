import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:marketplace_version_mobile/models/product_model.dart';
// import 'package:marketplace_version_mobile/models/product/product_model_by_sector.dart';

import '../style/colors.dart';

Widget defaultFormField(
        {required TextEditingController controller,
        required TextInputType type,
        String? label,
        String? hint,
        double radius = 0,
        double suffContainerRadius = 15,
        IconData? prefIcon,
        IconData? suffIcon,
        bool is_search = false,
        Color suffIconColor = Colors.white,
        Color? prefIconColor,
        double suffIconSize = 25,
        double? cursorHeight,
        void Function(String)? onSubmit,
        void Function(String)? onChange,
        Function()? onTap,
        required String? Function(String?)? validate,
        bool obscureText = false,
        Function()? suffpressd,
        //required String text,
        Color suffContainerColor = Colors.black,
        Color? labelColor,
        Color? fillColor,
        bool? filled,
        bool border = true,
        bool readonly = false,
        int? maxlength,
        String? countertext,
        double? maxwidth,
        double fontsize = 15,
        InputBorder? enabledBorder}) =>
    TextFormField(
        maxLength: maxlength,
        readOnly: readonly,
        style: TextStyle(
          color: Colors.black,
          fontSize: fontsize,
          height: 1,
        ),
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        validator: validate,
        obscureText: obscureText,
        onTap: onTap,
        cursorHeight: cursorHeight,       
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 9, height: .3),
          enabledBorder: enabledBorder,
          contentPadding: const EdgeInsets.only(left: 10),
          counterText: countertext,
          fillColor: fillColor,
          filled: filled,
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color(0xff8391A1),
            fontSize: 13,
          ),
          labelStyle: TextStyle(
              fontSize: 14,
              color:
                  (labelColor == null) ? const Color(0xff8391A1) : labelColor),
          prefixIcon: prefIcon != null
              ? Icon(
                  prefIcon,
                  color: prefIconColor,
                )
              : null,
          suffixIcon: is_search
              ? Container(
                  //padding: EdgeInsets.symmetric(horizontal: 5),
                  width: 50.w,
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: suffContainerColor,
                    borderRadius:
                        BorderRadius.all(Radius.circular(suffContainerRadius)),
                  ),
                  child: IconButton(
                    onPressed: suffpressd,
                    icon: Icon(
                      suffIcon,
                      color: suffIconColor,
                      size: suffIconSize,
                    ),
                  ),
                )
              : suffIcon != null
                  ? IconButton(
                      onPressed: suffpressd,
                      icon: Icon(
                        suffIcon,
                        color: suffIconColor,
                        size: suffIconSize,
                      ),
                    )
                  : null,
          suffixIconConstraints:
              maxwidth != null ? BoxConstraints(maxWidth: maxwidth) : null,
          labelText: label,
          border: (border == true)
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  // gapPadding: 10,
                )
              : OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(radius),
                ),
        ));

Widget defaultTexButton({
  required Function() function,
  required String text,
  double? textSize,
  Color textColor = defaultColor,
  TextDecoration? textDecoration,
  bool? toUpperCase,
  bool underline = false,
}) =>
    TextButton(
        onPressed: function,
        child: AutoSizeText(
          (toUpperCase == true) ? text.toUpperCase() : text,
          style: TextStyle(
            fontSize: textSize,
            color: textColor,
            decoration: underline ? TextDecoration.underline : null,
          ),
        ));

Widget defaultButton({
  required BuildContext context,
  double width = 200,
  double? height,
  double radius = 30,
  double textSize = 30,
  double iconSize = 20,
  //Color background = Colors.lightBlueAccent,
  bool isUpperCase = true,
  required Function function,
  required String text,
  Color textColor = Colors.white,
  Color buttonColor = defaultColor,
  Color borderColor = Colors.transparent, // New property for border color
  Color iconColor = Colors.white,
  double borderWidth = 0.0,
  bool withIcon = false,
  bool prefxOrSuffx = true, // New property for border width
  double? spaceBtwTextAndIcon,
  IconData? icon,
  required Color color,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: borderColor, // Set the border color
          width: borderWidth,
          // Set the border width
        ),
      ),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          function();
        },
        hoverColor: Colors.blue,
        //(){print('${emailController.text} //// ${passwordController.text} ' );},
        child: withIcon
            ? !prefxOrSuffx
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        isUpperCase ? text.toUpperCase() : text,
                        style: TextStyle(
                          fontSize: textSize,
                          color: textColor,
                        ),
                      ),
                      SizedBox(
                        width: spaceBtwTextAndIcon,
                      ),
                      Icon(
                        icon,
                        color: iconColor,
                        size: iconSize,
                      )
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        color: iconColor,
                        size: iconSize,
                      ),
                      SizedBox(
                        width: spaceBtwTextAndIcon,
                      ),
                      AutoSizeText(
                        isUpperCase ? text.toUpperCase() : text,
                        style: TextStyle(
                          fontSize: textSize,
                          color: textColor,
                        ),
                      ),
                    ],
                  )
            : AutoSizeText(
                isUpperCase ? text.toUpperCase() : text,
                style: TextStyle(
                  fontSize: textSize,
                  color: textColor,
                ),
              ),
      ),
    );

Widget DefaultBackButton({
  required void Function()? function,
}) =>
    InkWell(
      onTap: function,
      child: Container(
        height: 35.h,
        width: 35.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Color(0xffe8ecf4))),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 15,
        ),
      ),
    );

void navPush(context, widget) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}

void navTo(context, widget) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}

void navPushAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false,
  );
}

Widget buildSeparator() {
  return Padding(
    padding: const EdgeInsetsDirectional.only(start: 20),
    child: Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey[500],
    ),
  );
}

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({
    Key? key,
    required this.imagePath,
    this.imgWidth = 200,
    this.imgheight = 200,
  }) : super(key: key);

  final String imagePath;
  final double imgWidth;
  final double imgheight;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: imgWidth,
      height: imgheight,
    );
  }
}

void CustomFlutterToast({
  required BuildContext context,
  required String text,
  required Color color,
  Color textColor = Colors.white,
  int duration = 3,
  ToastGravity gravity = ToastGravity.BOTTOM,
  required IconData icon,
  Color iconColor = Colors.white,
  double radius = 40,
}) {
  FToast fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: color,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ],
    ),
  );

  fToast.showToast(
    child: toast,
    toastDuration: Duration(seconds: duration),
    gravity: gravity,
  );
}

Widget buildListItemFavoris(
    Function(bool? value) check_item,
    bool is_sold_out,
    bool sold,
    MediaQueryData media,
    BuildContext context,
    int index,
    bool is_grid,
    bool edit,
    is_checked) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 7),
    width: 165,
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(20),
    ),
    child: is_sold_out
        ? Stack(children: [
            Opacity(
              opacity: 0.4,
              child: Padding(
                padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: is_grid
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: AssetImage(imgListString[index]),
                              width: double.infinity,
                              height: 110,
                              fit: BoxFit.cover,
                            ),
                          ),
                          //Spacer(),
                          SizedBox(
                            height: 5.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Pan',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14.spMin,
                                    fontWeight: FontWeight.w900),
                              ),
                              //Spacer(),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                '130 Pieces',
                                style: TextStyle(
                                  fontSize: 14.spMin,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                height: 25,
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '100\$',
                                          style: TextStyle(
                                              color: defaultColor,
                                              fontSize: 14.spMin),
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        if (sold)
                                          Text(
                                            '120\$',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationColor: Colors.red,
                                              decorationThickness: 1.3,
                                              fontSize: 14.spMin,
                                            ),
                                          ),
                                      ],
                                    ),
                                    Spacer(),
                                    //SizedBox(width: 7,),
                                    IconButton(
                                      alignment: Alignment.centerRight,
                                      padding: EdgeInsets.zero,
                                      iconSize: 20.r,
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite_border_outlined,
                                      ),
                                      //alignment: Alignment.topCenter,
                                      //visualDensity:VisualDensity.compact,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                  image: AssetImage('assets/images/pan.jpeg'),
                                  width: 153,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              //Spacer(),
                              SizedBox(
                                width: 5.h,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Pan',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14.spMin,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    //Spacer(),
                                    SizedBox(
                                      height: 11.h,
                                    ),
                                    Text(
                                      '130 Pieces',
                                      style: TextStyle(
                                        fontSize: 14.spMin,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Container(
                                      height: 25,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '100\$',
                                                style: TextStyle(
                                                    color: defaultColor,
                                                    fontSize: 14.spMin),
                                              ),
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                              if (sold)
                                                Text(
                                                  '120\$',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    decorationColor: Colors.red,
                                                    decorationThickness: 1.3,
                                                    fontSize: 14.spMin,
                                                  ),
                                                ),
                                            ],
                                          ),
                                          //Spacer(),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          IconButton(
                                            alignment: Alignment.centerRight,
                                            padding: EdgeInsets.zero,
                                            iconSize: 20.r,
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.favorite_border_outlined,
                                            ),
                                            //alignment: Alignment.topCenter,
                                            //visualDensity:VisualDensity.compact,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          AutoSizeText(
                            "Ce produit est actuellement solde out!",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                color: const Color(0xff9B9B9B),
                                fontSize: 14.spMin,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
              ),
            ),
            is_grid
                ? Center(
                    child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Center(
                          child: AutoSizeText(
                            "Ce produit est actuellement solde out!",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.spMin,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  )
                : Container(),
            edit
                ? Row(
                    children: [
                      const Spacer(),
                      Checkbox(
                          fillColor: MaterialStateColor.resolveWith((states) =>
                              is_checked ? Colors.black : Colors.transparent),
                          activeColor: Colors.white,
                          checkColor: Colors.white,
                          value: is_checked,
                          onChanged: check_item),
                    ],
                  )
                : Container()
          ])
        : InkWell(
            onTap: () {}, // navPush(context, ProductDetailsScreen()),
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              child: is_grid
                  ? Stack(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: AssetImage(imgListString[index]),
                              width: double.infinity,
                              height: 110,
                              fit: BoxFit.cover,
                            ),
                          ),
                          //Spacer(),
                          SizedBox(
                            height: 5.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Pan',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14.spMin,
                                    fontWeight: FontWeight.w900),
                              ),
                              //Spacer(),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                '130 Pieces',
                                style: TextStyle(
                                  fontSize: 14.spMin,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              SizedBox(
                                height: 25,
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '100\$',
                                          style: TextStyle(
                                              color: defaultColor,
                                              fontSize: 14.spMin),
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        if (sold)
                                          Text(
                                            '120\$',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationColor: Colors.red,
                                              decorationThickness: 1.3,
                                              fontSize: 14.spMin,
                                            ),
                                          ),
                                      ],
                                    ),
                                    const Spacer(),
                                    //SizedBox(width: 7,),
                                    IconButton(
                                      alignment: Alignment.centerRight,
                                      padding: EdgeInsets.zero,
                                      iconSize: 20.r,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite_border_outlined,
                                      ),
                                      //alignment: Alignment.topCenter,
                                      //visualDensity:VisualDensity.compact,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      edit
                          ? Row(
                              children: [
                                const Spacer(),
                                Checkbox(
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => is_checked
                                            ? Colors.black
                                            : Colors.transparent),
                                    activeColor: Colors.white,
                                    checkColor: Colors.white,
                                    value: is_checked,
                                    onChanged: check_item),
                              ],
                            )
                          : Container()
                    ])
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: const Image(
                            image: AssetImage('assets/images/pan.jpeg'),
                            width: 153,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        //Spacer(),
                        SizedBox(
                          width: 5.h,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Pan',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14.spMin,
                                    fontWeight: FontWeight.w900),
                              ),
                              //Spacer(),
                              SizedBox(
                                height: 11.h,
                              ),
                              Text(
                                '130 Pieces',
                                style: TextStyle(
                                  fontSize: 14.spMin,
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              SizedBox(
                                height: 25,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '100\$',
                                          style: TextStyle(
                                              color: defaultColor,
                                              fontSize: 14.spMin),
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        if (sold)
                                          Text(
                                            '120\$',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationColor: Colors.red,
                                              decorationThickness: 1.3,
                                              fontSize: 14.spMin,
                                            ),
                                          ),
                                      ],
                                    ),
                                    //Spacer(),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    IconButton(
                                      alignment: Alignment.centerRight,
                                      padding: EdgeInsets.zero,
                                      iconSize: 20.r,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite_border_outlined,
                                      ),
                                      //alignment: Alignment.topCenter,
                                      //visualDensity:VisualDensity.compact,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        edit
                            ? Checkbox(
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => is_checked
                                        ? Colors.black
                                        : Colors.transparent),
                                activeColor: Colors.white,
                                checkColor: Colors.white,
                                value: is_checked,
                                onChanged: check_item)
                            : Container()
                      ],
                    ),
            ),
          ),
  );
}

// Widget buildListItemProductsSearch(
//     Function(bool? value) check_item,
//     bool is_sold_out,
//     bool sold,
//     MediaQueryData media,
//     BuildContext context,
//     int index,
//     bool is_grid,
//     bool edit,
//     is_checked,
//     HomeCubit cubit
//     ) {
//   return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 7),
//       width: 165,
//       decoration: BoxDecoration(
//         color: Colors.grey[100],
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Stack(children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Image(
//                 image: NetworkImage(
//                     '${cubit.searchProducts[index].productThumbnailReference}'),
//                 width: double.infinity,
//                 height: 110,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             //Spacer(),
//             SizedBox(
//               height: 5.h,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               //mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Text(
//                   '${cubit.searchProducts[index].productName}',
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                       fontSize: 14.spMin, fontWeight: FontWeight.w900),
//                 ),
//                 //Spacer(),
//                 SizedBox(
//                   height: 3.h,
//                 ),
//                 Text(
//                   '${cubit.searchProducts[index].minQuantity} Pieces',
//                   style: TextStyle(
//                     fontSize: 14.spMin,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 1.h,
//                 ),
//                 SizedBox(
//                   height: 25,
//                   width: double.infinity,
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             '${cubit.searchProducts[index].fixationPrice} ${cubit.searchProducts[index].currency}',
//                             style: TextStyle(
//                                 color: defaultColor, fontSize: 14.spMin),
//                           ),
//                           SizedBox(
//                             width: 3.w,
//                           ),
//                           if (sold)
//                             Text(
//                               '${cubit.searchProducts[index].productThumbnailReference}\$',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 decoration: TextDecoration.lineThrough,
//                                 decorationColor: Colors.red,
//                                 decorationThickness: 1.3,
//                                 fontSize: 14.spMin,
//                               ),
//                             ),
//                         ],
//                       ),
//                       const Spacer(),
//                       //SizedBox(width: 7,),
//                       IconButton(
//                         alignment: Alignment.centerRight,
//                         padding: EdgeInsets.zero,
//                         iconSize: 20.r,
//                         onPressed: () {},
//                         icon: const Icon(
//                           Icons.favorite_border_outlined,
//                         ),
//                         //alignment: Alignment.topCenter,
//                         //visualDensity:VisualDensity.compact,
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//         edit
//             ? Row(
//                 children: [
//                   const Spacer(),
//                   Checkbox(
//                       fillColor: MaterialStateColor.resolveWith((states) =>
//                           is_checked ? Colors.black : Colors.transparent),
//                       activeColor: Colors.white,
//                       checkColor: Colors.white,
//                       value: is_checked,
//                       onChanged: check_item),
//                 ],
//               )
//             : Container()
//       ]));
// }

List<String> imgListString = [
  'assets/images/img_4.png',
  'assets/images/img_5.png',
  'assets/images/img_6.png',
  'assets/images/img_3.png',
  'assets/images/img_4.png',
];

// Widget buildListItem(bool sold, MediaQueryData media, BuildContext context,
//         int index, product) =>
//     InkWell(
//       onTap: () => navPush(
//         context,
//         // BlocProvider(
//         //   create: (context) => ProductDetailsCubit(),
//         //   child: ProductDetailsScreen(id: product.id),
//         // )
//         ProductDetailsScreen(id: product.id),
//       ), //navPush(context, ProductDetailsScreen()),
//       child: Container(
//         padding: const EdgeInsetsDirectional.all(2),
//         width: 165,
//         decoration: BoxDecoration(
//           color: Colors.grey[200],
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 // child: Image(
//                 //   image: NetworkImage('${product.productThumbnailReference}'),
//                 //   width: double.infinity,
//                 //   height: 110,
//                 //   fit: BoxFit.cover,
//                 // ),
//                 child: CachedNetworkImage(
//                   fit: BoxFit.cover,
//                   height: 113,
//                   width: double.infinity,
//                   imageUrl: "${product.productThumbnailReference}",
//                   progressIndicatorBuilder: (context, url, downloadProgress) =>
//                       Center(
//                     child: CircularProgressIndicator(
//                         value: downloadProgress.progress),
//                   ),
//                   errorWidget: (context, url, error) => const Icon(Icons.error),
//                 ),
//               ),
//               Text(
//                 product.productName,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style:
//                     TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.w900),
//               ),
//               Text(
//                 '${product.minQuantity} Pieces',
//                 style: TextStyle(fontSize: 14.spMin, color: Colors.grey[600]),
//               ),
//               SizedBox(
//                 height: 18,
//                 width: double.infinity,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           '${product.fixationPrice}\$',
//                           style: TextStyle(
//                             color: defaultColor,
//                             fontSize: 14.spMin,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 3.w,
//                         ),
//                         // if (sold)
//                         Text(
//                           '120\$',
//                           style: TextStyle(
//                             color: Colors.grey,
//                             decoration: TextDecoration.lineThrough,
//                             decorationColor: Colors.red,
//                             decorationThickness: 1.3,
//                             fontSize: 14.spMin,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Spacer(),
//                     IconButton(
//                       alignment: Alignment.centerRight,
//                       padding: EdgeInsets.zero,
//                       iconSize: 20.r,
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.favorite_border_outlined,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );

Widget buildNosServicesListItem(img, icon, title, text) => InkWell(
      //onTap: () => navPush(context, ProductDetailsScreen()),
      child: SizedBox(
        //padding: EdgeInsets.only(top: 45),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 165,
              height: 195,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(img))),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black54,
                      Colors.black54,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10,
                    top: 35,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          height: .9,
                          //fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              child: CircleAvatar(
                radius: 28,
                backgroundColor: defaultColor,
                child: Icon(
                  icon,
                  size: 35,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );

List<Widget> nosServicesList = [
  buildNosServicesListItem(
      'assets/images/nos_services.jpg',
      Icons.monetization_on_outlined,
      'Payment',
      'Transactions mondiales simplifiées grâce à notre système de paiement rapide, sûr et sécurisé'),
  buildNosServicesListItem(
      'assets/images/garentie.jpg',
      Icons.workspace_premium_outlined,
      'Garentie Commercial',
      '"Garentie Commercial" est un service gratuit de protection des commandes proposé par Algerian Marketplace'),
  buildNosServicesListItem(
    'assets/images/shipping.jpg',
    Icons.local_shipping,
    'Shipping',
    'Livraison rapide et fiable par voie maritime ou aérienne',
  ),
  buildNosServicesListItem(
    'assets/images/shipping.jpg',
    Icons.local_shipping,
    'Shipping',
    'Livraison rapide et fiable par voie maritime ou aérienne',
  ),
  buildNosServicesListItem(
    'assets/images/shipping.jpg',
    Icons.local_shipping,
    'Shipping',
    'Livraison rapide et fiable par voie maritime ou aérienne',
  ),
];

Widget buildDropdownItem(Country country) => SizedBox(
      // width: double.infinity,
      child: Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(
            width: 5.0,
          ),
          Expanded(
              child: Text(
            "${country.name} (${country.isoCode})",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )),
        ],
      ),
    );

// Future? showModal(BuildContext context, AccountCubit cubit) {
//   cubit.fnameController.text = cubit.userData!.data!.firstName!;
//   cubit.lnameController.text = cubit.userData!.data!.lastName!;
//   cubit.phoneController.text = cubit.userData!.data!.phone!;
//   cubit.CompanyController.text = cubit.userData!.data!.countryName!;
//   return showDialog(
//       context: context,
//       builder: (context) {
//         return Dialog(
//           backgroundColor: Colors.grey[100],
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           child: Padding(
//               padding: const EdgeInsets.only(
//                 top: 30,
//                 left: 10,
//                 right: 10,
//                 bottom: 20,
//               ),
//               child: Form(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Center(
//                       child: Container(
//                         height: 4,
//                         width: 40,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8),
//                             color: Colors.grey),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const AutoSizeText(
//                       "Nom",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xff9B9B9B),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     SizedBox(
//                       width: double.infinity,
//                       height: 56,
//                       child: Card(
//                         margin: EdgeInsets.zero,
//                         child: Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: defaultFormField(
//                             controller: cubit.fnameController,
//                             type: TextInputType.text,
//                             border: false,
//                             label: "",
//                             validate: (value) {
//                               if (value!.isEmpty) {
//                                 return "Entrer votre nom";
//                               }
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     const AutoSizeText(
//                       "Prénom",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xff9B9B9B),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     SizedBox(
//                       width: double.infinity,
//                       height: 56,
//                       child: Card(
//                         margin: EdgeInsets.zero,
//                         child: Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: defaultFormField(
//                             controller: cubit.lnameController,
//                             type: TextInputType.text,
//                             label: "",
//                             border: false,
//                             validate: (value) {
//                               if (value!.isEmpty) {
//                                 return "Entrer votre prénom";
//                               }
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     const AutoSizeText(
//                       "Numéro de téléphone",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xff9B9B9B),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     SizedBox(
//                       width: double.infinity,
//                       height: 56,
//                       child: Card(
//                         margin: EdgeInsets.zero,
//                         child: Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: defaultFormField(
//                             controller: cubit.phoneController,
//                             type: TextInputType.text,
//                             border: false,
//                             label: "",
//                             validate: (value) {
//                               if (value!.isEmpty) {
//                                 return "Entrer votre adresse mail";
//                               }
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     const AutoSizeText(
//                       "Pays",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xff9B9B9B),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     SizedBox(
//                       width: double.infinity,
//                       height: 56,
//                       child: Card(
//                         margin: EdgeInsets.zero,
//                         child: Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: CountryPickerDropdown(
//                             isExpanded: true,
//                             initialValue:
//                                 '${cubit.userData!.data!.countryCode}',
//                             itemBuilder: buildDropdownItem,
//                             sortComparator: (Country a, Country b) =>
//                                 a.isoCode.compareTo(b.isoCode),
//                             onValuePicked: (Country country) {
//                               print("${country.name} ${country.isoCode}");
//                               cubit.countryN = country.name;
//                               cubit.countryC = country.isoCode;
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     defaultButton(
//                       width: double.infinity,
//                       height: 50,
//                       radius: 8,
//                       textSize: 16,
//                       context: context,
//                       function: () {
//                         cubit.updateProfile(
//                           fName: cubit.fnameController.text,
//                           lName: cubit.lnameController.text,
//                           phone: cubit.phoneController.text,
//                           countryName: cubit.countryN,
//                           countryCode: cubit.countryC,
//                         );
//                         Navigator.pop(context);
//                       },
//                       text: 'Confirmer',
//                     )
//                   ],
//                 ),
//               )),
//         );
//       });
// }
PreferredSizeWidget defaultAppBar({
  required BuildContext context,
  String? title,
  double titleSpacing = 5.0,
  List<Widget>? actions,
}) {
  return AppBar(
    titleSpacing: titleSpacing,
    title: (title != null) ? Text(title) : null,
    actions: actions,
    leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_outlined),
        onPressed: () {
          Navigator.pop(context);
        }),
  );
}
