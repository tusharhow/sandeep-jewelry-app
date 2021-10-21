import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

push({@required context, @required widget}) =>
    Navigator.push(context, CupertinoPageRoute(builder: (context) => widget));

pushRemove({@required context, @required widget}) =>
    Navigator.pushAndRemoveUntil(context,
        CupertinoPageRoute(builder: (context) => widget), (route) => false);