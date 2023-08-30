import 'package:flutter/material.dart';
import 'package:wellbe/widgets/custom_parent_widget.dart';

import '../../../utilites/colors.dart';
import '../../../widgets/custom_inkwell_btn.dart';
import '../../../widgets/custom_text.dart';

class WriteYourPost extends StatefulWidget {
  @override
  State<WriteYourPost> createState() => _WriteYourPostState();
}

class _WriteYourPostState extends State<WriteYourPost>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 300.0, end: 50.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: CustomText(
            title: "Write Your Post",
            fontSize: 17,
            color: blackColor,
            fontWeight: FontWeight.w700,
          ),
          actions: [
            CustomInkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/icons/close.png",
                  scale: 1.1,
                ),
              ),
            ),
            //Space
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Column(children: [
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: kPrimaryColor,
            indent: 18,
            endIndent: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 4,
                            blurRadius: 1,
                            color: lightGrey,
                            offset: Offset(1, 1))
                      ]),
                  child: CircleAvatar(
                      radius: 17,
                      backgroundImage: AssetImage(
                        'assets/icons/user_03.png',
                      )),
                ),
                const SizedBox(
                  width: 9,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomText(
                          title: 'You',
                          fontWeight: FontWeight.w600,
                          color: blackColor,
                          fontSize: 12.5,
                        ),
                        CustomText(
                          title: ' | 1 min ago',
                          fontWeight: FontWeight.w500,
                          color: textGreyColor,
                          fontSize: 12.5,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomText(
                      title:
                          'Alteration in some form,by injected humour,or\nrandomised words',
                      fontWeight: FontWeight.w600,
                      color: textGreyColor2,
                      fontSize: 12.5,
                    ),
                  ],
                )
              ],
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      StylishSwitchButton(
                        initialValue: false,
                        onChanged: (value) {
                          // Handle switch button value change here
                        },
                      ),
                      SizedBox(width: 8.0),
                      CustomText(
                        title: 'Posting as Anonymous',
                        fontSize: 13,
                        color: mediumGreyColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),
                  TextField(
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                        minHeight: 30.0,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Write your post...',
                      suffixIcon: Image.asset(
                        'assets/icons/post_02.png',
                        scale: 1.1,
                      ),
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500, color: greyColor),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
        // bottomNavigationBar: Container(
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.grey.withOpacity(0.5),
        //         spreadRadius: 2,
        //         blurRadius: 5,
        //         offset: Offset(0, 3),
        //       ),
        //     ],
        //   ),
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 18.0),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         Row(
        //           children: [
        //             StylishSwitchButton(
        //               initialValue: false,
        //               onChanged: (value) {
        //                 // Handle switch button value change here
        //               },
        //             ),
        //             SizedBox(width: 8.0),
        //             CustomText(
        //               title: 'Posting as Anonymous',
        //               fontSize: 13,
        //               color: mediumGreyColor,
        //             ),
        //           ],
        //         ),
        //         SizedBox(height: 24.0),
        //         TextField(
        //           decoration: InputDecoration(
        //             constraints: BoxConstraints(
        //               minHeight: 30.0,
        //             ),
        //             border: OutlineInputBorder(
        //               borderSide: BorderSide(color: greyColor, width: 2),
        //               borderRadius: BorderRadius.circular(10.0),
        //             ),
        //             hintText: 'Write your post...',
        //             suffixIcon: Image.asset(
        //               'assets/icons/post_02.png',
        //               scale: 1.1,
        //             ),
        //             hintStyle: TextStyle(
        //                 fontWeight: FontWeight.w500, color: greyColor),
        //             contentPadding:
        //                 EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}

class StylishSwitchButton extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const StylishSwitchButton({
    this.initialValue = false,
    required this.onChanged,
  });

  @override
  _StylishSwitchButtonState createState() => _StylishSwitchButtonState();
}

class _StylishSwitchButtonState extends State<StylishSwitchButton> {
  bool? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value!;
        });
        widget.onChanged(_value!);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        height: 20.0,
        width: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: kPrimaryColor,
        ),
        child: Stack(
          children: [
            Align(
              alignment: _value! ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 15.0,
                height: 15.0,
                margin: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
