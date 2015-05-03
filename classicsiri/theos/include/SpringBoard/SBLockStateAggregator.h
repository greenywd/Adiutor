@interface SBLockStateAggregator {
	unsigned _lockState;
}
+ (id)sharedInstance;
- (id)init;
- (id)_descriptionForLockState:(unsigned)lockState;
- (void)_updateLockState;
- (void)dealloc;
- (id)description;
- (BOOL)hasAnyLockState;
- (unsigned)lockState;
@end