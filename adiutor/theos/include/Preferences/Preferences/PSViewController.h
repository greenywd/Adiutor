#import <UIKit/UIKit.h>

@interface PSViewController : UIViewController

- (instancetype)initForContentSize:(CGSize)contentSize;

- (id)parentController;

//psbaseview
-(void)setPreferenceValue:(id)value specifier:(id)specifier;
@end
