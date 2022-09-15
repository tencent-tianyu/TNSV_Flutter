/*
* DinsvSDK 授权页UI 配置类
* */

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dinsvUIConfig.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class DinsvUIConfig {
  DinsvUIConfigIOS _ios = new DinsvUIConfigIOS(); //iOS
  // ignore: unnecessary_getters_setters
  set ios(DinsvUIConfigIOS ios) => _ios;

  // ignore: unnecessary_getters_setters
  DinsvUIConfigIOS get ios {
    if (_ios == null) {
      _ios = new DinsvUIConfigIOS();
    }
    return _ios;
  }

  DinsvUIConfigAndroid _androidPortrait =
      new DinsvUIConfigAndroid(); //Android竖屏
  DinsvUIConfigAndroid _androidLandscape =
      new DinsvUIConfigAndroid(); //Android横屏

  // ignore: unnecessary_getters_setters,
  set androidPortrait(DinsvUIConfigAndroid androidPortrait) => _androidPortrait;

  // ignore: unnecessary_getters_setters
  DinsvUIConfigAndroid get androidPortrait {
    if (_androidPortrait == null) {
      _androidPortrait = new DinsvUIConfigAndroid();
    }
    return _androidPortrait;
  }

  // ignore: unnecessary_getters_setters
  set androidLandscape(DinsvUIConfigAndroid androidLandscape) =>
      _androidLandscape;

  // ignore: unnecessary_getters_setters
  DinsvUIConfigAndroid get androidLandscape {
    if (_androidLandscape == null) {
      _androidLandscape = new DinsvUIConfigAndroid();
    }
    return _androidLandscape;
  }

  DinsvUIConfig();

  //反序列化
  factory DinsvUIConfig.fromJson(Map<String, dynamic> json) =>
      _$DinsvUIConfigFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$DinsvUIConfigToJson(this);
}

