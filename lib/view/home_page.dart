import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../model/radial_bar_model.dart';
import 'bar_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'land_summary/clip1.dart';
import 'land_summary/clip2.dart';
import 'land_summary/clip3.dart';
import 'land_summary/clip4.dart';
import 'land_summary/clip_botton_Cont1.dart';
import 'land_summary/clip_botton_Cont2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<ChartData> _chartdata;
  @override
  void initState() {
    // TODO: implement
    _chartdata=chartData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.close,size: 4.h,color: Colors.black,),
          title: Text("Dashboard",style: TextStyle(fontSize: 16.sp,color: Colors.black, fontWeight: FontWeight.w600),),
          centerTitle: true,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children:[ Container(
            width: 100.w,
            child: Column(
              children: [
                //target box
                Container(
                  height: 30.h,
                  width: 100.w,
                  margin: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.5.h),
                  padding: EdgeInsets.only(left: 4.w,right: 4.w,top: 3.h,bottom: 2.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300.withOpacity(0.5),
                        blurRadius: 10
                      )
                    ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 1.2.h,
                                      width: 4.5.w,
                                      decoration: BoxDecoration(
                                        color: Colors.orangeAccent,
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                    SizedBox(width: 3.5.w,),
                                    Text("Yearly Target",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black),)
                                  ],
                                ),
                                Text("75%",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700,color: Colors.green),),
                                SizedBox(height: 1.h,),
                                Row(
                                  children: [
                                    Container(
                                      height: 1.2.h,
                                      width: 4.5.w,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                    SizedBox(width: 3.5.w,),
                                    Text("Quarterly Target",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black),)
                                  ],
                                ),
                                Text("70%",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700,color: Colors.red.shade600),),
                                SizedBox(height: 1.h,),
                                Row(
                                  children: [
                                    Container(
                                      height: 1.2.h,
                                      width: 4.5.w,
                                      decoration: BoxDecoration(
                                          color: Colors.deepPurple,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                    SizedBox(width: 3.5.w,),
                                    Text("Monthly Target",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black),)
                                  ],
                                ),
                                Text("50%",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700,color: Colors.red.shade600),)
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 22.h,
                              child: SfCircularChart(
                                series: <CircularSeries>[
                                  RadialBarSeries<ChartData,String>(
                                    gap: "10%",
                                    dataSource: _chartdata,
                                      trackOpacity: 0.7,
                                      xValueMapper: (ChartData data, _) => data.x,
                                      yValueMapper: (ChartData data, _) => data.y,
                                      pointColorMapper: (ChartData data, _) => data.color,
                                      radius: '85%',
                                      cornerStyle: CornerStyle.bothCurve,
                                    innerRadius: '10%',
                                    maximumValue: 100
                                  )
                                ]
                              ),
                            ),
                          )
                        ],
                      ),
                      Expanded(child: Container()),
                      RichText(text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Status: ",
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.black,
                            )
                          ),
                          TextSpan(
                            text: "Behind the monthly target",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                              color: Colors.red
                            )
                          )
                        ]
                      ))
                    ],
                  ),
                ),

                //barchart box
                Container(
                  height: 38.h,
                  width: 100.w,
                  margin: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300.withOpacity(0.5),
                        blurRadius: 10
                      )
                    ]
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Earned Incentives",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,fontFamily: "Montserrat"),),
                      Expanded(child: Container()),
                      SizedBox(
                        height: 28.h,
                        width: double.infinity,
                        child: BarChartTripleBar(),
                      )
                    ],
                  ),
                ),

                //land summary
                Container(
                  height: 40.h,
                  width: 100.w,
                  margin: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300.withOpacity(0.5),
                            blurRadius: 10
                        )
                      ]
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 4.5.w,
                        top: 1.5.h,
                        child: Text("Land Summary",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,fontFamily: "Montserrat"),),
                      ),
                      //attarct
                      Positioned(
                        left: 0,
                        bottom: 12.h,
                        child: Clip1(),
                      ),
                      Positioned(
                        bottom: 25.h,
                        right: 0.w,
                        child: Row(
                          children: [
                            ClipBottomCont1(
                              num: 9,
                              color: Colors.green.shade600,
                            ),
                            ClipBottomCont2(
                              amount: "8,35,000/=",
                              color2: Colors.green.shade600,
                            )
                          ],
                        ),
                       ),
                      //nurture
                      Positioned(
                        left: 3.8.w,
                        bottom: 11.5.h,
                        child: Clip2(),
                      ),
                      Positioned(
                        bottom: 20.h,
                        right: 2.5.w,
                        child: Row(
                          children: [
                            ClipBottomCont1(
                              num: 7,
                              color: Colors.green.shade700,
                            ),
                            ClipBottomCont2(
                              amount: "5,70,000/=",
                              color2: Colors.green.shade700,
                            )
                          ],
                        ),
                      ),
                      //convert
                      Positioned(
                        left: 7.5.w,
                        bottom: 09.h,
                        child: Clip3(),
                      ),
                      Positioned(
                        bottom: 15.h,
                        right: 6.w,
                        child: Row(
                          children: [
                            ClipBottomCont1(
                              num: 12,
                              color: Colors.green.shade800,
                            ),
                            ClipBottomCont2(
                              amount: "12,60,00/=",
                              color2: Colors.green.shade800,
                            )
                          ],
                        ),
                      ),
                      //negotiation
                      Positioned(
                        left: 12.w,
                        bottom: 6.h,
                        child: Clip4(),
                      ),
                      Positioned(
                        bottom: 10.h,
                        right: 9.5.w,
                        child: Row(
                          children: [
                            ClipBottomCont1(
                              num: 5,
                              color: Colors.green.shade900,
                            ),
                            ClipBottomCont2(
                              amount: "3,90,00/=",
                              color2: Colors.green.shade900,
                            )
                          ],
                        ),
                      ),
                      //closed
                      Positioned(
                        left: 20.w,
                        bottom: 3.h,
                        child: Container(
                          height: 10.h,
                          width: 18.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xff18564B),
                            borderRadius: BorderRadius.circular(100)
                          ),
                          child: Text("Closed",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.sp,color: Colors.white,fontFamily: "Montserrat"),),
                        ),
                      ),
                      Positioned(
                        bottom: 5.h,
                        right: 12.5.w,
                        child: Row(
                          children: [
                            ClipBottomCont1(
                              num: 3,
                              color: Color(0xff18564B),
                            ),
                            ClipBottomCont2(
                              amount: "9,20,00/=",
                              color2: Color(0xff18564B),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                //expanded summary
                Container(
                  height: 70.h,
                  width: 100.w,
                  margin: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300.withOpacity(0.5),
                            blurRadius: 10
                        )
                      ]
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
                  child: Stack(
                    children: [
                      //title
                      Positioned(child: Text("Expanded Summary",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,fontFamily: "Montserrat"),)),
                      //top 3 value
                      Positioned(
                        top: 5.h,
                        left: 2.w,
                        child: Row(
                          children: [
                            ClipBottomCont1(
                              num: 3,
                              color: Colors.green.shade500,
                            ),
                            ClipBottomCont2(
                              amount: "9,20,000/=",
                              color2: Colors.green.shade500,
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10.5.h,
                        left: 2.w,
                        child: Row(
                          children: [
                            ClipBottomCont1(
                              num: 5,
                              color: Colors.green.shade600.withOpacity(1),
                            ),
                            ClipBottomCont2(
                              amount: "3,90,000/=",
                              color2: Colors.green.shade600.withOpacity(1),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 16.h,
                        left: 2.w,
                        child: Row(
                          children: [
                            ClipBottomCont1(
                              num: 8,
                              color: Colors.green.shade700.withOpacity(1),
                            ),
                            ClipBottomCont2(
                              amount: "4,75,000/=",
                              color2: Colors.green.shade700.withOpacity(1),
                            )
                          ],
                        ),
                      ),

                      Positioned(
                        top: 21.h,
                        right: 5.w,
                        child: Center(
                          child: Row(
                            children: [
                              RotatedBox(
                                quarterTurns: 1,
                                child: Container(
                                  height: 4.4.h,
                                  width: 18.w,
                                  margin: EdgeInsets.symmetric(vertical: 1.2.w),
                                  decoration: BoxDecoration(
                                    color: Color(0xff2CA555),
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Center(
                                    child: Text("Won",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w600,fontFamily: "Montserrat",color: Colors.white),)
                                  ),
                                ),
                              ),
                              RotatedBox(
                                quarterTurns: 1,
                                child: Container(
                                  height: 4.4.h,
                                  width: 30.w,
                                  margin: EdgeInsets.symmetric(vertical: 1.2.w),
                                  decoration: BoxDecoration(
                                      color: Color(0xff34C759),
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Center(
                                      child: Text("Onboard",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w600,fontFamily: "Montserrat",color: Colors.white),)
                                  ),
                                ),
                              ),
                              RotatedBox(
                                quarterTurns: 1,
                                child: Container(
                                  height: 4.4.h,
                                  width: 35.w,
                                  margin: EdgeInsets.symmetric(vertical: 1.2.w),
                                  decoration: BoxDecoration(
                                      color: Color(0xffA0C757),
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Center(
                                      child: Text("Feedback Loop",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w600,fontFamily: "Montserrat",color: Colors.white),)
                                  ),
                                ),
                              ),
                              RotatedBox(
                                quarterTurns: 1,
                                child: Container(
                                  height: 4.4.h,
                                  width: 40.w,
                                  margin: EdgeInsets.symmetric(vertical: 1.2.w),
                                  decoration: BoxDecoration(
                                      color: Color(0xffCCC756),
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Center(
                                      child: Text("Customer Success",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w600,fontFamily: "Montserrat",color: Colors.white),)
                                  ),
                                ),
                              ),
                              RotatedBox(
                                quarterTurns: 1,
                                child: Container(
                                  height: 4.4.h,
                                  width: 45.w,
                                  margin: EdgeInsets.symmetric(vertical: 1.2.w),
                                  decoration: BoxDecoration(
                                      color: Color(0xffE2C756),
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Center(
                                      child: Text("Build Relationship",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w600,fontFamily: "Montserrat",color: Colors.white),)
                                  ),
                                ),
                              ),
                              RotatedBox(
                                quarterTurns: 1,
                                child: Container(
                                  height: 4.4.h,
                                  width: 50.w,
                                  margin: EdgeInsets.symmetric(vertical: 1.2.w),
                                  decoration: BoxDecoration(
                                      color: Color(0xffF8C756),
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Center(
                                      child: Text("Expand",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w600,fontFamily: "Montserrat",color: Colors.white),)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //bottom 3 value
                      Positioned(
                        bottom: 12.h,
                        right: 2.w,
                        child: Row(
                          children: [
                            ClipBottomCont1(
                              num: 10,
                              color: Colors.green.shade800,
                            ),
                            ClipBottomCont2(
                              amount: "1,45,000/=",
                              color2: Colors.green.shade800,
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 6.5.h,
                        right: 2.w,
                        child: Row(
                          children: [
                            ClipBottomCont1(
                              num: 7,
                              color: Colors.green.shade900.withOpacity(1),
                            ),
                            ClipBottomCont2(
                              amount: "4,70,000/=",
                              color2: Colors.green.shade900.withOpacity(1),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 1.h,
                        right: 2.w,
                        child: Row(
                          children: [
                            ClipBottomCont1(
                              num: 12,
                              color: Color(0xff18564B),
                            ),
                            ClipBottomCont2(
                              amount: "12,60,000/=",
                              color2: Color(0xff18564B),
                            )
                          ],
                        ),
                      ),
                  ],
                  ),
                ),
              ],
            ),
          ),
        ]
        ),
      ),
    );
  }
}
