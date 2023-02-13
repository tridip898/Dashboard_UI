import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ClipBottomCont2 extends StatelessWidget {
  final String amount;
  final Color color2;
  const ClipBottomCont2({Key? key, required this.amount, required this.color2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipCont1(),
      child: Container(
        height: 5.6.h,
        width: 29.w,
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color2,
        ),
        child: Text(amount,style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w600,color: Colors.white,fontSize: 12.5.sp),),
      ),
    );
  }
}

class ClipCont1 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final path=Path();
    path.moveTo(size.width*0.35, 10);
    path.quadraticBezierTo(size.width*0.13, 9, size.width*0.10, size.height/3);
    path.lineTo(size.width*0.03, size.height*0.80);
    path.quadraticBezierTo(size.width*0.03, size.height-4, size.width/3, size.height-5);
    path.lineTo(size.width*0.85, size.height-5);
    path.quadraticBezierTo(size.width*.94, size.height-6, size.width*.98, size.height/4);
    path.lineTo(size.width*0.98, size.height*0.20);
    path.quadraticBezierTo(size.width*.99, 10, size.width*.35, 10);
    path.close();
    return path;

  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}