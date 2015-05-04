@class SBIconModel, SBApplication;

@interface SBIconController : NSObject {
	SBIconModel* _iconModel;
}

+ (SBIconController *)sharedInstance;
- (SBIconModel *)model;
- (SBApplication *)applicationWithDisplayIdentifier:(NSString *)displayIdentifier;

@end