///*iOS独有*/
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class DinsvUIConfigIOS {
  /// 外部手动管理关闭界面 BOOL,default is NO
  bool? isFinish;

  /// 授权页-背景图片(优先使用视频背景)
  String? setAuthBGImgPath;

  /// 授权页-背景视频
  String? setAuthBGVedioPath;

  /// 状态栏样式
  iOSStatusBarStyle? setPreferredStatusBarStyle;

  ///状态栏隐藏
  bool? setStatusBarHidden;

  ///导航栏
  bool? setAuthNavHidden;

  /// 导航栏 是否隐藏 BOOL default is NO
  iOSBarStyle? setNavigationBarStyle;

  /// 导航栏样式
  bool? setAuthNavTransparent;

  /// 导航栏 背景透明 BOOL

  /// 导航栏标题*/
  String? setNavText; //设置导航栏标题文字
  String? setNavTextColor; //设置导航栏标题文字颜色
  int? setNavTextSize; //设置导航栏标题文字大小

  /**导航栏右侧自定义按钮*/
//  @property (nonatomic,strong)UIBarButtonItem * clNavigationRightControl;
  /**导航栏左侧自定义按钮*/
//  @property (nonatomic,strong)UIBarButtonItem * clNavigationLeftControl;

// 返回按钮
  String? setNavReturnImgPath;

  /// 导航栏左侧返回按钮图片
  bool? setNavReturnImgHidden;

  // /// 物理返回键是否有效
  // bool? setBackPressedAvailable;

  /// 导航栏自带返回按钮隐藏，默认显示 BOOL

  /// 返回按钮图片缩进 btn.imageInsets = UIEdgeInsetsMake(0, 0, 20, 20)*/
//  @property (nonatomic,strong)NSValue * clNavBackBtnImageInsets;

  /// 自带返回(关闭)按钮位置 默认NO 居左,设置为YES居右显示
  bool? setNavBackBtnAlimentRight;

  /// 导航栏分割线 是否隐藏
  /// set backgroundImage=UIImage.new && shadowImage=UIImage.new
  /// BOOL, default is NO
  /// eg.@(YES)
  bool? setNavigationBottomLineHidden;

  /// 导航栏 渲染色*/
  String? setNavigationTintColor;

  /// 导航栏 背景色 default is white*/
  String? setNavigationBarTintColor;

  /// 导航栏 背景图片
  String? setNavigationBackgroundImage;

  /// /// 导航栏 导航栏底部分割线（图片）
  String? setNavigationShadowImage;

  ///LOGO图片
  String? setLogoImgPath;

  /// LOGO圆角
  num? setLogoCornerRadius;

  /// LOGO显隐
  bool? setLogoHidden;

  //手机号显示控件
  String? setNumberColor;

  /// 号码栏字体颜色
  num? setNumberSize;

  /// 号码栏字体
  /// 号码栏字体是否加粗（true：加粗；false：不加粗）
  bool? setNumberBold;

  /// 手机号对齐方式
  iOSTextAlignment? setNumberTextAlignment;

//一键登录按钮 !不得隐藏
  /// 按钮文字
  String? setLogBtnText;

  /// 按钮文字颜色
  String? setLogBtnTextColor;

  /// 号码栏字体
  num? setLoginBtnTextSize;

  /// 号码栏字体是否加粗
  bool? setLoginBtnTextBold;

  /// 按钮背景颜色
  String? setLoginBtnBgColor;

  /// 按钮背景图片
  String? setLoginBtnNormalBgImage;

  /// 按钮背景高亮图片
  String? setLoginBtnHightLightBgImage;

  /// 按钮背景不可用图片
  String? setLoginBtnDisabledBgImage;

  /// 按钮边框颜色
  String? setLoginBtnBorderColor;

  /// 按钮圆角
  num? setLoginBtnCornerRadius;

  /// 按钮边框线框
  num? setLoginBtnBorderWidth;

/*隐私条款Privacy
 注： 运营商隐私条款 不得隐藏
 用户条款不限制
 **/
  List<String>? setAppPrivacyColor;

  ///设置隐私条款文字颜色，包含两个参数：1.基础文字颜色 2.协议文字颜色,eg. ["#FFD13D","#CAACE1"]

  /**隐私条款文字字体*/

  /// 设置隐私栏字体大小
  num? setPrivacyTextSize;

  /// 设置协议栏字体是否加粗
  bool? setPrivacyTextBold;

  /// 隐私条款文字对齐方式
  iOSTextAlignment? setAppPrivacyTextAlignment;

  /// 运营商隐私条款书名号
  bool? setPrivacySmhHidden;

  /// 多行时行距
  num? setAppPrivacyLineSpacing;

  /// 是否需要sizeToFit,设置后与宽高约束的冲突请自行考虑
  bool? setAppPrivacyNeedSizeToFit;

  /**UITextView.textContainerInset 文字与TextView控件内边距 UIEdgeInset  eg.[NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(2, 2, 2, 2)]*/
//  @property (nonatomic,strong)NSValue* clAppPrivacyTextContainerInset;
//  num setAppPrivacyLineFragmentPadding;          /// 文字与TextView控件左右内边距
  /**UITextView.contentInset UIEdgeInset eg.[NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(2, 2, 2, 2)]*/
//  @property (nonatomic,strong)NSValue* clAppPrivacyContentInset;

  /// 隐私条款--APP名称简写 默认取CFBundledisplayname 设置描述文本四后此属性无效
  String? setAppPrivacyAbbreviatedName;

  /// 隐私条款一:需同时设置Name和UrlString
  List<String>? setAppPrivacyFirst;

  /// 隐私条款二:需同时设置Name和UrlString
  List<String>? setAppPrivacySecond;

  /// 隐私条款三:需同时设置Name和UrlString
  List<String>? setAppPrivacyThird;

/*
 隐私协议文本拼接: DesTextFirst+运营商条款+DesTextSecond+隐私条款一+DesTextThird+隐私条款二+DesTextFourth+隐私条款三+DesTextLast
 **/

  /// 描述文本 首部 default:"同意"
  String? setAppPrivacyNormalDesTextFirst;

  /// 描述文本二 default:"和"
  String? setAppPrivacyNormalDesTextSecond;

  /// 描述文本三 default:"、"
  String? setAppPrivacyNormalDesTextThird;

  /// 描述文本四 default:"、"
  String? setAppPrivacyNormalDesTextFourth;

  /// 描述文本 尾部 default: "并授权AppName使用认证服务"
  String? setAppPrivacyNormalDesTextLast;

  /// CheckBox未选中提示文本
  String? setCheckBoxTipMsg;

  ///  使用sdk内部“一键登录”按钮点击时的吐丝提示("请勾选协议") - NO:默认使用sdk内部吐丝 YES:禁止使用
  bool? setCheckBoxTipDisable;

  /// 运营商协议后置
  bool? setOperatorPrivacyAtLast;

//  String setPrivacyNavText;         /// 协议页导航栏统一标题，默认显示条款名称
  /// 协议页导航栏标题文字颜色
  String? setPrivacyNavTextColor;

  /// 协议页标题文字大小
  num? setPrivacyNavTextSize;

  /// 隐私协议WEB页面导航返回按钮图片
  String? setPrivacyNavReturnImgPath;

  /// 协议页状态栏样式
  iOSStatusBarStyle? setAppPrivacyWebPreferredStatusBarStyle;

  /// 协议页导航栏样式
  iOSBarStyle? setAppPrivacyWebNavigationBarStyle;

  ///协议页导航栏其他属性
  String? setAppPrivacyWebNavigationTintColor;
  String? setAppPrivacyWebNavigationBarTintColor;
  String? setAppPrivacyWebNavigationBackgroundImage;

  /**UINavigationBarMetrics*/
//  @property (nonatomic,strong)NSNumber * clAppPrivacyWebNavigationBarMetrics;
  String? setAppPrivacyWebNavigationShadowImage;

//运营商品牌标签("中国**提供认证服务")，不得隐藏
  /// slogan文字字体大小
  num? setSloganTextSize;

  /// slogan文字字体是否加粗
  bool? setSloganTextBold;

  /// slogan文字颜色
  String? setSloganTextColor;

  /// slogan文字对齐方式
  iOSTextAlignment? setSloganTextAlignment;

  /// slogan是否隐藏

/*CheckBox
 *协议勾选框，默认选中且在协议前显示
 *可在sdk_oauth.bundle中替换checkBox_unSelected、checkBox_selected图片
 *也可以通过属性设置选中和未选择图片
 **/

  /// 协议勾选框（默认显示,放置在协议之前）BOOL
  bool? setCheckBoxHidden;

  /// 协议勾选框默认值（默认选中）BOOL
  bool? setPrivacyState;

  /// 协议勾选框 宽高 eg. [40,40]
  List<num>? setCheckBoxWH;

  /// 协议勾选框 UIButton.image图片缩进,eg. [2, 2, 2, 2]
  List<num>? setCheckBoxImageEdgeInsets;

  /// 设置是否CheckBox顶部与隐私协议控件顶部对齐
  bool? setCheckBoxVerticalAlignmentToAppPrivacyTop;

  /// 设置是否CheckBox顶部与隐私协议控件竖向中心对齐，!!!与setCheckBoxVerticalAlignmentToAppPrivacyTop 同时只需设置一个
  bool? setCheckBoxVerticalAlignmentToAppPrivacyCenterY;

  /// 协议勾选框 非选中状态图片
  String? setUncheckedImgPath;

  /// 协议勾选框 选中状态图片
  String? setCheckedImgPath;

  /**授权页自定义 "请勾选协议"提示框
      - containerView为loading的全屏蒙版view
      - 请自行在containerView添加自定义提示
   */
//  @property (nonatomic,copy)void(^checkBoxTipView)(UIView * containerView);

/*Loading*/

  /// Loading 大小
  List<num>? setLoadingSize;

  /// Loading 圆角
  num? setLoadingCornerRadius;

  /// Loading 背景色
  String? setLoadingBackgroundColor;

  /**UIActivityIndicatorViewStyle eg.@(UIActivityIndicatorViewStyleWhiteLarge)*/
//  @property (nonatomic,strong) NSNumber *clLoadingIndicatorStyle;

  /// Loading Indicator渲染色
  String? setLoadingTintColor;

  ///自定义控件
  List<DinsvCustomWidgetIOS>? widgets;

  /**授权页自定义Loading
      - containerView为loading的全屏蒙版view
      - 请自行在containerView添加自定义loading
      - 设置block后，上述loading属性将无效
   */
//  @property (nonatomic,copy)void(^loadingView)(UIView * containerView);

//添加自定义控件
  /**可设置背景色及添加控件*/
//  @property (nonatomic,copy)void(^customAreaView)(UIView * customAreaView);
  /**设置隐私协议弹窗*/
//  @property (nonatomic,copy)void(^customPrivacyAlertView)(UIViewController * authPageVC);

//横竖屏
  /// 是否支持自动旋转
  bool? setShouldAutorotate;

/*支持方向
 - 如果设置只支持竖屏，只需配置竖屏布局layOutPortrait
 - 如果设置只支持横屏，只需设置横屏布局layOutLandscape
 - 横竖屏均支持，需同时设置竖屏布局layOutPortrait和横屏布局layOutLandscape
 */
  iOSInterfaceOrientationMask? supportedInterfaceOrientations;

  /// 默认方向
  iOSInterfaceOrientation? preferredInterfaceOrientationForPresentation;

  /// 以窗口方式显示
  bool? setAuthTypeUseWindow;

  /// 窗口圆角
  num? setAuthWindowCornerRadius;

  /// 系统自带的弹出动画
  iOSModalTransitionStyle? setAuthWindowModalTransitionStyle;

/* UIModalPresentationStyle
 * 若使用窗口模式，请设置为UIModalPresentationOverFullScreen 或不设置
 * iOS13强制全屏，请设置为UIModalPresentationFullScreen
 * UIModalPresentationAutomatic API_AVAILABLE(ios(13.0)) = -2
 * 默认UIModalPresentationFullScreen
 * eg. @(UIModalPresentationOverFullScreen)
 */

  /// 授权页弹出样式
  iOSModalPresentationStyle? setAuthWindowModalPresentationStyle;

  /// 协议页弹出样式。当授权页使用窗口模式时，协议页强制使用模态弹出，此时此属性有效
  iOSModalPresentationStyle? setAppPrivacyWebModalPresentationStyle;

/* UIUserInterfaceStyle
 * UIUserInterfaceStyleUnspecified - 不指定样式，跟随系统设置进行展示
 * UIUserInterfaceStyleLight       - 明亮
 * UIUserInterfaceStyleDark,       - 暗黑 仅对iOS13+系统有效
 */
/*授权页 UIUserInterfaceStyle,默认:UIUserInterfaceStyleLight,eg. @(UIUserInterfaceStyleLight)*/
  iOSUserInterfaceStyle? setAuthWindowOverrideUserInterfaceStyle;

  /// 授权页面present弹出时animate动画设置，默认带动画
  bool? setAuthWindowPresentingAnimate;

  /**弹窗的MaskLayer，用于自定义窗口形状*/
//  @property (nonatomic,strong) CALayer * clAuthWindowMaskLayer;

  //布局设置
  DinsvOrientationLayOutIOS _layOutPortrait = new DinsvOrientationLayOutIOS();

  /// 横屏下使用的布局
  DinsvOrientationLayOutIOS _layOutLandscape = new DinsvOrientationLayOutIOS();

  /// 竖屏下使用的布局(不需要则不设置)

  // ignore: unnecessary_getters_setters,
  set layOutPortrait(DinsvOrientationLayOutIOS layOutPortrait) =>
      _layOutPortrait;

  // ignore: unnecessary_getters_setters
  DinsvOrientationLayOutIOS get layOutPortrait {
    // if (_layOutPortrait == null) {
    //   _layOutPortrait = new DinsvOrientationLayOutIOS();
    // }
    return _layOutPortrait;
  }

  // ignore: unnecessary_getters_setters
  set layOutLandscape(DinsvOrientationLayOutIOS layOutLandscape) =>
      _layOutLandscape;

  // ignore: unnecessary_getters_setters
  DinsvOrientationLayOutIOS get layOutLandscape {
    // if (_layOutLandscape == null) {
    //   _layOutLandscape = new DinsvOrientationLayOutIOS();
    // }
    return _layOutLandscape;
  }

  DinsvUIConfigIOS();

//反序列化
  factory DinsvUIConfigIOS.fromJson(Map<String, dynamic> json) =>
      _$DinsvUIConfigIOSFromJson(json);

//序列化
  Map<String, dynamic> toJson() => _$DinsvUIConfigIOSToJson(this);
}

