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
        height: 5.4.h,
        width: 12.w,
        alignment: Alignment.center,
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
    path.moveTo(size.width*0.40, 10);
    path.quadraticBezierTo(size.width*0.27, 9, size.width*0.25, size.height/3);
    path.lineTo(size.width*0.12, size.height*0.80);
    path.quadraticBezierTo(size.width*0.10, size.height-5, size.width/3, size.height-5);
    path.lineTo(size.width*0.75, size.height-5);
    path.quadraticBezierTo(size.width*.87, size.height-6, size.width*.98, size.height/4);
    path.lineTo(size.width*0.98, size.height*0.20);
    path.quadraticBezierTo(size.width, 10, size.width*.35, 10);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}