#import <Preferences/Preferences.h>
#import <MessageUI/MessageUI.h>
#import <Social/Social.h>
#import <Twitter/TWTweetComposeViewController.h>
#import "CPQuickSwipeListController.h"
#import "CPQuickSwipeLocalizer.h"

#ifndef kCFCoreFoundationVersionNumber_iOS_7_0
#define kCFCoreFoundationVersionNumber_iOS_7_0 847.20
#endif

#ifndef kCFCoreFoundationVersionNumber_iOS_7_1_2
#define kCFCoreFoundationVersionNumber_iOS_7_1_2 847.27
#endif

#ifndef kCFCoreFoundationVersionNumber_iOS_8_0
#define kCFCoreFoundationVersionNumber_iOS_8_0 1140.10
#endif

#ifndef kCFCoreFoundationVersionNumber_iOS_8_1_1
#define kCFCoreFoundationVersionNumber_iOS_8_1_1 1141.18
#endif

#define iPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define CURRENT_INTERFACE_ORIENTATION iPad ? [[UIApplication sharedApplication] statusBarOrientation] : [[UIApplication sharedApplication] activeInterfaceOrientation]

#define iOS8 kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_8_0 \
&& kCFCoreFoundationVersionNumber <= kCFCoreFoundationVersionNumber_iOS_8_1_1

#define iOS7 kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_7_0 \
&& kCFCoreFoundationVersionNumber <= kCFCoreFoundationVersionNumber_iOS_7_1_2

@interface UIView (Constraint)
-(NSLayoutConstraint *)_constraintForIdentifier:(id)arg1 ;
@end

#define MAIN_ICON_PATH               @"/Library/PreferenceBundles/QuickSwipe.bundle/QuickSwipe.png"
#define HEADER_ICON               @"/Library/PreferenceBundles/QuickSwipe.bundle/headerLogo.png"


#define MAIN_TINTCOLOR [UIColor colorWithRed:68/255.0f green:108/255.0f blue:179/255.0f alpha:1.0f]
#define SWITCH_TINTCOLOR [UIColor colorWithRed:68/255.0f green:108/255.0f blue:179/255.0f alpha:1.0f]
#define LABEL_TINTCOLOR [UIColor colorWithRed:68/255.0f green:108/255.0f blue:179/255.0f alpha:1.0f]
#define NAVBACKGROUND_TINTCOLOR [UIColor colorWithRed:68/255.0f green:108/255.0f blue:179/255.0f alpha:1.0f]