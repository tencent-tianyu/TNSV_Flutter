import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

import 'dinsvResult.dart';
import 'dinsvUIConfig.dart';

/// DinsvSDK 授权页回调（一键登录点击/sdk自带返回）
typedef DinsvOneKeyLoginListener = void Function(DinsvResult dinsvResult);

/// DinsvSDK 自定义控件点击回调
typedef DinsvWidgetEventListener = void Function(String dinsvWidgetEvent);

/// DinsvSDK 授权页点击事件监听（复选框和协议）
typedef AuthPageActionListener = void Function(AuthPageActionEvent event);

class DinsvManager {
  static const MethodChannel _channel = MethodChannel('dinsv');

  final DinsvEventHandlers _eventHanders = new DinsvEventHandlers();

  DinsvUIConfig dinsvUIConfig = new DinsvUIConfig();

  DinsvManager() {
    _channel.setMethodCallHandler(_handlerMethod);
  }

  /// 授权页控件的点击事件（“复选框”、"协议"） Android
  setAuthPageActionListener(AuthPageActionListener callback) {
    _channel.invokeMethod("setActionListener");
    _eventHanders.authPageActionListener = callback;
  }

//  /// 设置调试模式开关 Android
  void setDebug(bool debug) {
    _channel.invokeMethod("setDebugMode", {"debug": debug});
  }

  void getOaidEnable(bool oaidEnable) {
    _channel.invokeMethod("getOaidEnable", {"oaidEnable": oaidEnable});
  }

  void getSinbEnable(bool sinbEnable) {
    _channel.invokeMethod("getSinbEnable", {"sinbEnable": sinbEnable});
  }

  void getSiEnable(bool sibEnable) {
    _channel.invokeMethod("getSiEnable", {"sibEnable": sibEnable});
  }

  void getIEnable(bool iEnable) {
    _channel.invokeMethod("getIEnable", {"iEnable": iEnable});
  }

  void getMaEnable(bool maEnable) {
    _channel.invokeMethod("getMaEnable", {"maEnable": maEnable});
  }

  void getImEnable(bool imEnable) {
    _channel.invokeMethod("getImEnable", {"imEnable": imEnable});
  }

  Future<String> getOperatorType() async {
    return await _channel.invokeMethod("getOperatorType");
  }

  ///DinsvSDK 初始化(Android+iOS)
  Future<DinsvResult> init({required String appId}) async {
    Map result = await _channel.invokeMethod("init", {"appId": appId});
    Map<String, dynamic> newResult = new Map<String, dynamic>.from(result);
    return DinsvResult.fromJson(newResult);
  }

  ///DinsvSDK 预取号(Android+iOS)
  Future<DinsvResult> getPhoneInfo() async {
    Map<dynamic, dynamic> result = await _channel.invokeMethod("getPhoneInfo");
    Map<String, dynamic> newResult = new Map<String, dynamic>.from(result);
    return DinsvResult.fromJson(newResult);
  }

  /// 设置授权页一键登录回调（“一键登录按钮”、返回按钮（包括物理返回键）） (Android+iOS)
  setOneKeyLoginListener(DinsvOneKeyLoginListener callback) {
    _eventHanders.oneKeyLoginListener = callback;
  }

  /// 自定义控件的点击事件 Android
  addClikWidgetEventListener(DinsvWidgetEventListener callback) {
    _eventHanders.dinsvWidgetEventListener = callback;
  }

  ///DinsvSDK 拉起授权页(Android+iOS)
  Future<DinsvResult> openLoginAuth() async {
    if (Platform.isAndroid) {
      Map<dynamic, dynamic> result =
          await _channel.invokeMethod("openLoginAuth");
      Map<String, dynamic> newResult = new Map<String, dynamic>.from(result);
      return DinsvResult.fromJson(newResult);
    } else if (Platform.isIOS) {
      Map iosConfigure = this.dinsvUIConfig.ios.toJson();
      Map<dynamic, dynamic> result =
          await _channel.invokeMethod("openLoginAuth", iosConfigure);
      Map<String, dynamic> newResult = new Map<String, dynamic>.from(result);
      return DinsvResult.fromJson(newResult);
    } else {
      return DinsvResult(code: 1003, message: "拉起授权页失败,暂不支持此设备");
    }
  }

