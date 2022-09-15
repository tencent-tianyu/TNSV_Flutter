//
//  TenDINsvUIConfigure.h
//  TenDINsvSDK
//
//  Created by wanglijun on 2018/10/30.
//  Copyright © 2018 wanglijun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class TenDINsvOrientationLayOut;
/*
 注： 授权页一键登录按钮、运营商品牌标签、运营商条款必须显示，不得隐藏，否则取号能力可能被运营商关闭
 **/

//授权页UI配置

@interface TenDINsvUIConfigure : NSObject

//要拉起授权页的vc [必填项] (注：SDK不持有接入方VC)
@property (nonatomic,weak)UIViewController * viewController;

/**
 *外部手动管理关闭界面
 *BOOL,default is NO
 *eg.@(YES)
 */
@property (nonatomic,strong)NSNumber * manualDismiss;

/**授权页-背景图片*/
@property (nonatomic,strong) UIImage *tenDINsvBackgroundImg;
/**授权页-背景色*/
@property (nonatomic,strong) UIColor *tenDINsvBackgroundColor;

//导航栏
/**导航栏 是否隐藏 BOOL default is NO, 设置优先级高于tenDINsvNavigationBackgroundClear eg.@(NO)*/
@property (nonatomic,strong)NSNumber * tenDINsvNavigationBarHidden;
/**导航栏 背景透明 BOOL eg.@(YES)*/
@property (nonatomic,strong)NSNumber * tenDINsvNavigationBackgroundClear;
/**导航栏标题*/
@property (nonatomic,strong)NSAttributedString * tenDINsvNavigationAttributesTitleText;

/**导航栏右侧自定义按钮*/
@property (nonatomic,strong)UIBarButtonItem * tenDINsvNavigationRightControl;
/**导航栏左侧自定义按钮*/
@property (nonatomic,strong)UIBarButtonItem * tenDINsvNavigationLeftControl;

// 返回按钮
/**导航栏左侧返回按钮图片*/
@property (nonatomic,strong)UIImage   * tenDINsvNavigationBackBtnImage;
/**导航栏自带返回按钮隐藏，默认显示 BOOL eg.@(YES)*/
@property (nonatomic,strong)NSNumber  * tenDINsvNavigationBackBtnHidden;
/**************新增******************/
/**返回按钮图片缩进 btn.imageInsets = UIEdgeInsetsMake(0, 0, 20, 20)*/
@property (nonatomic,strong)NSValue * tenDINsvNavBackBtnImageInsets;
/**自带返回(关闭)按钮位置 默认NO 居左,设置为YES居右显示*/
@property (nonatomic,strong)NSNumber * tenDINsvNavBackBtnAlimentRight;

/*translucent 此属性已失效*/
//@property (nonatomic,strong)NSNumber * tenDINsv_navigation_translucent;

/**导航栏分割线 是否隐藏
 * set backgroundImage=UIImage.new && shadowImage=UIImage.new
 * BOOL, default is YES
 * eg.@(YES)
 */
@property (nonatomic,strong)NSNumber * tenDINsvNavigationBottomLineHidden;
/**导航栏 文字颜色*/
@property (nonatomic,strong)UIColor  * tenDINsvNavigationTintColor;
/**导航栏 背景色 default is white
 * 设置导航栏背景色需配置：tenDINsvNavigationBottomLineHidden = @(NO)
 */
@property (nonatomic,strong)UIColor  * tenDINsvNavigationBarTintColor;
/**导航栏 背景图片*/
@property (nonatomic,strong)UIImage  * tenDINsvNavigationBackgroundImage;
/**导航栏 配合背景图片设置，用来控制在不同状态下导航栏的显示(横竖屏是否显示) UIBarMetrics eg.@(UIBarMetricsCompact)*/
@property (nonatomic,strong)NSNumber * tenDINsvNavigationBarMetrics;
/**导航栏 导航栏底部分割线（图片）*/
@property (nonatomic,strong)UIImage  * tenDINsvNavigationShadowImage;


