#import "PrefHeaders.h"

bool pirated;
UILongPressGestureRecognizer *longPressGestureRecnognizer;

void isPirated(){
    if([[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/com.greeny.adiutor.list"] && ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/org.thebigboss.adiutor.list"]){
        pirated = NO;
    }
}

@interface adiutorListController : PSListController {
}
@end

@implementation adiutorListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"adiutor" target:self] retain];
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
	[shareVC setInitialText:@"I'm using #Adiutor by @GreenyDev to use a minimal Siri!"];
	[self presentViewController:shareVC animated:1 completion:nil];
}

- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2 {
    PSTableCell *cell = [super tableView:arg1 cellForRowAtIndexPath:arg2];
((UILabel *)cell.titleLabel).textColor = kTintColor;
return cell;
}
@end

@interface adiutorHeaderCell : PSTableCell{
  UILabel *header;
  UILabel *footer;
  UILabel *easterEggText;
  UILabel *easterEggText2;
  UILabel *easterEggText3;
  UILabel *easterEggText4;
  UIImageView *_cellImageView;
}
@end
 
@implementation adiutorHeaderCell
    - (id)initWithSpecifier:(PSSpecifier *)specifier{
    //int width = [self.specifier.target rootController].view.frame.size.width;
      
      self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SiriBarPreviewCell" specifier:specifier];
     if (self) {
        CGRect frame = CGRectMake(0, -50, 500, 199);
        CGRect randFrame = CGRectMake(0, 25, kWidth, 60);
        CGRect randFrame2 = CGRectMake(0, 70, kWidth, 60);
        CGRect centeredText = CGRectMake(0,-200, kWidth,60);
        CGRect centeredText2 = CGRectMake(0,-300, kWidth,60);
        CGRect centeredText3 = CGRectMake(0,-400, kWidth,60);
        CGRect centeredText4 = CGRectMake(0,-500, kWidth,100);

            UIImage *image = [[UIImage alloc] initWithContentsOfFile:@"/Library/PreferenceBundles/adiutor.bundle/Pingu_final.png"];
            _cellImageView = [[UIImageView alloc] initWithImage:image];
            _cellImageView.frame = CGRectMake(0,-100,100,150);
            [self addSubview:_cellImageView];

        UIView *view = [[UIView alloc] initWithFrame:frame];
        view.backgroundColor = kTintColor;

        longPressGestureRecnognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
        longPressGestureRecnognizer.minimumPressDuration = 1;
        [view addGestureRecognizer:longPressGestureRecnognizer];

        header = [[UILabel alloc] initWithFrame:randFrame];
        [header setNumberOfLines:1];
        header.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:36];
        [header setText:@"Adiutor"];
        [header setBackgroundColor:[UIColor clearColor]];
        header.textColor = [UIColor whiteColor];
        header.textAlignment = NSTextAlignmentCenter;

        footer = [[UILabel alloc] initWithFrame:randFrame2];
        [footer setNumberOfLines:1];
        footer.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
        if(!pirated){
        [footer setText:@"Thank you for your purchase"];
    } else {
        [footer setText:@":("];
    }
        [footer setBackgroundColor:[UIColor clearColor]];
        footer.textColor = [UIColor whiteColor];
        footer.textAlignment = NSTextAlignmentCenter;

        easterEggText = [[UILabel alloc] initWithFrame:centeredText];
        [easterEggText setNumberOfLines:1];
        easterEggText.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
        [easterEggText setText:@"Hi there, scroll back down please"];
        [easterEggText setBackgroundColor:[UIColor clearColor]];
        easterEggText.textColor = [UIColor blackColor];
        easterEggText.textAlignment = NSTextAlignmentCenter;

        easterEggText2 = [[UILabel alloc] initWithFrame:centeredText2];
        [easterEggText2 setNumberOfLines:1];
        easterEggText2.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
        [easterEggText2 setText:@"Mate, get back down there"];    
        [easterEggText2 setBackgroundColor:[UIColor clearColor]];
        easterEggText2.textColor = [UIColor blackColor];
        easterEggText2.textAlignment = NSTextAlignmentCenter;

        easterEggText3 = [[UILabel alloc] initWithFrame:centeredText3];
        [easterEggText3 setNumberOfLines:1];
        easterEggText3.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
            [easterEggText3 setText:@"Fine, that's all there is up here."];
        [easterEggText3 setBackgroundColor:[UIColor clearColor]];
        easterEggText3.textColor = [UIColor blackColor];
        easterEggText3.textAlignment = NSTextAlignmentCenter;

        easterEggText4 = [[UILabel alloc] initWithFrame:centeredText4];
        [easterEggText4 setNumberOfLines:3];
        easterEggText4.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
        [easterEggText4 setText:@"Really, you made it all the way up here? Good job, you just wasted 20 seconds of your life :p"];
        [easterEggText4 setBackgroundColor:[UIColor clearColor]];
        easterEggText4.textColor = [UIColor blackColor];
        easterEggText4.textAlignment = NSTextAlignmentCenter;

        //[self addSubview:backgroundView];
        [self addSubview:view];
        [self addSubview:easterEggText];
        [self addSubview:easterEggText2];
        [self addSubview:easterEggText3];
        [self addSubview:easterEggText4];
        [self addSubview:header];
        [self addSubview:footer];

    }
    return self;
}
 
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    return 150.f;
}
-(void)longPressAction:(UILongPressGestureRecognizer*) gesture{
    if (gesture.state == UIGestureRecognizerStateBegan){
    //UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Message" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        //[alert show];
    }
}
@end

// vim:ft=objc
