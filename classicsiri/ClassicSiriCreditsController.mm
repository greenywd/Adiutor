#import "PrefHeaders.h"

@interface ClassicSiriCreditsController: PSListController {
}
@end

@implementation ClassicSiriCreditsController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"ClassicSiriCredits" target:self] retain];
	}
	return _specifiers;
}
- (void)viewWillAppear:(BOOL)arg1 {
	    [super viewWillAppear:arg1];

[[UIApplication sharedApplication] keyWindow].tintColor = kTintColor;
    self.navigationController.navigationBar.tintColor = kTintColor;

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
[[UIApplication sharedApplication] keyWindow].tintColor = nil;
    self.navigationController.navigationBar.tintColor = nil;
}

- (void)loadView {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(tweetSP:)];
        self.navigationItem.rightBarButtonItem.tintColor = kTintColor;
    [super loadView];
    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;

}

- (void)tweetSP:(id)sender {
	SLComposeViewController *shareVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
	[shareVC setInitialText:@"hi @NoelielDEV"];
	[self presentViewController:shareVC animated:1 completion:nil];
}

- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2 {
    PSTableCell *cell = [super tableView:arg1 cellForRowAtIndexPath:arg2];
((UILabel *)cell.titleLabel).textColor = kTintColor;
return cell;
}
@end