/*iOS布局(横竖需屏分别设置)*/
@JsonSerializable(includeIfNull: false)
class DinsvOrientationLayOutIOS {
  DinsvOrientationLayOutIOS();

  //logo
  num? setLogoWidth;
  num? setLogoHeight;
  num? setLogoLeft;
  num? setLogoRight;
  num? setLogoTop;
  num? setLogoBottom;
  num? setLogoCenterX;
  num? setLogoCenterY;

  //脱敏手机号
  num? setNumFieldWidth;
  num? setNumFieldHeight;
  num? setNumFieldLeft;
  num? setNumFieldRight;
  num? setNumFieldTop;
  num? setNumFieldBottom;
  num? setNumFieldCenterX;
  num? setNumFieldCenterY;

  //一键登录按钮
  num? setLogBtnHeight;
  num? setLogBtnWidth;
  num? setLogBtnLeft;
  num? setLogBtnRight;
  num? setLogBtnTop;
  num? setLogBtnBottom;
  num? setLogBtnCenterX;
  num? setLogBtnCenterY;

  //隐私协议
  num? setPrivacyHeight;
  num? setPrivacyWidth;
  num? setPrivacyLeft;
  num? setPrivacyRight;
  num? setPrivacyTop;
  num? setPrivacyBottom;
  num? setPrivacyCenterX;
  num? setPrivacyCenterY;