/*状态栏样式
 *Info.plist: View controller-based status bar appearance = YES
 *
 *UIStatusBarStyleDefault：状态栏显示 黑
 *UIStatusBarStyleLightContent：状态栏显示 白
 *UIStatusBarStyleDarkContent：状态栏显示 黑 API_AVAILABLE(ios(13.0)) = 3
 **eg. @(UIStatusBarStyleLightContent)
 */
@property (nonatomic,strong)NSNumber * tenDINsvPreferredStatusBarStyle;
/*状态栏隐藏 eg.@(NO)*/
@property (nonatomic,strong)NSNumber * tenDINsvPrefersStatusBarHidden;

/**
 *NavigationBar.barStyle：默认UIBarStyleBlack
 *Info.plist: View controller-based status bar appearance = YES

 *UIBarStyleDefault：状态栏显示 黑
 *UIBarStyleBlack：状态栏显示 白
 *
 *eg. @(UIBarStyleBlack)
 */
@property (nonatomic,strong)NSNumber * tenDINsvNavigationBarStyle;



//LOGO图片
/**LOGO图片*/
@property (nonatomic,strong)UIImage  * tenDINsvLogoImage;
/**LOGO圆角 CGFloat eg.@(2.0)*/
@property (nonatomic,strong)NSNumber * tenDINsvLogoCornerRadius;
/**LOGO显隐 BOOL eg.@(NO)*/
@property (nonatomic,strong)NSNumber * tenDINsvLogoHiden;

/**手机号显示控件*/
/**手机号颜色*/
@property (nonatomic,strong)UIColor  * tenDINsvPhoneNumberColor;
/**手机号字体*/
@property (nonatomic,strong)UIFont   * tenDINsvPhoneNumberFont;
/**手机号对齐方式 NSTextAlignment eg.@(NSTextAlignmentCenter)*/
@property (nonatomic,strong)NSNumber * tenDINsvPhoneNumberTextAlignment;

/*一键登录按钮 控件
 注： 一键登录授权按钮 不得隐藏
 **/
/**按钮文字*/
@property (nonatomic,copy)NSString   * tenDINsvLoginBtnText;
/**按钮文字颜色*/
@property (nonatomic,strong)UIColor  * tenDINsvLoginBtnTextColor;
/**按钮背景颜色*/
@property (nonatomic,strong)UIColor  * tenDINsvLoginBtnBgColor;
/**按钮文字字体*/
@property (nonatomic,strong)UIFont   * tenDINsvLoginBtnTextFont;
/**按钮背景图片*/
@property (nonatomic,strong)UIImage  * tenDINsvLoginBtnNormalBgImage;
/**按钮背景高亮图片*/
@property (nonatomic,strong)UIImage  * tenDINsvLoginBtnHightLightBgImage;
/**按钮背景不可用图片*/
@property (nonatomic,strong)UIImage  * tenDINsvLoginBtnDisabledBgImage;
/**按钮边框颜色*/
@property (nonatomic,strong)UIColor  * tenDINsvLoginBtnBorderColor;
/**按钮圆角 CGFloat eg.@(5)*/
@property (nonatomic,strong)NSNumber * tenDINsvLoginBtnCornerRadius;
/**按钮边框 CGFloat eg.@(2.0)*/
@property (nonatomic,strong)NSNumber * tenDINsvLoginBtnBorderWidth;

/*隐私条款Privacy
 注： 运营商隐私条款 不得隐藏
 用户条款不限制
 **/
