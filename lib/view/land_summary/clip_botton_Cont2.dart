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
        height: 4.2.h,
        width: 29.w,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color2,
            borderRadius: BorderRadius.circular(15)
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
    path.lineTo(size.width*0.08, 0);
    path.lineTo(0,size.height);
    path.lineTo(size.width*0.92,size.height);
    path.lineTo(size.width,0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}