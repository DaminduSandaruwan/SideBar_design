import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar>{
  
  AnimationController _animationController;

  StreamController<bool> isSideBarOpenedStreamController;
  Stream<bool> isSideBarOpenedStream;
  StreamSink<bool> isSideBarOpenedSink;

  //final bool isSideBarOpened =true;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSideBarOpenedStreamController = PublishSubject<bool>();
    isSideBarOpenedStream =  isSideBarOpenedStreamController.stream;
    isSideBarOpenedSink=isSideBarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();    
    isSideBarOpenedStreamController.close();
    isSideBarOpenedSink.close();
  }

  void onIconPressed(){
    final animatesdStatus=_animationController.status;
    final isAnimationCompleted = animatesdStatus == AnimationStatus.completed;

    if(isAnimationCompleted){
      isSideBarOpenedSink.add(false);
      _animationController.reverse();
    }else{
      isSideBarOpenedSink.add(true);
      _animationController.forward();
    }

  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSideBarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth-45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 100),
                      ListTile(
                        title: Text(
                          "Developer",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "developer@test.com",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          radius: 35,
                        ),
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.5),
                        indent: 16,
                        endIndent: 16,
                      ),

                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0,-0.9),
                child: GestureDetector(
                  onTap: (){
                    onIconPressed();
                  },
                  child: Container(
                    width: 35,
                    height: 110,
                    color: Colors.red,
                    alignment: Alignment.centerLeft,
                    child: AnimatedIcon(
                      progress: _animationController.view,
                      icon: AnimatedIcons.menu_close,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}