/**隐私条款 下划线设置，默认隐藏，设置tenDINsvPrivacyShowUnderline = @(YES)显示下划线*/
@property (nonatomic,strong)NSNumber * tenDINsvPrivacyShowUnderline;
/**隐私条款名称颜色：@[基础文字颜色UIColor*,条款颜色UIColor*] eg.@[[UIColor lightGrayColor],[UIColor greenColor]]*/
@property (nonatomic,strong) NSArray<UIColor*> *tenDINsvAppPrivacyColor;
/**隐私条款文字字体*/
@property (nonatomic,strong)UIFont  * tenDINsvAppPrivacyTextFont;
/**隐私条款文字对齐方式 NSTextAlignment eg.@(NSTextAlignmentCenter)*/
@property (nonatomic,strong)NSNumber * tenDINsvAppPrivacyTextAlignment;
/**运营商隐私条款书名号 默认NO 不显示 BOOL eg.@(YES)*/
@property (nonatomic,strong)NSNumber * tenDINsvAppPrivacyPunctuationMarks;
/**多行时行距 CGFloat eg.@(2.0)*/
@property (nonatomic,strong)NSNumber* tenDINsvAppPrivacyLineSpacing;
/**是否需要sizeToFit,设置后与宽高约束的冲突请自行考虑 BOOL eg.@(YES)*/
@property (nonatomic,strong)NSNumber* tenDINsvAppPrivacyNeedSizeToFit;
/**UITextView.textContainerInset 文字与TextView控件内边距 UIEdgeInset  eg.[NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(2, 2, 2, 2)]*/
@property (nonatomic,strong)NSValue* tenDINsvAppPrivacyTextContainerInset;

/**隐私条款--APP名称简写 默认取CFBundledisplayname 设置描述文本四后此属性无效*/
@property (nonatomic,copy) NSString  * tenDINsvAppPrivacyAbbreviatedName;
/*
 *隐私条款Y一:需同时设置Name和UrlString eg.@[@"条款一名称",条款一URL]
 *@[NSSting,NSURL];
 */
@property (nonatomic,strong)NSArray * tenDINsvAppPrivacyFirst;
/*
 *隐私条款二:需同时设置Name和UrlString eg.@[@"条款一名称",条款一URL]
 *@[NSSting,NSURL];
 */
@property (nonatomic,strong)NSArray * tenDINsvAppPrivacySecond;
/*
 *隐私条款三:需同时设置Name和UrlString eg.@[@"条款一名称",条款一URL]
 *@[NSSting,NSURL];
 */
@property (nonatomic,strong)NSArray * tenDINsvAppPrivacyThird;
/*
 隐私协议文本拼接: DesTextFirst+运营商条款+DesTextSecond+隐私条款一+DesTextThird+隐私条款二+DesTextFourth+隐私条款三+DesTextLast
 **/
/**描述文本 首部 default:"同意"*/
@property (nonatomic,copy)NSString *tenDINsvAppPrivacyNormalDesTextFirst;
/**描述文本二 default:"和"*/
@property (nonatomic,copy)NSString *tenDINsvAppPrivacyNormalDesTextSecond;
/**描述文本三 default:"、"*/
@property (nonatomic,copy)NSString *tenDINsvAppPrivacyNormalDesTextThird;
/**描述文本四 default:"、"*/
@property (nonatomic,copy)NSString *tenDINsvAppPrivacyNormalDesTextFourth;
/**描述文本 尾部 default: "并授权AppName使用认证服务"*/
@property (nonatomic,copy)NSString *tenDINsvAppPrivacyNormalDesTextLast;

/**运营商协议后置 默认@(NO)"*/
@property (nonatomic,strong)NSNumber *tenDINsvOperatorPrivacyAtLast;

/**用户隐私协议WEB页面导航栏标题 默认显示用户条款名称*/
@property (nonatomic,strong)NSAttributedString * tenDINsvAppPrivacyWebAttributesTitle;
/**运营商隐私协议WEB页面导航栏标题 默认显示运营商条款名称*/
@property (nonatomic,strong)NSAttributedString * tenDINsvAppPrivacyWebNormalAttributesTitle;
/**自定义协议标题-按自定义协议对应顺序*/
@property (nonatomic,strong)NSArray<NSString*> * tenDINsvAppPrivacyWebTitleList;

