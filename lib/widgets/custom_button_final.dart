import 'package:flutter/material.dart';

class CustomButtonResumeBuild extends StatefulWidget {
  final double? width, height;
  final String? buttonName;
  final Function onTap;
  final Color? buttonColor;
  final TextStyle? textStyle;
  final EdgeInsets? margin, padding;
  final List<Color>? gradientColor;
  const CustomButtonResumeBuild({
    Key? key,
    required this.onTap,
    this.buttonName,
    this.textStyle,
    this.width,
    this.height,
    this.buttonColor,
    this.margin,
    this.padding,
    this.gradientColor,
  }) : super(key: key);

  @override
  State<CustomButtonResumeBuild> createState() =>
      _CustomButtonResumeBuildState();
}

class _CustomButtonResumeBuildState extends State<CustomButtonResumeBuild> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.amber,
        splashFactory: InkSplash.splashFactory,
        onLongPress: () {
          InkSplash.splashFactory;
        },
        onTap: () {
          widget.onTap();
        },
        child: Container(
          margin: widget.margin,
          padding: widget.padding,
          width: widget.width ?? MediaQuery.of(context).size.width * 0.9,
          height: widget.height ?? MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            color: widget.buttonColor ?? Colors.amber,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: const [
              BoxShadow(
                offset: Offset(3, 5),
                color: Color(0xffaeaeae),
                blurRadius: 5,
                spreadRadius: 1.5,
              ),
              BoxShadow(
                offset: Offset(-5, -5),
                color: Color(0xffffffff),
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: widget.gradientColor ??
                  [
                    const Color(0xffffbf00),
                    const Color(0xffffbf00),
                  ],
            ),
          ),
          child: Center(
            child: Text(widget.buttonName ?? 'Generate Resume',
                style: widget.textStyle ??
                    TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    )),
          ),
        ),
      ),
    );
  }
}