  //授权页 slogan（***提供认证服务）
  num? setSloganHeight;
  num? setSloganWidth;
  num? setSloganLeft;
  num? setSloganRight;
  num? setSloganTop;
  num? setSloganBottom;
  num? setSloganCenterX;
  num? setSloganCenterY;

  num? setAuthWindowOrientationCenterX;
  num? setAuthWindowOrientationCenterY;
  num? setAuthWindowOrientationOriginX;
  num? setAuthWindowOrientationOriginY;
  num? setAuthWindowOrientationWidth;
  num? setAuthWindowOrientationHeight;

  //反序列化
  factory DinsvOrientationLayOutIOS.fromJson(Map<String, dynamic> json) =>
      _$DinsvOrientationLayOutIOSFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$DinsvOrientationLayOutIOSToJson(this);
}

/*Android独有布局*/
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class DinsvUIConfigAndroid {
  DinsvUIConfigAndroid({this.isFinish = false});

  bool isFinish; //是否自动销毁

  //授权页 整体背景
  String? setAuthBGImgPath; //授权页背景 普通图片
  String? setAuthBgGifPath; //GIF图片（只支持本地gif图，需要放置到drawable文件夹中）
  String? setAuthBgVideoPath; //视频背景

  //授权页 状态栏
  bool? setStatusBarHidden; //授权页状态栏 设置状态栏是否隐藏
  String? setStatusBarColor; //设置状态栏背景颜色
  bool? setLightColor; //设置状态栏字体颜色是否为白色
  bool? setVirtualKeyTransparent; //设置虚拟键是否透明

  //授权页 导航栏
  bool? setFullScreen; //-*Android only*- 设置是否全屏显示（true：全屏；false：不全屏）默认不全屏
  int? setNavReturnBtnWidth; //-*Android only*-设置导航栏返回按钮宽度
  int? setNavReturnBtnHeight; //-*Android only*-设置导航栏返回按钮高度
  int? setNavReturnBtnOffsetRightX; //设置导航栏返回按钮距离屏幕右侧X偏移
  int? setNavReturnBtnOffsetX; //设置导航栏返回按钮距离屏幕左侧X偏移
  int? setNavReturnBtnOffsetY; //设置导航栏返回按钮距离屏幕上侧Y偏移
  String? setNavColor; //设置导航栏背景颜色
  String? setNavText; //设置导航栏标题文字
  String? setNavTextColor; //设置导航栏标题文字颜色
  int? setNavTextSize; //设置导航栏标题文字大小
  String? setNavReturnImgPath; //设置导航栏返回按钮图标
  bool? setNavReturnImgHidden = false; //设置导航栏返回按钮是否隐藏（true：隐藏；false：不隐藏）
  bool? setBackPressedAvailable = true; //设置物理返回键是否有效（true：有效；false：无效）
  bool? setAuthNavHidden; //设置导航栏是否隐藏（true：隐藏；false：不隐藏）
  bool? setAuthNavTransparent; //设置导航栏是否透明（true：透明；false：不透明）
  bool? setNavTextBold; //设置导航栏字体是否加粗（true：加粗；false：不加粗）

  //logo
  String? setLogoImgPath; //设置logo图片
  bool? setLogoHidden; //设置logo是否隐藏（true：隐藏；false：不隐藏）
  int? setLogoOffsetY; //设置logo相对于标题栏下边缘y偏移
  int? setLogoOffsetBottomY; //设置logo相对于屏幕底部y偏移
  int? setLogoOffsetX; //设置logo相对屏幕左侧X偏移
  int? setLogoWidth; //设置logo宽度
  int? setLogoHeight; //设置logo高度

  //脱敏手机号
  int? setNumFieldOffsetY; //设置号码栏相对于标题栏下边缘y偏移
  int? setNumFieldOffsetBottomY; //设置号码栏相对于屏幕底部y偏移
  int? setNumberSize; //设置号码栏字体大小
  int? setNumFieldOffsetX; //设置号码栏相对屏幕左侧X偏移
  int? setNumFieldWidth; //设置脱敏手机号宽度
  int? setNumFieldHeight; //设置脱敏手机号高度
  String? setNumberColor; //设置号码栏字体颜色
  bool? setNumberBold; //设置号码栏字体是否加粗（true：加粗；false：不加粗）

  //一键登录按钮
  int? setLogBtnOffsetY; //设置登录按钮相对于标题栏下边缘Y偏移
  int? setLogBtnOffsetBottomY; //设置登录按钮相对于屏幕底部Y偏移
  int? setLogBtnTextSize; //设置登录按钮字体大小
  int? setLogBtnOffsetX; //设置登录按钮相对屏幕左侧X偏移
  int? setLogBtnHeight; //设置一键登录按钮高度
  int? setLogBtnWidth; //设置一键登录按钮宽度
  String? setLogBtnText; //设置登录按钮文字
  String? setLogBtnTextColor; //设置登录按钮文字颜色
  String? setLogBtnImgPath; //设置授权登录按钮图片
  bool? setLogBtnTextBold; //设置登录按钮字体是否加粗（true：加粗；false：不加粗

  //Privacy
  int? setPrivacyOffsetBottomY; //设置隐私条款相对于授权页面底部下边缘y偏移
  int? setPrivacyOffsetY; //设置隐私条款相对于授权页面标题栏下边缘y偏移
  int? setPrivacyOffsetX; //设置隐私条款相对屏幕左侧X偏移
  List<String>? setAppPrivacyOne; //设置开发者隐私条款1，包含两个参数：1.名称 2.URL
  List<String>? setAppPrivacyTwo; //设置开发者隐私条款2，包含两个参数：1.名称 2.URL
  List<String>? setAppPrivacyThree; //设置开发者隐私条款3，包含两个参数：1.名称 2.URL
  bool? setPrivacySmhHidden; //设置协议名称是否显示书名号《》，默认显示书名号（true：不显示；false：显示）
  int? setPrivacyTextSize; //设置隐私栏字体大小
  List<String>? setAppPrivacyColor; //设置隐私条款文字颜色，包含两个参数：1.基础文字颜色 2.协议文字颜色
  bool? setPrivacyOffsetGravityLeft; //设置隐私条款文字左对齐（true：左对齐；false：居中）
  bool? setPrivacyState; //设置隐私条款的CheckBox是否选中（true：选中；false：未选中）
  String? setUncheckedImgPath; //设置隐私条款的CheckBox未选中时图片
  String? setCheckedImgPath; //设置隐私条款的CheckBox选中时图片
  bool? setCheckBoxHidden; //设置隐私条款的CheckBox是否隐藏（true：隐藏；false：不隐藏）
  List<int>? setCheckBoxWH; //设置checkbox的宽高，包含两个参数：1.宽 2.高
  List<int>?
      setCheckBoxOffsetXY; //设置checkbox在协议框父控件中的位置，包含两个参数：1.左偏移量 2.上偏移量（默认：在父控件内居中）
  List<int>? setCheckBoxMargin; //设置checkbox的间距，包含四个参数：1.左间距 2.上间距 3.右间距 4.下间距
  List<String>? setPrivacyText; //设置隐私条款名称外的文字,包含五个参数
  bool? setPrivacyTextBold; //设置协议栏字体是否加粗（true：加粗；false：不加粗）
  String? setPrivacyCustomToastText; //未勾选协议时toast提示文字
  bool? setPrivacyNameUnderline; //协议是否显示下划线
  bool? setOperatorPrivacyAtLast; //运营商协议是否为最后一个显示

  //授权页 slogan（***提供认证服务）
  int? setSloganOffsetY; //设置slogan相对于标题栏下边缘y偏移
  int? setSloganOffsetBottomY; //设置slogan相对屏幕底部Y偏移
  int? setSloganOffsetX; //设置slogan相对屏幕左侧X偏移
  String? setSloganTextColor; //设置slogan文字颜色
  int? setSloganTextSize; //设置slogan文字字体大小
  bool? setSloganHidden = false; //设置slogan是否隐藏（true：隐藏；false：不隐藏）
  bool? setSloganTextBold; //设置slogan文字字体是否加粗（true：加粗；false：不加粗）

  //协议页导航栏
  String? setPrivacyNavColor; //设置协议页导航栏背景颜色
  bool? setPrivacyNavTextBold; //设置协议页导航栏标题文字是否加粗（true：加粗；false：不加粗）
  String? setPrivacyNavTextColor; //设置协议页导航栏标题文字颜色
  int? setPrivacyNavTextSize; //设置协议页导航栏标题文字大小
  String? setPrivacyNavReturnImgPath; //设置协议页导航栏返回按钮图标
  bool? setPrivacyNavReturnImgHidden; //设置协议页导航栏返回按钮是否隐藏（true：隐藏；false：不隐藏）
  int? setPrivacyNavReturnBtnWidth; //设置协议页导航栏返回按钮宽度
  int? setPrivacyNavReturnBtnHeight; //设置协议页导航栏返回按钮高度
  int? setPrivacyNavReturnBtnOffsetRightX; //设置协议页导航栏返回按钮距离屏幕右侧X偏移
  int? setPrivacyNavReturnBtnOffsetX; //设置协议页导航栏返回按钮距离屏幕左侧X偏移
  int? setPrivacyNavReturnBtnOffsetY; //设置协议页导航栏返回按钮距离屏幕上侧Y偏移

  String? setLoadingView; //设置授权页点击一键登录自定义loading
  List<String>?
      setDialogTheme; //设置授权页为弹窗样式，包含5个参数：1.弹窗宽度 2.弹窗高度 3.弹窗X偏移量（以屏幕中心为原点） 4.弹窗Y偏移量（以屏幕中心为原点） 5.授权页弹窗是否贴于屏幕底部
  List<String>?
      setActivityTranslateAnim; //设置授权页进出场动画，包含两个参数：1.进场动画传xml文件名即可  2.退场动画传xml文件名即可
  List<DinsvCustomWidgetLayout>? widgetLayouts;
  List<DinsvCustomWidget>? widgets;

  //反序列化
  factory DinsvUIConfigAndroid.fromJson(Map<String, dynamic> json) =>
      _$DinsvUIConfigAndroidFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$DinsvUIConfigAndroidToJson(this);
}

