#import "PrefHeaders.h"

@interface adiutorCreditsController: PSListController {
}
@end

@implementation adiutorCreditsController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"adiutorCredits" target:self] retain];
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

@interface GreenyDev : PSTableCell {
    UIImageView *_background;
    UILabel *devName;
    UILabel *devRealName;
    UILabel *jobSubtitle;
}
@end

@implementation GreenyDev
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])){
        UIImage *bkIm = [[UIImage alloc] initWithContentsOfFile:@"/Library/PreferenceBundles/adiutor.bundle/GreenyDevTwitter.png"];
        _background = [[UIImageView alloc] initWithImage:bkIm];
        _background.frame = CGRectMake(10, 15, 70, 70);
                    _background.layer.cornerRadius = _background.frame.size.height / 2;
            _background.layer.masksToBounds = YES;
            _background.layer.borderWidth = 0;
        [self addSubview:_background];
        
        CGRect frame = [self frame];
        
        devName = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x + 95, frame.origin.y + 10, frame.size.width, frame.size.height)];
        [devName setText:@"Thomas G"];
        [devName setBackgroundColor:[UIColor clearColor]];
        [devName setTextColor:kTintColor];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            [devName setFont:[UIFont fontWithName:@"Helvetica Light" size:30]];
        else
            [devName setFont:[UIFont fontWithName:@"Helvetica Light" size:23]];
        
        [self addSubview:devName];
        
        devRealName = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x + 95, frame.origin.y + 30, frame.size.width, frame.size.height)];
        [devRealName setText:@"@GreenyDev on Twitter"];
        [devRealName setTextColor:kTintColor];
        [devRealName setBackgroundColor:[UIColor clearColor]];
        [devRealName setFont:[UIFont fontWithName:@"Helvetica Light" size:15]];
        
        [self addSubview:devRealName];

        jobSubtitle = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x + 95, frame.origin.y + 50, frame.size.width, frame.size.height)];
        [jobSubtitle setText:@"Lead Developer"];
        [jobSubtitle setTextColor:kTintColor];
        [jobSubtitle setBackgroundColor:[UIColor clearColor]];
        [jobSubtitle setFont:[UIFont fontWithName:@"Helvetica Light" size:15]];
        
        [self addSubview:jobSubtitle];
    }
    return self;
}

- (CGFloat)preferredHeightForWidth:(CGFloat)arg1
{
    return 70.f;
}


@end

@interface GreenyTwitter : PSListController { }
@end

@implementation GreenyTwitter
- (id)specifiers {
    NSString *user = @"GreenyDev";
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetbot:///user_profile/" stringByAppendingString:user]]];
    
    else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitterrific:///profile?screen_name=" stringByAppendingString:user]]];
    
    else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetings:///user?screen_name=" stringByAppendingString:user]]];
    
    else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitter://user?screen_name=" stringByAppendingString:user]]];
    
    else
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"https://mobile.twitter.com/" stringByAppendingString:user]]];
    return 0;
}

- (void)viewDidAppear:(BOOL)arg1 {
    UINavigationController *navController = self.navigationController;
    [navController popViewControllerAnimated:YES];
}
@end

@interface ethan : PSTableCell {
    UIImageView *_background;
    UILabel *devName;
    UILabel *devRealName;
    UILabel *jobSubtitle;
}
@end

@implementation ethan
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])){
        UIImage *bkIm = [[UIImage alloc] initWithContentsOfFile:@"/Library/PreferenceBundles/adiutor.bundle/someweirdo.png"];
        _background = [[UIImageView alloc] initWithImage:bkIm];
        _background.frame = CGRectMake(10, 15, 70, 70);
                    _background.layer.cornerRadius = _background.frame.size.height / 2;
            _background.layer.masksToBounds = YES;
            _background.layer.borderWidth = 0;
        [self addSubview:_background];
        
        CGRect frame = [self frame];
        
        devName = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x + 95, frame.origin.y + 10, frame.size.width, frame.size.height)];
        [devName setText:@"Ethan Arbuckle"];
        [devName setBackgroundColor:[UIColor clearColor]];
        [devName setTextColor:kTintColor];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            [devName setFont:[UIFont fontWithName:@"Helvetica Light" size:30]];
        else
            [devName setFont:[UIFont fontWithName:@"Helvetica Light" size:23]];
        
        [self addSubview:devName];
        
        devRealName = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x + 95, frame.origin.y + 30, frame.size.width, frame.size.height)];
        [devRealName setText:@"@its_not_herpes on Twitter"];
        [devRealName setTextColor:kTintColor];
        [devRealName setBackgroundColor:[UIColor clearColor]];
        [devRealName setFont:[UIFont fontWithName:@"Helvetica Light" size:15]];
        
        [self addSubview:devRealName];

        jobSubtitle = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x + 95, frame.origin.y + 50, frame.size.width, frame.size.height)];
        [jobSubtitle setText:@"Developer"];
        [jobSubtitle setTextColor:kTintColor];
        [jobSubtitle setBackgroundColor:[UIColor clearColor]];
        [jobSubtitle setFont:[UIFont fontWithName:@"Helvetica Light" size:15]];
        
        [self addSubview:jobSubtitle];
    }
    return self;
}