/**隐私协议标题文本属性（用户协议&&运营商协议）*/
@property (nonatomic,strong)NSDictionary * tenDINsvAppPrivacyWebAttributes;
/**隐私协议WEB页面导航返回按钮图片*/
@property (nonatomic,strong)UIImage * tenDINsvAppPrivacyWebBackBtnImage;

/*协议页状态栏样式 默认：UIStatusBarStyleDefault*/
@property (nonatomic,strong)NSNumber * tenDINsvAppPrivacyWebPreferredStatusBarStyle;

/**UINavigationTintColor*/
@property (nonatomic,strong)UIColor  * tenDINsvAppPrivacyWebNavigationTintColor;
/**UINavigationBarTintColor*/
@property (nonatomic,strong)UIColor  * tenDINsvAppPrivacyWebNavigationBarTintColor;
/**UINavigationBackgroundImage*/
@property (nonatomic,strong)UIImage  * tenDINsvAppPrivacyWebNavigationBackgroundImage;
/**UINavigationBarMetrics*/
@property (nonatomic,strong)NSNumber * tenDINsvAppPrivacyWebNavigationBarMetrics;
/**UINavigationShadowImage*/
@property (nonatomic,strong)UIImage  * tenDINsvAppPrivacyWebNavigationShadowImage;
/**UINavigationBarStyle*/
@property (nonatomic,strong)NSNumber * tenDINsvAppPrivacyWebNavigationBarStyle;

/*SLOGAN
 注： 运营商品牌标签("中国**提供认证服务")，不得隐藏
 **/
/**slogan文字字体*/
@property (nonatomic,strong) UIFont   * tenDINsvSloganTextFont;
/**slogan文字颜色*/
@property (nonatomic,strong) UIColor  * tenDINsvSloganTextColor;
/**slogan文字对齐方式 NSTextAlignment eg.@(NSTextAlignmentCenter)*/
@property (nonatomic,strong) NSNumber * tenDINsvSlogaTextAlignment;

/*SLOGAN
 注： 供应商品牌标签("提供认技术支持")
 **/
/**slogan文字字体*/
@property (nonatomic,strong) UIFont   * tenSloganTextFont;
/**slogan文字颜色*/
@property (nonatomic,strong) UIColor  * tenSloganTextColor;
/**slogan文字对齐方式 NSTextAlignment eg.@(NSTextAlignmentCenter)*/
@property (nonatomic,strong) NSNumber * tenSloganTextAlignment;
/**slogan默认不隐藏 eg.@(NO)*/
@property (nonatomic,strong) NSNumber  * tenSloganHidden;

/*CheckBox
 *协议勾选框，默认选中且在协议前显示
 *可在sdk_oauth.bundle中替换checkBox_unSelected、checkBox_selected图片
 *也可以通过属性设置选中和未选择图片
 **/
/**协议勾选框（默认显示,放置在协议之前）BOOL eg.@(YES)*/
@property (nonatomic,strong) NSNumber *tenDINsvCheckBoxHidden;
/**协议勾选框默认值（默认选中）BOOL eg.@(YES)*/
@property (nonatomic,strong) NSNumber *tenDINsvCheckBoxValue;
/**协议勾选框 尺寸 NSValue->CGSize eg.[NSValue valueWithCGSize:CGSizeMake(25, 25)]*/
@property (nonatomic,strong) NSValue *tenDINsvCheckBoxSize;
/**协议勾选框 UIButton.image图片缩进 UIEdgeInset eg.[NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(2, 2, 2, 2)]*/
@property (nonatomic,strong) NSValue *tenDINsvCheckBoxImageEdgeInsets;
/**协议勾选框 设置CheckBox顶部与隐私协议控件顶部对齐 YES或大于0生效 eg.@(YES)*/
@property (nonatomic,strong) NSNumber *tenDINsvCheckBoxVerticalAlignmentToAppPrivacyTop;

