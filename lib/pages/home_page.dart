
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  late AnimationController _animationController;
  int  counter =0 ;
  int  directionLine = 200;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this ,
        duration: const Duration(milliseconds:300)
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed){
        _animationController.reset();
        if (directionLine  > 0 ) {
            setState(() {
               counter ++;
            });
        }  else {
          setState(() {
              counter --;
          });
        }
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size _mediaDeviceSize  = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:  Colors.primaries[0].shade900,
      body:Container(
        width: _mediaDeviceSize.width,
        height: _mediaDeviceSize.height,
        color: Colors.primaries[0].shade900,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Container(
               width:_mediaDeviceSize.width,
               height:80,
               alignment: Alignment.center,
               child: AnimatedBuilder(
                 animation: _animationController,
                 builder: (_ ,child ){
                   return Transform.translate(
                       offset: Offset(_animationController.value *directionLine, 0),
                       child: child,
                   );
                 },
                 child: Text(
                   counter.toString(),
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 80
                   ),
                 ),
               ),
             ) ,
             SizedBox(height:20),

             Container(
               width:_mediaDeviceSize.width,
               height:80,
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   MaterialButton(
                      onPressed:()=> _decrement(),
                      minWidth:30,
                      color: Colors.blue,
                      child:const Icon(Icons.exposure_minus_1,color: Colors.white,),
                   ) ,
                  const SizedBox(width:20,),
                   MaterialButton(
                     onPressed:()=>_increment(),
                     minWidth:30,
                     color: Colors.black,
                     child:const Icon(Icons.exposure_plus_1_outlined,color: Colors.white,),
                   )
                 ],
               ),
             )
          ],
        ) ,
      ),
    );
  }

  void  _increment(){
    setState(() {
         directionLine = 200;
    });
    _animationController.forward();
  }

  void _decrement(){
    setState(() {
      directionLine = -200;
    });
    _animationController.forward();
  }

}
