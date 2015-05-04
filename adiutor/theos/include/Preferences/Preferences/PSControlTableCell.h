#import "PSTableCell.h"

@interface PSControlTableCell : PSTableCell

@property (nonatomic, retain) UIControl *control;

- (void)refreshCellContentsWithSpecifier:(id)arg1;
- (void)controlChanged:(id)arg1;

@end