/**协议勾选框 设置CheckBox对齐后的偏移量,相对于对齐后的中心距离在当前垂直方向上的偏移*/
@property (nonatomic,strong) NSNumber *tenDINsvCheckBoxVerticalAlignmentOffset;



/**协议勾选框 设置CheckBox顶部与隐私协议控件竖向中心对齐 YES或大于0生效 eg.@(YES)*/
@property (nonatomic,strong) NSNumber *tenDINsvCheckBoxVerticalAlignmentToAppPrivacyCenterY;
/**协议勾选框 非选中状态图片*/
@property (nonatomic,strong) UIImage  *tenDINsvCheckBoxUncheckedImage;
/**协议勾选框 选中状态图片*/
@property (nonatomic,strong) UIImage  *tenDINsvCheckBoxCheckedImage;

/**授权页自定义 "请勾选协议"提示框
 - containerView为loading的全屏蒙版view
 - 请自行在containerView添加自定义提示
 */
@property (nonatomic,copy)void(^checkBoxTipView)(UIView * containerView);
/**checkBox 未勾选时 提示文本，默认："请勾选协议"*/
@property (nonatomic,copy) NSString *tenDINsvCheckBoxTipMsg;
/**使用sdk内部“一键登录”按钮点击时的吐丝提示("请勾选协议")
 * NO:默认使用sdk内部吐丝 YES:禁止使用
 */
@property (nonatomic,strong) NSNumber *tenDINsvCheckBoxTipDisable;

/*Loading*/
/**Loading 大小 CGSize eg.[NSValue valueWithCGSize:CGSizeMake(50, 50)]*/
@property (nonatomic,strong) NSValue *tenDINsvLoadingSize;
/**Loading 圆角 float eg.@(5) */
@property (nonatomic,strong) NSNumber *tenDINsvLoadingCornerRadius;
/**Loading 背景色 UIColor eg.[UIColor colorWithRed:0.8 green:0.5 blue:0.8 alpha:0.8]; */
@property (nonatomic,strong) UIColor *tenDINsvLoadingBackgroundColor;
/**UIActivityIndicatorViewStyle eg.@(UIActivityIndicatorViewStyleWhiteLarge)*/
@property (nonatomic,strong) NSNumber *tenDINsvLoadingIndicatorStyle;
/**Loading Indicator渲染色 UIColor eg.[UIColor greenColor]; */
@property (nonatomic,strong) UIColor *tenDINsvLoadingTintColor;
/**授权页自定义Loading
 - containerView为loading的全屏蒙版view
 - 请自行在containerView添加自定义loading
 - 设置block后，上述loading属性将无效
 */
@property (nonatomic,copy)void(^loadingView)(UIView * containerView);

//添加自定义控件
/**可设置背景色及添加控件*/
@property (nonatomic,copy)void(^customAreaView)(UIView * customAreaView);
/**设置隐私协议弹窗*/
@property (nonatomic,copy)void(^customPrivacyAlertView)(UIViewController * authPageVC);

/**横竖屏*/
/*是否支持自动旋转 BOOL*/
@property (nonatomic,strong) NSNumber * shouldAutorotate;
/*支持方向 UIInterfaceOrientationMask
 - 如果设置只支持竖屏，只需设置tenDINsvOrientationLayOutPortrait竖屏布局对象
 - 如果设置只支持横屏，只需设置tenDINsvOrientationLayOutLandscape横屏布局对象
 - 横竖屏均支持，需同时设置tenDINsvOrientationLayOutPortrait和tenDINsvOrientationLayOutLandscape
 */
@property (nonatomic,strong) NSNumber * supportedInterfaceOrientations;
/*默认方向 UIInterfaceOrientation*/
@property (nonatomic,strong) NSNumber * preferredInterfaceOrientationForPresentation;

/**以窗口方式显示授权页
 */
