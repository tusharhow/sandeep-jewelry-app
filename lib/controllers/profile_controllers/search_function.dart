import 'dart:math';
import 'package:flutter/material.dart';

class SearchFunction extends StatefulWidget {
  @override
  _SearchFunctionState createState() => _SearchFunctionState();
}

int toggle = 0;

class _SearchFunctionState extends State<SearchFunction>
    with SingleTickerProviderStateMixin {
  late AnimationController _con;
  late TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _con = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 375),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 90.0,
        width: 250.0,
        alignment: const Alignment(1.0, 0.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 375),
          height: 40.0,
          width: (toggle == 0) ? 40.0 : 250.0,
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: -10.0,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 375),
                top: 6.0,
                right: 7.0,
                curve: Curves.easeOut,
                child: AnimatedOpacity(
                  opacity: (toggle == 0) ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      // color: Color(0xffF2F3F7),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: AnimatedBuilder(
                      builder: (context, widget) {
                        return Transform.rotate(
                          angle: _con.value * 2.0 * pi,
                          child: widget,
                        );
                      },
                      animation: _con,
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 375),
                left: (toggle == 0) ? 20.0 : 40.0,
                curve: Curves.easeOut,
                top: 11.0,
                child: AnimatedOpacity(
                  opacity: (toggle == 0) ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  child: SizedBox(
                    height: 35.0,
                    width: 180.0,
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: _textEditingController,
                      cursorRadius: const Radius.circular(10.0),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: const TextStyle(
                          color: Colors.black87,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(30.0),
                child: IconButton(
                  splashRadius: 19.0,
                  icon: const Icon(Icons.search, color: Colors.black),
                  onPressed: () {
                    setState(
                      () {
                        if (toggle == 0) {
                          toggle = 1;
                          // _con.forward();
                        } else {
                          toggle = 0;
                          _textEditingController.clear();
                          _con.reverse();
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