//添加自定义布局类型，目前支持RelativeLayout布局xml文件
enum DinsvCustomWidgetLayoutType { RelativeLayout }

// 自定义控件 (Only Android available)
@JsonSerializable()
class DinsvCustomWidgetLayout {
  String widgetLayoutName;
  List<String> widgetLayoutId = []; //自定义控件ID
  int left = 0; // 自定义控件距离屏幕左边缘偏移量，单位dp
  int top = 0; // 自定义控件距离导航栏底部偏移量，单位dp
  int right = 0; // 自定义控件距离屏幕右边缘偏移量，单位dp
  int bottom = 0; // 自定义控件距离屏幕底部偏移量，单位dp
  int width = 0; // 自定义控件宽度，单位dp
  int height = 0; // 自定义控件高度，单位dp
  DinsvCustomWidgetLayoutType type; //自定义控件类型，目前只支持 textView,button
  DinsvCustomWidgetLayout(
      @required this.widgetLayoutName, @required this.type) {
    this.widgetLayoutName = widgetLayoutName;
    this.type = type;
  }

  //反序列化
  factory DinsvCustomWidgetLayout.fromJson(Map<String, dynamic> json) =>
      _$DinsvCustomWidgetLayoutFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$DinsvCustomWidgetLayoutToJson(this);
}

