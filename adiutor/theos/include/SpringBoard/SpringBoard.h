#import "SBAlertItemsController.h"
#import "SBApplication.h"
#import "SBApplicationController.h"
#import "SBApplicationIcon.h"
#import "SBAppSliderController.h"
#import "SBAppSliderScrollingViewDelegate.h"
#import "SBAwayBulletinListItem.h"
#import "SBAwayController.h"
#import "SBAwayView.h"
#import "SBBannerView.h"
#import "SBBrightnessController.h"
#import "SBBulletinBannerController.h"
#import "SBBulletinBannerItem.h"
#import "SBBulletinBannerView.h"
#import "SBBulletinListCell.h"
#import "SBFolderSlidingView.h"
#import "SBHUDController.h"
#import "SBHUDView.h"
#import "SBIcon.h"
#import "SBIconController.h"
#import "SBIconModel.h"
#import "SBLockScreenNotificationListView.h"
#import "SBLockStateAggregator.h"
#import "SBMediaController.h"
#import "SBRotationLockHUDView.h"
#import "SBStatusBarDataManager.h"
#import "SBUIController.h"
#import "SBUserAgent.h"
#import "SBUserNotificationAlert.h"
#import "SBWallpaperView.h"
#import "SpringBoard.h"
#import "VolumeControl.h"

@interface SpringBoard : UIApplication

@property (nonatomic, retain) UIWindow *window;

@property (readonly) BOOL isLocked;

- (void)applicationOpenURL:(NSURL *)url publicURLsOnly:(BOOL)publicOnly;
- (void)relaunchSpringBoard;
- (void)_relaunchSpringBoardNow;
- (void)undim;
- (id)_accessibilityFrontMostApplication;

@end
