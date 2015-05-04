
#import <UIKit/UIActionSheet.h>

@interface UIActionSheet (Private)
- (void)_presentFromBarButtonItem:(id)arg1 orFromRect:(CGRect)arg2 inView:(id)arg3 direction:(unsigned int)arg4 allowInteractionWithViews:(id)arg5 backgroundStyle:(int)arg6 animated:(BOOL)arg7;
- (void)_presentPopoverInCenterOfWindowForView:(id)arg1;
- (void)_presentSheetFromView:(id)arg1 above:(BOOL)arg2;
- (void)_presentSheetStartingFromYCoordinate:(double)arg1 inView:(id)arg2;
- (void)_presentSheetStartingFromYCoordinate:(double)arg1 rootWindow:(id)arg2;
- (void)_presentViaResponderChain:(id)arg1 asPopoverFromBarButtonItem:(id)arg2 orFromRect:(CGRect)arg3 inView:(id)arg4 withPreferredArrowDirections:(unsigned int)arg5 passthroughViews:(id)arg6 backgroundStyle:(int)arg7 animated:(BOOL)arg8;
- (void)_presentViaResponderChainFromYCoordinate:(float)arg1;
- (id)_presentingViewForView:(id)arg1;
@end