import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ClipBottomCont1 extends StatelessWidget {
  final int num;
  final Color color;
  const ClipBottomCont1({Key? key, required this.num, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipCont1(),
      child: Container(
        height: 4.2.h,
        width: 12.w,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Text(num.toString(),style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w600,color: Colors.white,fontSize: 12.5.sp),),
      ),
    );
  }
}

class ClipCont1 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final path=Path();
    path.lineTo(size.width*0.20, 0);
    path.lineTo(0,size.height);
    path.lineTo(size.width*0.80,size.height);
    path.lineTo(size.width,0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}