- (CGFloat)preferredHeightForWidth:(CGFloat)arg1
{
    return 70.f;
}


@end

@interface ethantwitter : PSListController { }
@end

@implementation ethantwitter
- (id)specifiers {
    NSString *user = @"its_not_herpes";
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetbot:///user_profile/" stringByAppendingString:user]]];
    
    else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitterrific:///profile?screen_name=" stringByAppendingString:user]]];
    
    else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetings:///user?screen_name=" stringByAppendingString:user]]];
    
    else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitter://user?screen_name=" stringByAppendingString:user]]];
    
    else
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"https://mobile.twitter.com/" stringByAppendingString:user]]];
    return 0;
}

- (void)viewDidAppear:(BOOL)arg1 {
    UINavigationController *navController = self.navigationController;
    [navController popViewControllerAnimated:YES];
}
@end

@interface megachon : PSTableCell {
    UIImageView *_background;
    UILabel *devName;
    UILabel *devRealName;
    UILabel *jobSubtitle;
}
@end

@implementation megachon
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])){
        UIImage *bkIm = [[UIImage alloc] initWithContentsOfFile:@"/Library/PreferenceBundles/adiutor.bundle/megachon.png"];
        _background = [[UIImageView alloc] initWithImage:bkIm];
        _background.frame = CGRectMake(10, 15, 70, 70);
                    _background.layer.cornerRadius = _background.frame.size.height / 2;
            _background.layer.masksToBounds = YES;
            _background.layer.borderWidth = 0;
        [self addSubview:_background];
        
        CGRect frame = [self frame];
        
        devName = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x + 95, frame.origin.y + 10, frame.size.width, frame.size.height)];
        [devName setText:@"Chon Lee"];
        [devName setBackgroundColor:[UIColor clearColor]];
        [devName setTextColor:kTintColor];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            [devName setFont:[UIFont fontWithName:@"Helvetica Light" size:30]];
        else
            [devName setFont:[UIFont fontWithName:@"Helvetica Light" size:23]];
        
        [self addSubview:devName];
        
        devRealName = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x + 95, frame.origin.y + 30, frame.size.width, frame.size.height)];
        [devRealName setText:@"@HikoMitsuketa on Twitter"];
        [devRealName setTextColor:kTintColor];
        [devRealName setBackgroundColor:[UIColor clearColor]];
        [devRealName setFont:[UIFont fontWithName:@"Helvetica Light" size:15]];
        
        [self addSubview:devRealName];

        jobSubtitle = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x + 95, frame.origin.y + 50, frame.size.width, frame.size.height)];
        [jobSubtitle setText:@"Icon Designer"];
        [jobSubtitle setTextColor:kTintColor];
        [jobSubtitle setBackgroundColor:[UIColor clearColor]];
        [jobSubtitle setFont:[UIFont fontWithName:@"Helvetica Light" size:15]];
        
        [self addSubview:jobSubtitle];
    }
    return self;
}

- (CGFloat)preferredHeightForWidth:(CGFloat)arg1
{
    return 70.f;
}


@end

@interface megachontwitter : PSListController { }
@end

@implementation megachontwitter
- (id)specifiers {
    NSString *user = @"HikoMitsuketa";
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetbot:///user_profile/" stringByAppendingString:user]]];
    
    else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitterrific:///profile?screen_name=" stringByAppendingString:user]]];
    
    else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetings:///user?screen_name=" stringByAppendingString:user]]];
    
    else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitter://user?screen_name=" stringByAppendingString:user]]];
    
    else
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"https://mobile.twitter.com/" stringByAppendingString:user]]];
    return 0;
}

- (void)viewDidAppear:(BOOL)arg1 {
    UINavigationController *navController = self.navigationController;
    [navController popViewControllerAnimated:YES];
}
@end