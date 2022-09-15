import 'dart:async';
import 'dart:io';

// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:fluttertoast/fluttertoast.dart';

import 'dart:ui';

import 'package:dinsv/dinsv.dart';
import 'package:dinsv/dinsvResult.dart';
import 'package:dinsv/dinsvUIConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String dinsv_code = "code";
  final String dinsv_result = "result";
  final String dinsv_operator = "operator";
  final String dinsv_widgetLayoutId = "widgetLayoutId";
  final String dinsv_widgetId = "widgetId";
  var controllerPHone = new TextEditingController();

  bool _loading = false;

  String _result = "result=";
  int _code = 0;
  String _content = "content=";

  var ios_uiConfigure;

  final DinsvManager oneKeyLoginManager = new DinsvManager();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('dinsv_flutter demo'),
        ),
        // body: ModalProgressHUD(child: _buildContent(), inAsyncCall: _loading),
        body: Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.amber[600],
          // width: 48.0,
          // height: 48.0,
          child: _buildContent(),
        ),
      ),
    );
  }

  Future<void> initPlatformState() async {
    oneKeyLoginManager.setDebug(true);
    String appId = "7I5nJT7h";
    if (Platform.isIOS) {
      appId = "7I5nJT7h";
    } else if (Platform.isAndroid) {
      appId = "9c1562612a1b";
    }
    //DinsvSDK 初始化
    oneKeyLoginManager.init(appId: appId).then((dinsvResult) {
      setState(() {
        _code = dinsvResult.code ?? 0;
        _result = dinsvResult.message ?? "";
        _content = dinsvResult.toJson().toString();
      });

      if (1000 == dinsvResult.code) {
        //初始化成功
      } else {
        //初始化失败
      }
    });
  }

  Future<void> getPhoneInfoPlatformState() async {
    //DinsvSDK 预取号
    oneKeyLoginManager.getPhoneInfo().then((DinsvResult dinsvResult) {
      setState(() {
        _code = dinsvResult.code ?? 0;
        _result = dinsvResult.message ?? "";
        _content = dinsvResult.toJson().toString();
      });

      if (1000 == dinsvResult.code) {
        //预取号成功
      } else {
        //预取号失败
      }
    });
  }

  Future<void> openLoginAuthPlatformState() async {
    ///DinsvSDK 设置授权页一键登录回调（“一键登录按钮”、返回按钮（包括物理返回键））
    oneKeyLoginManager.setOneKeyLoginListener((DinsvResult dinsvResult) {
      setState(() {
        _code = dinsvResult.code ?? 0;
        _result = dinsvResult.message ?? "";
        _content = dinsvResult.toJson().toString();
      });

      oneKeyLoginManager.setLoadingVisibility(true);

      if (1000 == dinsvResult.code) {
        ///一键登录获取token成功

        oneKeyLoginManager.finishAuthControllerCompletion();
      } else if (1011 == dinsvResult.code) {
        ///点击返回/取消 （强制自动销毁）
        // oneKeyLoginManager.setLoadingVisibility(false);
      } else {
        ///一键登录获取token失败

        //关闭授权页
        oneKeyLoginManager.finishAuthControllerCompletion();
      }
    });

    ///DinsvSDK 拉起授权页
    oneKeyLoginManager.openLoginAuth().then((DinsvResult dinsvResult) {
      setState(() {
        _code = dinsvResult.code ?? 0;
        _result = dinsvResult.message ?? "";
        _content = dinsvResult.toJson().toString();
      });

      if (1000 == dinsvResult.code) {
        //拉起授权页成功
      } else {
        //拉起授权页失败
      }
    });
  }

  Future<void> startAuthenticationState() async {
//    RegExp exp = RegExp(
//        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
//    bool matched = exp.hasMatch(controllerPHone.text);
//    if (controllerPHone.text == null || controllerPHone.text == "") {
//      setState(() {
//        _result = "手机号码不能为空";
//        _content = " code===0" + "\n result===" + _result;
//      });
//      _toast("手机号码不能为空");
//      return;
//    } else if (!matched) {
//      setState(() {
//        _result = "请输入正确的手机号";
//        _content = " code===0" + "\n result===" + _result;
//      });
//      _toast("请输入正确的手机号");
//      return;
//    }

//    //DinsvSDK 本机认证获取token
    oneKeyLoginManager.startAuthentication().then((DinsvResult) {
      setState(() {
        _code = DinsvResult.code ?? 0;
        _result = DinsvResult.message ?? "";
        _content = DinsvResult.toJson().toString();
      });

      if (1000 == DinsvResult.code) {
        //初始化成功
      } else {
        //初始化失败
      }
    });
  }

  Future<void> captchaWithTYParam() async {
    //DinsvSDK 图文验证
    Map param = new Map();
    // 注意配置appid
    param["appId"] = "123";
    Map bizData = new Map();
    bizData["width"] = 275;
    bizData["height"] = 275;
    param["bizData"] = bizData;
    oneKeyLoginManager.captchaWithTYParam(param: param).then((DinsvResult) {
      setState(() {
        _code = DinsvResult.code ?? 0;
        _result = DinsvResult.message ?? "";
        _content = DinsvResult.toJson().toString();
      });
    });
  }

  void setAuthThemeConfig() {
    double screenWidthPortrait =
        window.physicalSize.width / window.devicePixelRatio; //竖屏宽

    DinsvUIConfig dinsvUIConfig = DinsvUIConfig();

    /*iOS 页面样式设置*/
    dinsvUIConfig.ios.isFinish = true;
    dinsvUIConfig.ios.setAuthBGImgPath = "demo_drawable_login_bg";
    dinsvUIConfig.ios.setAuthBGVedioPath = "login_demo_test_vedio";

    dinsvUIConfig.ios.setPreferredStatusBarStyle =
        iOSStatusBarStyle.styleLightContent;
    dinsvUIConfig.ios.setStatusBarHidden = false;
    dinsvUIConfig.ios.setAuthNavHidden = false;
    dinsvUIConfig.ios.setNavigationBarStyle = iOSBarStyle.styleBlack;
    dinsvUIConfig.ios.setAuthNavTransparent = true;

    dinsvUIConfig.ios.setNavText = "测试";
    dinsvUIConfig.ios.setNavTextColor = "#80ADFF";
    dinsvUIConfig.ios.setNavTextSize = 18;

    dinsvUIConfig.ios.setNavReturnImgPath = "nav_button_white";
    dinsvUIConfig.ios.setNavReturnImgHidden = false;

//    dinsvUIConfig.ios.setNavBackBtnAlimentRight = true;

    dinsvUIConfig.ios.setNavigationBottomLineHidden = false;

    dinsvUIConfig.ios.setNavigationTintColor = "#FF6659";
    dinsvUIConfig.ios.setNavigationBarTintColor = "#BAFF8C";
    dinsvUIConfig.ios.setNavigationBackgroundImage = "圆角矩形 2 拷贝@2x";

//    dinsvUIConfig.ios.setNavigationShadowImage =

    dinsvUIConfig.ios.setLogoImgPath = "logo_dinsv_text";
    dinsvUIConfig.ios.setLogoCornerRadius = 30;
    dinsvUIConfig.ios.setLogoHidden = false;

    dinsvUIConfig.ios.setNumberColor = "#499191";
    dinsvUIConfig.ios.setNumberSize = 20;
    dinsvUIConfig.ios.setNumberBold = true;
    dinsvUIConfig.ios.setNumberTextAlignment = iOSTextAlignment.right;

    dinsvUIConfig.ios.setLogBtnText = "测试一键登录";
    dinsvUIConfig.ios.setLogBtnTextColor = "#ffffff";
    dinsvUIConfig.ios.setLoginBtnTextSize = 16;
    dinsvUIConfig.ios.setLoginBtnTextBold = false;
    dinsvUIConfig.ios.setLoginBtnBgColor = "#0000ff";

//    dinsvUIConfig.ios.setLoginBtnNormalBgImage = "2-0btn_15";
//    dinsvUIConfig.ios.setLoginBtnHightLightBgImage = "圆角矩形 2 拷贝";
//    dinsvUIConfig.ios.setLoginBtnDisabledBgImage = "login_btn_normal";

//    dinsvUIConfig.ios.setLoginBtnBorderColor = "#FF7666";
    dinsvUIConfig.ios.setLoginBtnCornerRadius = 20;
//    dinsvUIConfig.ios.setLoginBtnBorderWidth = 2;

    dinsvUIConfig.ios.setPrivacyTextSize = 10;
    dinsvUIConfig.ios.setPrivacyTextBold = false;

    dinsvUIConfig.ios.setAppPrivacyTextAlignment = iOSTextAlignment.center;
    dinsvUIConfig.ios.setPrivacySmhHidden = true;
    dinsvUIConfig.ios.setAppPrivacyLineSpacing = 5;
    dinsvUIConfig.ios.setAppPrivacyNeedSizeToFit = false;
//    dinsvUIConfig.ios.setAppPrivacyLineFragmentPadding = 10;
    dinsvUIConfig.ios.setAppPrivacyAbbreviatedName = "666";
    dinsvUIConfig.ios.setAppPrivacyColor = ["#808080", "#00cc00"];

    dinsvUIConfig.ios.setAppPrivacyNormalDesTextFirst = "Accept";
//    dinsvUIConfig.ios.setAppPrivacyTelecom = "中国移动服务协议";
    dinsvUIConfig.ios.setAppPrivacyNormalDesTextSecond = "and";
    dinsvUIConfig.ios.setAppPrivacyFirst = ["测试连接A", "https://www.baidu.com"];
    dinsvUIConfig.ios.setAppPrivacyNormalDesTextThird = "&";
    dinsvUIConfig.ios.setAppPrivacySecond = ["测试连接X", "https://www.sina.com"];
    dinsvUIConfig.ios.setAppPrivacyNormalDesTextFourth = "、";
    dinsvUIConfig.ios.setAppPrivacyThird = ["测试连接C", "https://www.sina.com"];
    dinsvUIConfig.ios.setAppPrivacyNormalDesTextLast = "to login";

//    dinsvUIConfig.ios.setOperatorPrivacyAtLast = true;
//    dinsvUIConfig.ios.setPrivacyNavText = "Dinsv运营商协议";
//    dinsvUIConfig.ios.setPrivacyNavTextColor = "#7BC1E8";
//    dinsvUIConfig.ios.setPrivacyNavTextSize = 15;
//    dinsvUIConfig.ios.setPrivacyNavReturnImgPath = "close-black";

    dinsvUIConfig.ios.setAppPrivacyWebPreferredStatusBarStyle =
        iOSStatusBarStyle.styleDefault;
    dinsvUIConfig.ios.setAppPrivacyWebNavigationBarStyle =
        iOSBarStyle.styleDefault;

//运营商品牌标签("中国**提供认证服务")，不得隐藏
    dinsvUIConfig.ios.setSloganTextSize = 11;
    dinsvUIConfig.ios.setSloganTextBold = false;
    dinsvUIConfig.ios.setSloganTextColor = "#CEBFFF";
    dinsvUIConfig.ios.setSloganTextAlignment = iOSTextAlignment.center;

    dinsvUIConfig.ios.setCheckBoxHidden = false;
    dinsvUIConfig.ios.setPrivacyState = false;
//    dinsvUIConfig.ios.setCheckBoxVerticalAlignmentToAppPrivacyTop = true;
    dinsvUIConfig.ios.setCheckBoxVerticalAlignmentToAppPrivacyCenterY = true;
    dinsvUIConfig.ios.setUncheckedImgPath = "check_box_un";
    dinsvUIConfig.ios.setCheckedImgPath = "check_box";
    dinsvUIConfig.ios.setCheckBoxWH = [40, 40];
//    dinsvUIConfig.ios.setCheckBoxImageEdgeInsets = [5,10,5,0];

    dinsvUIConfig.ios.setLoadingCornerRadius = 10;
    dinsvUIConfig.ios.setLoadingBackgroundColor = "#E68147";
    dinsvUIConfig.ios.setLoadingTintColor = "#1C7EFF";
    dinsvUIConfig.ios.setLoadingSize = [100, 100];

    dinsvUIConfig.ios.setShouldAutorotate = false;
    dinsvUIConfig.ios.supportedInterfaceOrientations =
        iOSInterfaceOrientationMask.all;
    dinsvUIConfig.ios.preferredInterfaceOrientationForPresentation =
        iOSInterfaceOrientation.portrait;

//    dinsvUIConfig.ios.setAuthTypeUseWindow = false;
//    dinsvUIConfig.ios.setAuthWindowCornerRadius = 10;

    dinsvUIConfig.ios.setAuthWindowModalTransitionStyle =
        iOSModalTransitionStyle.flipHorizontal;
    dinsvUIConfig.ios.setAuthWindowModalPresentationStyle =
        iOSModalPresentationStyle.fullScreen;
    dinsvUIConfig.ios.setAppPrivacyWebModalPresentationStyle =
        iOSModalPresentationStyle.fullScreen;
    dinsvUIConfig.ios.setAuthWindowOverrideUserInterfaceStyle =
        iOSUserInterfaceStyle.unspecified;

    dinsvUIConfig.ios.setAuthWindowPresentingAnimate = true;

    //logo
    dinsvUIConfig.ios.layOutPortrait.setLogoTop = 120;
    dinsvUIConfig.ios.layOutPortrait.setLogoWidth = 120;
    dinsvUIConfig.ios.layOutPortrait.setLogoHeight = 120;
    dinsvUIConfig.ios.layOutPortrait.setLogoCenterX = 0;
    //手机号控件
    dinsvUIConfig.ios.layOutPortrait.setNumFieldCenterY = -20;
    dinsvUIConfig.ios.layOutPortrait.setNumFieldCenterX = 0;
    dinsvUIConfig.ios.layOutPortrait.setNumFieldHeight = 40;
    dinsvUIConfig.ios.layOutPortrait.setNumFieldWidth = 150;
    //一键登录按钮
    dinsvUIConfig.ios.layOutPortrait.setLogBtnCenterY = -20 + 20 + 20 + 15;
    dinsvUIConfig.ios.layOutPortrait.setLogBtnCenterX = 0;
    dinsvUIConfig.ios.layOutPortrait.setLogBtnHeight = 40;
    dinsvUIConfig.ios.layOutPortrait.setLogBtnWidth =
        screenWidthPortrait * 0.67;

    //授权页 slogan（***提供认证服务）
    dinsvUIConfig.ios.layOutPortrait.setSloganHeight = 15;
    dinsvUIConfig.ios.layOutPortrait.setSloganLeft = 0;
    dinsvUIConfig.ios.layOutPortrait.setSloganRight = 0;
    dinsvUIConfig.ios.layOutPortrait.setSloganBottom =
        dinsvUIConfig.ios.layOutPortrait.setLogBtnCenterY! +
            2 * dinsvUIConfig.ios.layOutPortrait.setLogBtnHeight!;

    //隐私协议
//    dinsvUIConfig.ios.layOutPortrait.setPrivacyHeight = 50;
    dinsvUIConfig.ios.layOutPortrait.setPrivacyLeft = 60;
    dinsvUIConfig.ios.layOutPortrait.setPrivacyRight = 60;
    dinsvUIConfig.ios.layOutPortrait.setPrivacyBottom =
        dinsvUIConfig.ios.layOutPortrait.setSloganBottom! +
            dinsvUIConfig.ios.layOutPortrait.setSloganHeight! +
            5;

    List<DinsvCustomWidgetIOS> dinsvCustomWidgetIOS = [];

    final String btn_widgetId = "other_custom_button"; // 标识控件 id
    DinsvCustomWidgetIOS buttonWidgetiOS =
        DinsvCustomWidgetIOS(btn_widgetId, DinsvCustomWidgetType.Button);
    buttonWidgetiOS.textContent = "其他方式登录 >1";
    buttonWidgetiOS.centerY = 100;
    buttonWidgetiOS.centerX = 0;
    buttonWidgetiOS.width = 150;
//    buttonWidgetiOS.left = 50;
//    buttonWidgetiOS.right = 50;
    buttonWidgetiOS.height = 40;
    buttonWidgetiOS.backgroundColor = "#330000";
    buttonWidgetiOS.isFinish = true;
    buttonWidgetiOS.textAlignment = iOSTextAlignment.center;
    buttonWidgetiOS.borderWidth = 2;
    buttonWidgetiOS.borderColor = "#ff0000";

    dinsvCustomWidgetIOS.add(buttonWidgetiOS);

    final String nav_right_btn_widgetId =
        "other_custom_nav_right_button"; // 标识控件 id
    DinsvCustomWidgetIOS navRightButtonWidgetiOS = DinsvCustomWidgetIOS(
        nav_right_btn_widgetId, DinsvCustomWidgetType.Button);
    navRightButtonWidgetiOS.navPosition =
        DinsvCustomWidgetiOSNavPosition.navright;
    navRightButtonWidgetiOS.textContent = "联系客服";
    navRightButtonWidgetiOS.width = 60;
    navRightButtonWidgetiOS.height = 40;
    navRightButtonWidgetiOS.textColor = "#11EF33";
    navRightButtonWidgetiOS.backgroundColor = "#FDECA3";
    navRightButtonWidgetiOS.isFinish = true;
    navRightButtonWidgetiOS.textAlignment = iOSTextAlignment.center;

    dinsvCustomWidgetIOS.add(navRightButtonWidgetiOS);

    dinsvUIConfig.ios.widgets = dinsvCustomWidgetIOS;

    /*Android 页面样式具体设置*/
    dinsvUIConfig.androidPortrait.isFinish = true;
    dinsvUIConfig.androidPortrait.setLogoImgPath = "demo_drawable_logo";
    dinsvUIConfig.androidPortrait.setPrivacyNavColor = "#aa00cc";
    dinsvUIConfig.androidPortrait.setPrivacyNavTextColor = "#00aacc";
    dinsvUIConfig.androidPortrait.setCheckBoxOffsetXY = [10, 5];
    List<DinsvCustomWidgetLayout> dinsvCustomWidgetLayout = [];
    String layout_name = "demo_layout_relative_item_view";
    DinsvCustomWidgetLayout relativeLayoutWidget = DinsvCustomWidgetLayout(
        layout_name, DinsvCustomWidgetLayoutType.RelativeLayout);
    relativeLayoutWidget.top = 380;
    relativeLayoutWidget.widgetLayoutId = ["weixin", "qq", "weibo"];
    dinsvCustomWidgetLayout.add(relativeLayoutWidget);
    List<DinsvCustomWidget> dinsvCustomWidgetAndroid = [];
    DinsvCustomWidget buttonWidgetAndroid =
        DinsvCustomWidget(btn_widgetId, DinsvCustomWidgetType.Button);
    buttonWidgetAndroid.textContent = "其他方式登录 >";
    buttonWidgetAndroid.top = 300;
    buttonWidgetAndroid.width = 150;
//    buttonWidgetAndroid.left = 50;
//    buttonWidgetAndroid.right = 50;
    buttonWidgetAndroid.height = 40;
    buttonWidgetAndroid.backgroundColor = "#330000";
    buttonWidgetAndroid.isFinish = true;
    buttonWidgetAndroid.textAlignment = DinsvCustomWidgetGravityType.center;
    dinsvCustomWidgetAndroid.add(buttonWidgetAndroid);
    dinsvUIConfig.androidPortrait.widgetLayouts = dinsvCustomWidgetLayout;
    dinsvUIConfig.androidPortrait.widgets = dinsvCustomWidgetAndroid;

    dinsvUIConfig.androidPortrait.setActivityTranslateAnim = [
      "demo_amin_activity_bottom_in",
      "demo_amin_activity_bottom_out"
    ];
    //oneKeyLoginManager.setAuthThemeConfig(uiConfig: dinsvUIConfig);
    oneKeyLoginManager.addClikWidgetEventListener((eventId) {
      _toast("点击了：" + eventId);
    });
    oneKeyLoginManager
        .setAuthPageActionListener((AuthPageActionEvent authPageActionEvent) {
      Map map = authPageActionEvent.toMap();
      print("setActionListener" + map.toString());
      _toast("点击：${map.toString()}");
    });

    dinsvUIConfig.androidLandscape.isFinish = true;
    dinsvUIConfig.androidLandscape.setAuthBGImgPath = "demo_drawable_login_bg";
    dinsvUIConfig.androidLandscape.setLogoImgPath = "demo_drawable_logo";
    dinsvUIConfig.androidLandscape.setAuthNavHidden = true;
    dinsvUIConfig.androidLandscape.setLogoOffsetY = 14;
    dinsvUIConfig.androidLandscape.setNumFieldOffsetY = 65;
    dinsvUIConfig.androidLandscape.setSloganOffsetY = 100;
    dinsvUIConfig.androidLandscape.setLogBtnOffsetY = 120;

    List<DinsvCustomWidgetLayout> dinsvCustomWidgetLayoutLand = [];
    String layout_name_land = "demo_layout_relative_item_view";
    DinsvCustomWidgetLayout relativeLayoutWidgetLand = DinsvCustomWidgetLayout(
        layout_name_land, DinsvCustomWidgetLayoutType.RelativeLayout);
    relativeLayoutWidgetLand.top = 200;
    relativeLayoutWidgetLand.widgetLayoutId = ["weixin", "qq", "weibo"];
    dinsvCustomWidgetLayoutLand.add(relativeLayoutWidgetLand);

    dinsvUIConfig.androidLandscape.widgetLayouts = dinsvCustomWidgetLayoutLand;
    oneKeyLoginManager.setAuthThemeConfig(uiConfig: dinsvUIConfig);

    setState(() {
      _content = "界面配置成功";
    });
  }

  void setAuthPopupThemeConfig() {
    double screenWidthPortrait =
        window.physicalSize.width / window.devicePixelRatio; //竖屏宽
    double screenHeightPortrait =
        window.physicalSize.height / window.devicePixelRatio; //竖屏宽

    DinsvUIConfig dinsvUIConfig = DinsvUIConfig();

    /*iOS 页面样式设置*/
    dinsvUIConfig.ios.isFinish = false;
    dinsvUIConfig.ios.setAuthBGImgPath = "demo_drawable_login_bg";
    dinsvUIConfig.ios.setAuthBGVedioPath = "login_demo_test_vedio";

    dinsvUIConfig.ios.setPreferredStatusBarStyle =
        iOSStatusBarStyle.styleLightContent;
    dinsvUIConfig.ios.setStatusBarHidden = false;
    dinsvUIConfig.ios.setAuthNavHidden = false;
    dinsvUIConfig.ios.setNavigationBarStyle = iOSBarStyle.styleBlack;
    dinsvUIConfig.ios.setAuthNavTransparent = true;

    dinsvUIConfig.ios.setNavText = "测试";
    dinsvUIConfig.ios.setNavTextColor = "#80ADFF";
    dinsvUIConfig.ios.setNavTextSize = 18;

    dinsvUIConfig.ios.setNavReturnImgPath = "nav_button_white";
    dinsvUIConfig.ios.setNavReturnImgHidden = false;

//    dinsvUIConfig.ios.setNavBackBtnAlimentRight = true;

    dinsvUIConfig.ios.setNavigationBottomLineHidden = false;

    dinsvUIConfig.ios.setNavigationTintColor = "#FF6659";
    dinsvUIConfig.ios.setNavigationBarTintColor = "#BAFF8C";
    dinsvUIConfig.ios.setNavigationBackgroundImage = "圆角矩形 2 拷贝";

//    dinsvUIConfig.ios.setNavigationShadowImage =

    dinsvUIConfig.ios.setLogoImgPath = "logo_dinsv_text";
//    dinsvUIConfig.ios.setLogoCornerRadius = 30;
    dinsvUIConfig.ios.setLogoHidden = false;

    dinsvUIConfig.ios.setNumberColor = "#499191";
    dinsvUIConfig.ios.setNumberSize = 20;
    dinsvUIConfig.ios.setNumberBold = true;
    dinsvUIConfig.ios.setNumberTextAlignment = iOSTextAlignment.right;

    dinsvUIConfig.ios.setLogBtnText = "测试一键登录";
    dinsvUIConfig.ios.setLogBtnTextColor = "#FFFFFF";
    dinsvUIConfig.ios.setLoginBtnTextSize = 16;
    dinsvUIConfig.ios.setLoginBtnTextBold = false;
    dinsvUIConfig.ios.setLoginBtnBgColor = "#0000FF";

//    dinsvUIConfig.ios.setLoginBtnNormalBgImage = "2-0btn_15";
//    dinsvUIConfig.ios.setLoginBtnHightLightBgImage = "圆角矩形 2 拷贝";
//    dinsvUIConfig.ios.setLoginBtnDisabledBgImage = "login_btn_normal";

//    dinsvUIConfig.ios.setLoginBtnBorderColor = "#FF7666";
    dinsvUIConfig.ios.setLoginBtnCornerRadius = 20;
//    dinsvUIConfig.ios.setLoginBtnBorderWidth = 2;

    dinsvUIConfig.ios.setPrivacyTextSize = 10;
    dinsvUIConfig.ios.setPrivacyTextBold = false;

    dinsvUIConfig.ios.setAppPrivacyTextAlignment = iOSTextAlignment.center;
    dinsvUIConfig.ios.setPrivacySmhHidden = true;
    dinsvUIConfig.ios.setAppPrivacyLineSpacing = 5;
    dinsvUIConfig.ios.setAppPrivacyNeedSizeToFit = false;
//    dinsvUIConfig.ios.setAppPrivacyLineFragmentPadding = 10; 属性已失效
    dinsvUIConfig.ios.setAppPrivacyAbbreviatedName = "666";
    dinsvUIConfig.ios.setAppPrivacyColor = ["#808080", "#00cc00"];

    dinsvUIConfig.ios.setAppPrivacyNormalDesTextFirst = "Accept";
//    dinsvUIConfig.ios.setAppPrivacyTelecom = "中国移动服务协议";
    dinsvUIConfig.ios.setAppPrivacyNormalDesTextSecond = "and";
    dinsvUIConfig.ios.setAppPrivacyFirst = ["测试连接A", "https://www.baidu.com"];
    dinsvUIConfig.ios.setAppPrivacyNormalDesTextThird = "&";
    dinsvUIConfig.ios.setAppPrivacySecond = ["测试连接X", "https://www.sina.com"];
    dinsvUIConfig.ios.setAppPrivacyNormalDesTextFourth = "、";
    dinsvUIConfig.ios.setAppPrivacyThird = ["测试连接C", "https://www.sina.com"];
    dinsvUIConfig.ios.setAppPrivacyNormalDesTextLast = "to login";

//    dinsvUIConfig.ios.setOperatorPrivacyAtLast = true;
//    dinsvUIConfig.ios.setPrivacyNavText = "Dinsv运营商协议";
//    dinsvUIConfig.ios.setPrivacyNavTextColor = "#7BC1E8";
//    dinsvUIConfig.ios.setPrivacyNavTextSize = 15;
//    dinsvUIConfig.ios.setPrivacyNavReturnImgPath = "close-black";

    dinsvUIConfig.ios.setAppPrivacyWebPreferredStatusBarStyle =
        iOSStatusBarStyle.styleDefault;
    dinsvUIConfig.ios.setAppPrivacyWebNavigationBarStyle =
        iOSBarStyle.styleDefault;

//运营商品牌标签("中国**提供认证服务")，不得隐藏
    dinsvUIConfig.ios.setSloganTextSize = 11;
    dinsvUIConfig.ios.setSloganTextBold = false;
    dinsvUIConfig.ios.setSloganTextColor = "#CEBFFF";
    dinsvUIConfig.ios.setSloganTextAlignment = iOSTextAlignment.center;

    dinsvUIConfig.ios.setCheckBoxHidden = false;
    dinsvUIConfig.ios.setPrivacyState = false;
//    dinsvUIConfig.ios.setCheckBoxVerticalAlignmentToAppPrivacyTop = true;
    dinsvUIConfig.ios.setCheckBoxVerticalAlignmentToAppPrivacyCenterY = true;
    dinsvUIConfig.ios.setUncheckedImgPath = "check_box_un";
    dinsvUIConfig.ios.setCheckedImgPath = "check_box";
    dinsvUIConfig.ios.setCheckBoxWH = [40, 40];
    dinsvUIConfig.ios.setCheckBoxImageEdgeInsets = [0, 12, 12, 0];

    dinsvUIConfig.ios.setLoadingCornerRadius = 10;
    dinsvUIConfig.ios.setLoadingBackgroundColor = "#E68147";
    dinsvUIConfig.ios.setLoadingTintColor = "#1C7EFF";
    dinsvUIConfig.ios.setLoadingSize = [100, 100];

    dinsvUIConfig.ios.setShouldAutorotate = false;
    dinsvUIConfig.ios.supportedInterfaceOrientations =
        iOSInterfaceOrientationMask.all;
    dinsvUIConfig.ios.preferredInterfaceOrientationForPresentation =
        iOSInterfaceOrientation.portrait;

    dinsvUIConfig.ios.setAuthTypeUseWindow = true;
    dinsvUIConfig.ios.setAuthWindowCornerRadius = 10;

    dinsvUIConfig.ios.setAuthWindowModalTransitionStyle =
        iOSModalTransitionStyle.flipHorizontal;
//    dinsvUIConfig.ios.setAuthWindowModalPresentationStyle = iOSModalPresentationStyle.fullScreen;
    dinsvUIConfig.ios.setAppPrivacyWebModalPresentationStyle =
        iOSModalPresentationStyle.fullScreen;
    dinsvUIConfig.ios.setAuthWindowOverrideUserInterfaceStyle =
        iOSUserInterfaceStyle.unspecified;

    dinsvUIConfig.ios.setAuthWindowPresentingAnimate = true;

    //弹窗中心位置
    dinsvUIConfig.ios.layOutPortrait.setAuthWindowOrientationCenterX =
        screenWidthPortrait * 0.5;
    dinsvUIConfig.ios.layOutPortrait.setAuthWindowOrientationCenterY =
        screenHeightPortrait * 0.5;

    dinsvUIConfig.ios.layOutPortrait.setAuthWindowOrientationWidth = 300;
    dinsvUIConfig.ios.layOutPortrait.setAuthWindowOrientationHeight =
        screenWidthPortrait * 0.7;

    //logo
    dinsvUIConfig.ios.layOutPortrait.setLogoTop = 40;
    dinsvUIConfig.ios.layOutPortrait.setLogoWidth = 80;
    dinsvUIConfig.ios.layOutPortrait.setLogoHeight = 40;
    dinsvUIConfig.ios.layOutPortrait.setLogoCenterX = 0;
    //手机号控件
    dinsvUIConfig.ios.layOutPortrait.setNumFieldTop = 40 + 40;
    dinsvUIConfig.ios.layOutPortrait.setNumFieldCenterX = 0;
    dinsvUIConfig.ios.layOutPortrait.setNumFieldHeight = 30;
    dinsvUIConfig.ios.layOutPortrait.setNumFieldWidth = 150;
    //一键登录按钮
    dinsvUIConfig.ios.layOutPortrait.setLogBtnTop = 80 + 20 + 20;
    dinsvUIConfig.ios.layOutPortrait.setLogBtnCenterX = 0;
    dinsvUIConfig.ios.layOutPortrait.setLogBtnHeight = 40;
    dinsvUIConfig.ios.layOutPortrait.setLogBtnWidth = 200;

    //授权页 slogan（***提供认证服务）
    dinsvUIConfig.ios.layOutPortrait.setSloganHeight = 15;
    dinsvUIConfig.ios.layOutPortrait.setSloganLeft = 0;
    dinsvUIConfig.ios.layOutPortrait.setSloganRight = 0;
    dinsvUIConfig.ios.layOutPortrait.setSloganBottom =
        dinsvUIConfig.ios.layOutPortrait.setLogBtnTop! +
            2 * dinsvUIConfig.ios.layOutPortrait.setLogBtnHeight!;

    //隐私协议
//    dinsvUIConfig.ios.layOutPortrait.setPrivacyHeight = 50;
    dinsvUIConfig.ios.layOutPortrait.setPrivacyLeft = 30;
    dinsvUIConfig.ios.layOutPortrait.setPrivacyRight = 30;
    dinsvUIConfig.ios.layOutPortrait.setPrivacyBottom =
        dinsvUIConfig.ios.layOutPortrait.setSloganBottom! +
            dinsvUIConfig.ios.layOutPortrait.setSloganHeight!;

    List<DinsvCustomWidgetIOS> dinsvCustomWidgetIOS = [];

    final String btn_widgetId = "other_custom_button"; // 标识控件 id
    DinsvCustomWidgetIOS buttonWidgetiOS =
        DinsvCustomWidgetIOS(btn_widgetId, DinsvCustomWidgetType.Button);
    buttonWidgetiOS.textContent = "其他方式登录 >";
    buttonWidgetiOS.top = 140 + 20 + 10;
    buttonWidgetiOS.centerX = 0;
    buttonWidgetiOS.width = 150;
//    buttonWidgetiOS.left = 50;
//    buttonWidgetiOS.right = 50;
    buttonWidgetiOS.height = 30;
    buttonWidgetiOS.backgroundColor = "#330000";
    buttonWidgetiOS.isFinish = true;
    buttonWidgetiOS.textAlignment = iOSTextAlignment.center;

    dinsvCustomWidgetIOS.add(buttonWidgetiOS);

    final String nav_right_btn_widgetId =
        "other_custom_nav_right_button"; // 标识控件 id
    DinsvCustomWidgetIOS navRightButtonWidgetiOS = DinsvCustomWidgetIOS(
        nav_right_btn_widgetId, DinsvCustomWidgetType.Button);
    navRightButtonWidgetiOS.navPosition =
        DinsvCustomWidgetiOSNavPosition.navright;
    navRightButtonWidgetiOS.textContent = "联系客服";
    navRightButtonWidgetiOS.width = 60;
    navRightButtonWidgetiOS.height = 40;
    navRightButtonWidgetiOS.textColor = "#11EF33";
    navRightButtonWidgetiOS.backgroundColor = "#FDECA3";
    navRightButtonWidgetiOS.isFinish = true;
    navRightButtonWidgetiOS.textAlignment = iOSTextAlignment.center;

    dinsvCustomWidgetIOS.add(navRightButtonWidgetiOS);

    dinsvUIConfig.ios.widgets = dinsvCustomWidgetIOS;

    /*Android 页面样式具体设置*/
    dinsvUIConfig.androidPortrait.isFinish = true;
    dinsvUIConfig.androidPortrait.setLogoImgPath = "demo_drawable_logo";
    dinsvUIConfig.androidPortrait.setDialogTheme = [
      "300",
      "500",
      "0",
      "0",
      "false"
    ];
    dinsvUIConfig.androidPortrait.setBackPressedAvailable = false;
    dinsvUIConfig.androidPortrait.setLogoOffsetY = 20;
    dinsvUIConfig.androidPortrait.setNumFieldOffsetY = 85;
    dinsvUIConfig.androidPortrait.setSloganOffsetY = 110;
    dinsvUIConfig.androidPortrait.setLogBtnOffsetY = 130;
    dinsvUIConfig.androidPortrait.setLogoHeight = 40;
    dinsvUIConfig.androidPortrait.setLogoWidth = 40;
    dinsvUIConfig.androidPortrait.setPrivacyOffsetX = 15;
    dinsvUIConfig.androidPortrait.setCheckBoxOffsetXY = [0, 5];
    dinsvUIConfig.androidPortrait.setCheckBoxMargin = [10, 0, 5, 0];
    dinsvUIConfig.androidPortrait.setCheckedImgPath =
        "demo_drawable_checked_icon";
    dinsvUIConfig.androidPortrait.setUncheckedImgPath =
        "demo_drawable_unchecked_icon";
    dinsvUIConfig.androidPortrait.setAuthBGImgPath =
        "demo_drawable_login_corners_bg";
    List<DinsvCustomWidgetLayout> dinsvCustomWidgetLayout = [];
    String layout_name = "demo_layout_relative_item_view";
    DinsvCustomWidgetLayout relativeLayoutWidget = DinsvCustomWidgetLayout(
        layout_name, DinsvCustomWidgetLayoutType.RelativeLayout);
    relativeLayoutWidget.top = 270;
    relativeLayoutWidget.widgetLayoutId = ["weixin", "qq", "weibo"];
    dinsvCustomWidgetLayout.add(relativeLayoutWidget);
    List<DinsvCustomWidget> dinsvCustomWidgetAndroid = [];
    DinsvCustomWidget buttonWidgetAndroid =
        DinsvCustomWidget(btn_widgetId, DinsvCustomWidgetType.Button);
    buttonWidgetAndroid.textContent = "其他方式登录 >";
    buttonWidgetAndroid.top = 200;
    buttonWidgetAndroid.width = 150;
//    buttonWidgetAndroid.left = 50;
//    buttonWidgetAndroid.right = 50;
    buttonWidgetAndroid.height = 40;
    buttonWidgetAndroid.backgroundColor = "#330000";
    buttonWidgetAndroid.isFinish = true;
    buttonWidgetAndroid.textAlignment = DinsvCustomWidgetGravityType.center;
    dinsvCustomWidgetAndroid.add(buttonWidgetAndroid);
    dinsvUIConfig.androidPortrait.widgetLayouts = dinsvCustomWidgetLayout;
    dinsvUIConfig.androidPortrait.widgets = dinsvCustomWidgetAndroid;

    dinsvUIConfig.androidLandscape.isFinish = true;
    dinsvUIConfig.androidLandscape.setDialogTheme = [
      "420",
      "300",
      "0",
      "0",
      "false"
    ];
    dinsvUIConfig.androidLandscape.setLogoImgPath = "demo_drawable_logo";
    dinsvUIConfig.androidLandscape.setAuthNavHidden = true;
    dinsvUIConfig.androidLandscape.setLogoOffsetY = 14;
    dinsvUIConfig.androidLandscape.setNumFieldOffsetY = 65;
    dinsvUIConfig.androidLandscape.setSloganOffsetY = 100;
    dinsvUIConfig.androidLandscape.setLogBtnOffsetY = 120;

    List<DinsvCustomWidgetLayout> dinsvCustomWidgetLayoutLand = [];
    String layout_name_land = "demo_layout_relative_item_view";
    DinsvCustomWidgetLayout relativeLayoutWidgetLand = DinsvCustomWidgetLayout(
        layout_name_land, DinsvCustomWidgetLayoutType.RelativeLayout);
    relativeLayoutWidgetLand.top = 200;
    relativeLayoutWidgetLand.widgetLayoutId = ["weixin", "qq", "weibo"];
    dinsvCustomWidgetLayoutLand.add(relativeLayoutWidgetLand);

    dinsvUIConfig.androidLandscape.widgetLayouts = dinsvCustomWidgetLayoutLand;
    oneKeyLoginManager.setAuthThemeConfig(uiConfig: dinsvUIConfig);

    oneKeyLoginManager.addClikWidgetEventListener((eventId) {
      _toast("点击了：" + eventId);
    });
    oneKeyLoginManager
        .setAuthPageActionListener((AuthPageActionEvent authPageActionEvent) {
      Map map = authPageActionEvent.toMap();
      print("setActionListener" + map.toString());
      _toast("点击：${map.toString()}");
    });

    setState(() {
      _content = "界面配置成功";
    });
  }

  Widget _buildContent() {
    return Center(
      widthFactor: 2,
      child: new Column(
        children: <Widget>[
          Container(
            color: Colors.greenAccent,
            child: Text(_content),
            width: 300,
            height: 180,
          ),
          Expanded(
            flex: 1,
            child: ListView(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new CustomButton(
                          onPressed: () {
                            initPlatformState();
                          },
                          title: "DinsvSDK  初始化"),
                      new Text("   "),
                      new CustomButton(
                        onPressed: () {
                          getPhoneInfoPlatformState();
                        },
                        title: "DinsvSDK  预取号",
                      ),
                    ],
                  ),
                ),
                new Container(
                  margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new CustomButton(
                          onPressed: () {
                            setAuthThemeConfig();
                          },
                          title: "授权页  沉浸样式"),
                      new Text("   "),
                      new CustomButton(
                        onPressed: () {
                          setAuthPopupThemeConfig();
                        },
                        title: "授权页  弹窗样式",
                      ),
                    ],
                  ),
                ),
                new Container(
                  child: SizedBox(
                    child: new CustomButton(
                      onPressed: () {
                        openLoginAuthPlatformState();
                      },
                      title: "DinsvSDK 拉起授权页",
                    ),
                    width: double.infinity,
                  ),
                  margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
                ),
                // new Container(
                //   child: TextField(
                //     keyboardType: TextInputType.number,
                //     autofocus: false,
                //     style: TextStyle(color: Colors.black),
                //     decoration: InputDecoration(
                //         hintText: "请输入手机号码",
                //         hintStyle: TextStyle(color: Colors.black)),
                //     controller: controllerPHone,
                //     inputFormatters: <TextInputFormatter>[
                //       FilteringTextInputFormatter.digitsOnly, //只输入数字
                //       LengthLimitingTextInputFormatter(11) //限制长度
                //     ],
                //   ),
                //   margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
                // ),
                new Container(
                  child: SizedBox(
                    child: new CustomButton(
                      onPressed: () {
                        initPlatformState();
                      },
                      title: "本机认证 初始化",
                    ),
                    width: double.infinity,
                  ),
                  margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
                ),
                new Container(
                  child: SizedBox(
                    child: new CustomButton(
                      onPressed: () {
                        startAuthenticationState();
                      },
                      title: "本机认证 获取token",
                    ),
                    width: double.infinity,
                  ),
                  margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
                ),
                new Container(
                  child: SizedBox(
                    child: new CustomButton(
                      onPressed: () {
                        captchaWithTYParam();
                      },
                      title: "图文验证",
                    ),
                    width: double.infinity,
                  ),
                  margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
                )
              ],
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );
  }
}

void _toast(String str) {
  Fluttertoast.showToast(
      msg: str,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      fontSize: 16.0);
}

/// 封装 按钮
class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;

  const CustomButton({this.onPressed, this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new FlatButton(
      onPressed: onPressed,
      child: new Text("$title"),
      color: Color(0xff585858),
      highlightColor: Color(0xff888888),
      splashColor: Color(0xff888888),
      textColor: Colors.white,
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
    );
  }
}
