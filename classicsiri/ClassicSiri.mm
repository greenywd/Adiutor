#define kTintColor [UIColor colorWithRed:86/255 green:86/255 blue:92/255 alpha:1.0]
#import <Preferences/Preferences.h>
#import <Twitter/TWTweetComposeViewController.h>

@interface ClassicSiriListController: PSListController {
}
@end

@implementation ClassicSiriListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"ClassicSiri" target:self] retain];
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
    TWTweetComposeViewController *tweetController = [[TWTweetComposeViewController alloc] init];
    [tweetController setInitialText:@"placeholder"];
    [self.navigationController presentViewController:tweetController animated:YES completion:nil];
    [tweetController release];
}

- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2 {
    PSTableCell *cell = [super tableView:arg1 cellForRowAtIndexPath:arg2];
((UILabel *)cell.titleLabel).textColor = kTintColor;
return cell;
}
@end

// vim:ft=objc