//添加自定义控件类型，目前只支持 TextView
enum DinsvCustomWidgetType {
  TextView,
  Button,
  ImageView //(Only iOS available)
}

// 文本对齐方式
enum DinsvCustomWidgetGravityType { left, right, center }

// 自定义控件 (Android available)
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class DinsvCustomWidget {
  String widgetId; //自定义控件ID
  int left = 0; // 自定义控件距离屏幕左边缘偏移量，单位dp
  int top = 0; // 自定义控件距离导航栏底部偏移量，单位dp
  int right = 0; // 自定义控件距离屏幕右边缘偏移量，单位dp
  int bottom = 0; // 自定义控件距离屏幕底部偏移量，单位dp
  int width = 0; // 自定义控件宽度，单位dp
  int height = 0; // 自定义控件高度，单位dp
  String textContent = ""; // 自定义控件内容
  double textFont = 13.0; // 自定义控件文字大小，单位sp
  String textColor = "#aa0000"; // 自定义控件文字颜色
  String? backgroundColor; // 自定义控件背景颜色
  String? backgroundImgPath; // 自定义控件背景图片(Only Android available)
  DinsvCustomWidgetGravityType textAlignment = DinsvCustomWidgetGravityType
      .center; //自定义控件内容对齐方式 (Only Android available)
  DinsvCustomWidgetType? type; //自定义控件类型，目前只支持 textView,button
  bool isFinish = true; //点击自定义控件是否自动销毁授权页

  DinsvCustomWidget(@required this.widgetId, @required this.type) {
    this.widgetId = widgetId;
    this.type = type;
  }

//反序列化
  factory DinsvCustomWidget.fromJson(Map<String, dynamic> json) =>
      _$DinsvCustomWidgetFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$DinsvCustomWidgetToJson(this);
}