  ///DinsvSDK 主动销毁授权页 Android+IOS
  Future<void> finishAuthControllerCompletion() async {
    if (Platform.isIOS) {
      return await _channel.invokeMethod("finishAuthControllerCompletion");
    } else if (Platform.isAndroid) {
      return await _channel.invokeMethod("finishAuthActivity");
    }
  }

//  Future<void> alertNativeIOS(String title,String message,String cancelButtonTitle,String okButtonTitle,String otherButtonTitle) async {
//    Map alert = {
//      "title":title,
//      "message":message,
//      "cancelButtonTitle":cancelButtonTitle,
//      "okButtonTitle": okButtonTitle,
//      "otherButtonTitle":otherButtonTitle
//    };
//
//    Map<dynamic, dynamic> result = await _channel.invokeMethod("alertNative",alert);
//    Map<String, dynamic> newResult = new Map<String, dynamic>.from(result);
//    return DinsvResult.fromJson(newResult);
//  }

//
  ///DinsvSDK 设置复选框是否选中 Android+IOS
  void setCheckBoxValue(bool isChecked) {
    _channel.invokeMethod("setCheckBoxValue", {"isChecked": isChecked});
  }

  ///DinsvSDK 设置授权页loading是否隐藏 Android+IOS
  void setLoadingVisibility(bool visibility) {
    _channel.invokeMethod("setLoadingVisibility", {"visibility": visibility});
  }

  ///DinsvSDK 本机号校验获取token (Android+iOS)
  Future<DinsvResult> startAuthentication() async {
    Map<dynamic, dynamic> result =
        await _channel.invokeMethod("startAuthentication");
    Map<String, dynamic> newResult = new Map<String, dynamic>.from(result);
    return DinsvResult.fromJson(newResult);
  }

  /// 清除预取号缓存
  void clearScripCache() {
    _channel.invokeMethod("clearScripCache");
  }


  ///DinsvSDK 图文验证(Android+iOS)
  Future<DinsvResult> captchaWithTYParam({required Map param}) async {
    Map result = await _channel.invokeMethod("captchaWithTYParam", param);
    Map<String, dynamic> newResult = new Map<String, dynamic>.from(result);
    return DinsvResult.fromJson(newResult);
  }

  ///DinsvSDK 配置授权页 Android
  void setAuthThemeConfig({required DinsvUIConfig uiConfig}) {
    dinsvUIConfig = uiConfig;
    if (Platform.isIOS) {
      print("uiConfig====" + uiConfig.ios.toJson().toString());
    } else if (Platform.isAndroid) {
      Map<String, dynamic> uiConfig_json = uiConfig.toJson();
      _channel.invokeMethod("setAuthThemeConfig", uiConfig_json);
      print("uiConfig====" + uiConfig.androidLandscape.toJson().toString());
    }
  }

  //Android
  Future<void> _handlerMethod(MethodCall call) async {
    switch (call.method) {
      case 'onReceiveAuthPageEvent':
        Map<String, dynamic> newResult =
            new Map<String, dynamic>.from(call.arguments);
        DinsvResult result = DinsvResult.fromJson(newResult);
        _eventHanders.oneKeyLoginListener?.call(result);
        break;
      case 'onReceiveClickWidgetEvent':
        {
          String widgetId = call.arguments.cast<dynamic, dynamic>()['widgetId'];
          print("点击了：" + widgetId);
          if (null != widgetId) {
            _eventHanders.dinsvWidgetEventListener?.call(widgetId);
          }
        }
        break;
      case 'onReceiveAuthEvent':
        Map json = call.arguments.cast<dynamic, dynamic>();
        AuthPageActionEvent ev = AuthPageActionEvent.fromJson(json);
        _eventHanders.authPageActionListener?.call(ev);
        break;
      default:
        throw new UnsupportedError("Unrecognized Event");
    }
  }
}

/// DinsvSDK 授权页默认控件点击事件
class AuthPageActionEvent {
  final int type; //类型
  final int code; //返回码
  final String message; //事件描述

  AuthPageActionEvent.fromJson(Map<dynamic, dynamic> json)
      : type = json['type'],
        code = json['code'],
        message = json['message'];

  Map toMap() {
    return {'type': type, 'code': code, 'message': message};
  }
}

/// DinsvSDK 自定义控件点击事件
class DinsvWidgetEvent {
  final String widgetLayoutId; //点击的控件id
  DinsvWidgetEvent.fromJson(Map<dynamic, dynamic> json)
      : widgetLayoutId = json['widgetLayoutId'];

  Map toMap() {
    return {'widgetLayoutId': widgetLayoutId};
  }
}

class DinsvEventHandlers {
  DinsvOneKeyLoginListener? oneKeyLoginListener;
  DinsvWidgetEventListener? dinsvWidgetEventListener;
  AuthPageActionListener? authPageActionListener;
}