/**以窗口方式显示 BOOL, default is NO */
@property (nonatomic,strong) NSNumber * tenDINsvAuthTypeUseWindow;
/**窗口圆角 float*/
@property (nonatomic,strong) NSNumber * tenDINsvAuthWindowCornerRadius;

/**tenDINsvAuthWindowModalTransitionStyle系统自带的弹出方式 仅支持以下三种
 UIModalTransitionStyleCoverVertical 底部弹出
 UIModalTransitionStyleCrossDissolve 淡入
 UIModalTransitionStyleFlipHorizontal 翻转显示
 */
@property (nonatomic,strong) NSNumber * tenDINsvAuthWindowModalTransitionStyle;

/* UIModalPresentationStyle
 * 若使用窗口模式，请设置为UIModalPresentationOverFullScreen 或不设置
 * iOS13强制全屏，请设置为UIModalPresentationFullScreen
 * UIModalPresentationAutomatic API_AVAILABLE(ios(13.0)) = -2
 * 默认UIModalPresentationFullScreen
 * eg. @(UIModalPresentationOverFullScreen)
 */
/*授权页 ModalPresentationStyle*/
@property (nonatomic,strong) NSNumber * tenDINsvAuthWindowModalPresentationStyle;
/*协议页 ModalPresentationStyle （授权页使用窗口模式时，协议页强制使用模态弹出）*/
@property (nonatomic,strong) NSNumber * tenDINsvAppPrivacyWebModalPresentationStyle;

/* UIUserInterfaceStyle
 * UIUserInterfaceStyleUnspecified - 不指定样式，跟随系统设置进行展示
 * UIUserInterfaceStyleLight       - 明亮
 * UIUserInterfaceStyleDark,       - 暗黑 仅对iOS13+系统有效
 */
/*授权页 UIUserInterfaceStyle,默认:UIUserInterfaceStyleLight,eg. @(UIUserInterfaceStyleLight)*/
@property (nonatomic,strong) NSNumber * tenDINsvAuthWindowOverrideUserInterfaceStyle;

/**
 * 授权页面present弹出时animate动画设置，默认带动画，eg. @(YES)
 */
@property (nonatomic,strong) NSNumber * tenDINsvAuthWindowPresentingAnimate;
/**
 * sdk自带返回键：授权页面dismiss时animate动画设置，默认带动画，eg. @(YES)
 */
@property (nonatomic,strong) NSNumber * tenDINsvAuthWindowDismissAnimate;

/**弹窗的MaskLayer，用于自定义窗口形状*/
@property (nonatomic,strong) CALayer * tenDINsvAuthWindowMaskLayer;


//竖屏布局配置对象 -->创建一个布局对象，设置好控件约束属性值，再设置到此属性中
/**竖屏：UIInterfaceOrientationPortrait|UIInterfaceOrientationPortraitUpsideDown
 *eg.   TenDINsvUIConfigure * baseUIConfigure = [TenDINsvUIConfigure new];
 *      TenDINsvOrientationLayOut * tenDINsvOrientationLayOutPortrait = [TenDINsvOrientationLayOut new];
 *      tenDINsvOrientationLayOutPortrait.tenDINsvLayoutPhoneCenterY = @(0);
 *      tenDINsvOrientationLayOutPortrait.tenDINsvLayoutPhoneLeft = @(50*screenScale);
 *      ...
 *      baseUIConfigure.tenDINsvOrientationLayOutPortrait = tenDINsvOrientationLayOutPortrait;
 */
@property (nonatomic,strong) TenDINsvOrientationLayOut * tenDINsvOrientationLayOutPortrait;

