#import <UIKit/UITableViewCell.h>

@interface UITableViewCell (Private)

@property(nonatomic, retain) UIColor* separatorColor;
@property(nonatomic, readwrite) BOOL _drawsSeparatorAtTopOfSection;
@property(nonatomic, readwrite) BOOL _drawsSeparatorAtBottomOfSection;

- (void)_setBadgeText:(id)arg1;
- (void)_setDrawsSeparatorAtBottomOfSection:(BOOL)arg1;
- (void)_setDrawsSeparatorAtTopOfSection:(BOOL)arg1;
- (void)_setDrawsTopSeparator:(BOOL)arg1;
- (void)_setDrawsTopSeparatorDuringReordering:(BOOL)arg1;
- (void)_setSeparatorHidden:(BOOL)arg1;

@end 