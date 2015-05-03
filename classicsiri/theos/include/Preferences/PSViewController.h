#import <UIKit/UIKit.h>
#import "PSRootController.h"

@interface PSViewController : UIViewController

- (instancetype)initForContentSize:(CGSize)contentSize;

- (id)parentController;
-(void)setSpecifier:(id)arg1 ;
//psbaseview
-(void)setPreferenceValue:(id)value specifier:(id)specifier;
-(void)pushController:(id)arg1 animate:(BOOL)arg2 ;
-(PSRootController *)rootController;
@end
