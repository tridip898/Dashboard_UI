import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Clip3 extends StatefulWidget {
  const Clip3({Key? key}) : super(key: key);

  @override
  State<Clip3> createState() => _Clip3State();
}

class _Clip3State extends State<Clip3> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Triangle4(),
      child: Container(
        height: 14.h,
        width: 41.w,
        padding: EdgeInsets.all(15),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            color: Colors.green.shade800,
          borderRadius: BorderRadius.circular(100)
        ),
        child: Text("Convert",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w600,color: Colors.white,fontSize: 12.sp),),
      ),
    );
  }
}

class Triangle4 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final path=Path();
    path.lineTo(0, 0);
    path.lineTo(size.width*0.3,size.height);
    path.lineTo(size.width*0.75,size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}