//横屏布局配置对象 -->创建一个布局对象，设置好控件约束属性值，再设置到此属性中
/**横屏：UIInterfaceOrientationLandscapeLeft|UIInterfaceOrientationLandscapeRight
 *eg.   TenDINsvUIConfigure * baseUIConfigure = [TenDINsvUIConfigure new];
 *      TenDINsvOrientationLayOut * tenDINsvOrientationLayOutLandscape = [TenDINsvOrientationLayOut new];
 *      tenDINsvOrientationLayOutLandscape.tenDINsvLayoutPhoneCenterY = @(0);
 *      tenDINsvOrientationLayOutLandscape.tenDINsvLayoutPhoneLeft = @(50*screenScale);
 *      ...
 *      baseUIConfigure.tenDINsvOrientationLayOutLandscape = tenDINsvOrientationLayOutLandscape;
 */
@property (nonatomic,strong) TenDINsvOrientationLayOut * tenDINsvOrientationLayOutLandscape;


/**默认界面配置*/
+ (TenDINsvUIConfigure *)tenDINsvDefaultUIConfigure;
@end

/**横竖屏布局配置对象
 配置页面布局相关属性
 */
@interface TenDINsvOrientationLayOut : NSObject
/**LOGO图片*/
// 约束均相对vc.view
@property (nonatomic,strong)NSNumber * tenDINsvLayoutLogoLeft;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutLogoTop;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutLogoRight;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutLogoBottom;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutLogoWidth;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutLogoHeight;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutLogoCenterX;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutLogoCenterY;

/**手机号显示控件*/
//layout 约束均相对vc.view
@property (nonatomic,strong)NSNumber * tenDINsvLayoutPhoneLeft;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutPhoneTop;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutPhoneRight;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutPhoneBottom;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutPhoneWidth;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutPhoneHeight;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutPhoneCenterX;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutPhoneCenterY;

/*一键登录按钮 控件
 注： 一键登录授权按钮 不得隐藏
 **/
//layout 约束均相对vc.view
@property (nonatomic,strong)NSNumber * tenDINsvLayoutLoginBtnLeft;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutLoginBtnTop;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutLoginBtnRight;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutLoginBtnBottom;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutLoginBtnWidth;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutLoginBtnHeight;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutLoginBtnCenterX;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutLoginBtnCenterY;

/*隐私条款Privacy
 注： 运营商隐私条款 不得隐藏， 用户条款不限制
 **/
//layout 约束均相对vc.view
@property (nonatomic,strong)NSNumber * tenDINsvLayoutAppPrivacyLeft;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutAppPrivacyTop;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutAppPrivacyRight;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutAppPrivacyBottom;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutAppPrivacyWidth;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutAppPrivacyHeight;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutAppPrivacyCenterX;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutAppPrivacyCenterY;

/*Slogan 运营商品牌标签："认证服务由中国移动/联通/电信提供" label
 注： 运营商品牌标签，不得隐藏
 **/
//layout 约束均相对vc.view
@property (nonatomic,strong)NSNumber * tenDINsvLayoutSloganLeft;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutSloganTop;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutSloganRight;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutSloganBottom;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutSloganWidth;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutSloganHeight;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutSloganCenterX;
@property (nonatomic,strong)NSNumber * tenDINsvLayoutSloganCenterY;

/**窗口模式*/
/**窗口中心：CGPoint X Y*/
@property (nonatomic,strong) NSValue * tenDINsvAuthWindowOrientationCenter;
/**窗口左上角：frame.origin：CGPoint X Y*/
@property (nonatomic,strong) NSValue * tenDINsvAuthWindowOrientationOrigin;
/**窗口大小：宽 float */
@property (nonatomic,strong) NSNumber * tenDINsvAuthWindowOrientationWidth;
/**窗口大小：高 float */
@property (nonatomic,strong) NSNumber * tenDINsvAuthWindowOrientationHeight;

/**默认布局配置
* 用于快速展示默认界面。定制UI时，请重新创建TenDINsvOrientationLayOut对象再设置属性，以避免和默认约束冲突
 */
+ (TenDINsvOrientationLayOut *)tenDINsvDefaultOrientationLayOut;

@end

NS_ASSUME_NONNULL_END