// 自定义控件 (iOS available)
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class DinsvCustomWidgetIOS {
  String widgetId; //自定义控件ID
  num? left; // 自定义控件距离屏幕左边缘偏移量，单位dp
  num? top; // 自定义控件距离导航栏底部偏移量，单位dp
  num? right; // 自定义控件距离屏幕右边缘偏移量，单位dp
  num? bottom; // 自定义控件距离屏幕底部偏移量，单位dp
  num? width; // 自定义控件宽度，单位dp
  num? height; // 自定义控件高度，单位dp
  num? centerX;
  num? centerY;
  num? cornerRadius;
  num? borderWidth;
  String? borderColor; // 自定义控件边框颜色
  String? textContent; // 自定义控件内容
  double? textFont = 13.0; // 自定义控件文字大小，单位sp
  String? textColor; // 自定义控件文字颜色
  String? backgroundColor; // 自定义控件背景颜色
  String? image; //按钮左侧图片 （Button available）
  String? backgroundImgPath; // 自定义控件背景图片(ImageView available)
  iOSTextAlignment textAlignment =
      iOSTextAlignment.center; //自定义控件内容对齐方式 (Only Android available)
  DinsvCustomWidgetType? type; //自定义控件类型，目前只支持 textView,button,ImageView
  DinsvCustomWidgetiOSNavPosition?
      navPosition; //如需添加到导航栏，请设置控件位置（左或右，导航栏按钮仅支持自定义width、height）
  bool isFinish = true; //点击自定义控件是否自动销毁授权页

  DinsvCustomWidgetIOS(@required this.widgetId, @required this.type) {
    this.widgetId = widgetId;
    this.type = type;
  }

//反序列化
  factory DinsvCustomWidgetIOS.fromJson(Map<String, dynamic> json) =>
      _$DinsvCustomWidgetIOSFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$DinsvCustomWidgetIOSToJson(this);
}

