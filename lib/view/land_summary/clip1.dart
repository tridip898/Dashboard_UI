import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Clip1 extends StatefulWidget {
  const Clip1({Key? key}) : super(key: key);

  @override
  State<Clip1> createState() => _Clip1State();
}

class _Clip1State extends State<Clip1> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Triangle1(),
      child: Container(
        height: 21.h,
        width: 55.w,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.green.shade500,
          borderRadius: BorderRadius.circular(100)
        ),
        child: Text("Attract",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w600,color: Colors.white,fontSize: 12.5.sp),),
      ),
    );
  }
}

class Triangle1 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final path=Path();
    path.lineTo(0, 0);
    path.lineTo(size.width*0.30,size.height);
    path.lineTo(size.width*0.75,size.height);
    path.lineTo(size.width,0);
    //path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}