//iOS导航栏自定义控件位置
enum DinsvCustomWidgetiOSNavPosition { navleft, navright }

String? getStringFromEnum<T>(T) {
  if (T == null) {
    return null;
  }

  return T.toString().split('.').last;
}

///iOS 文字对齐方式
enum iOSTextAlignment {
  @JsonValue(0)
  center, // Visually centered 居中
  @JsonValue(1)
  left, // Visually left aligned 居左
  @JsonValue(2)
  right, // Visually right aligned 居右

/* !TARGET_ABI_USES_IOS_VALUES */
// Visually right aligned
// Visually centered
  @JsonValue(3)
  justified, // Fully-justified. The last line in a paragraph is natural-aligned. 自动

  @JsonValue(4)
  natural, // Indicates the default alignment for script 自然段落
}

/// iOS 状态栏样式
/// Xcode工程内的Info.plist文件配置需设置为YES，即运行单个页面自行管理状态栏: View controller-based status bar appearance = YES
enum iOSStatusBarStyle {
  @JsonValue(0)
  styleDefault, // 状态栏显示 黑
  @JsonValue(1)
  styleLightContent, // 状态栏显示 白
  @JsonValue(2)
  styleDarkContent // 状态栏显示 黑 API_AVAILABLE(ios(13.0)) = 3
}

/// iOS 导航栏样式，也可用于修改状态栏样式
enum iOSBarStyle {
  @JsonValue(0)
  styleDefault, // 状态栏显示 黑
  @JsonValue(1)
  styleBlack // 状态栏显示 白
}

/// iOS 支持的横竖屏方向
enum iOSInterfaceOrientationMask {
  @JsonValue(0)
  portrait, //竖屏
  @JsonValue(1)
  landscapeLeft, //横屏：左
  @JsonValue(2)
  landscapeRight, //横屏：右
  @JsonValue(3)
  portraitUpsideDown, //上下倒置
  @JsonValue(4)
  landscape, //横屏：左+右
  @JsonValue(5)
  all, //全部方向
  @JsonValue(6)
  allButUpsideDown //全部方向，除了上下倒置
}

/// iOS 屏幕方向
enum iOSInterfaceOrientation {
  @JsonValue(0)
  portrait, //竖屏
  @JsonValue(1)
  portraitUpsideDown, //上下倒置
  @JsonValue(2)
  landscapeLeft, //横屏：左
  @JsonValue(3)
  landscapeRight, //横屏：右
  @JsonValue(4)
  unknown,
}

/// iOS 系统自带的弹出方式
enum iOSModalTransitionStyle {
  @JsonValue(0)
  coverVertical, // 底部弹出
  @JsonValue(1)
  flipHorizontal, // 淡入
  @JsonValue(2)
  crossDissolve // 翻转显示
}

/* UIModalPresentationStyle
 * 若使用窗口模式，请设置为UIModalPresentationOverFullScreen 或不设置
 * iOS13强制全屏，请设置为UIModalPresentationFullScreen
 * UIModalPresentationAutomatic API_AVAILABLE(ios(13.0)) = -2
 * 默认UIModalPresentationFullScreen
 * eg. @(UIModalPresentationOverFullScreen)
 */

/// iOS 系统的弹出样式
enum iOSModalPresentationStyle {
  @JsonValue(0)
  fullScreen, // 弹出全屏
  @JsonValue(1)
  overFullScreen, // 在原页面弹出，可透视原页面
  @JsonValue(2)
  automatic // 自动
}

/// iOS 主题模式
enum iOSUserInterfaceStyle {
  @JsonValue(0)
  unspecified, //跟随系统
  @JsonValue(1)
  light, //亮
  @JsonValue(2)
  dark //暗黑 API_AVAILABLE(ios(13.0))
}
