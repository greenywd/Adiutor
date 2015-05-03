#import "PSListController.h"

@interface PSSpecifier : NSObject {
    @public
    SEL _buttonAction;
    SEL _confirmationAction;
    SEL _confirmationCancelAction;
    SEL _controllerLoadAction;
    NSString *_name;
    NSMutableDictionary *_properties;
    NSDictionary *_shortTitleDict;
    BOOL _showContentString;
    NSDictionary *_titleDict;
    id _userInfo;
    NSArray *_values;
    int autoCapsType;
    int autoCorrectionType;
    SEL cancel;
    int cellType;
    Class detailControllerClass;
    Class editPaneClass;
    SEL getter;
    //int keyboardType;
    SEL setter;
    id target;
    //unsigned int textFieldType;
    SEL action;
    unsigned long long textFieldType;
    long long keyboardType;
}

@property(retain) NSString *identifier;
@property(retain) NSString *name;
@property(nonatomic, readwrite) int cellType;
@property (assign,nonatomic) PSListController *target;

+ (id)_bundle;
+ (id)_dataclassIconCache;
+ (id)_iconForDataclass:(id)arg1;
+ (id)acui_linkListCellSpecifierForDataclass:(id)arg1 target:(id)arg2 set:(SEL)arg3 get:(SEL)arg4 detail:(Class)arg5;
+ (id)acui_specifierForAppWithBundleID:(id)arg1 target:(id)arg2 set:(SEL)arg3 get:(SEL)arg4;
+ (id)acui_specifierForDataclass:(id)arg1 target:(id)arg2 set:(SEL)arg3 get:(SEL)arg4;
+ (int)autoCapsTypeForString:(id)arg1;
+ (int)autoCorrectionTypeForNumber:(id)arg1;
+ (id)buttonSpecifierWithTitle:(id)arg1 target:(id)arg2 action:(SEL)arg3 confirmationInfo:(id)arg4;
+ (id)deleteButtonSpecifierWithName:(id)arg1 target:(id)arg2 action:(SEL)arg3;
+ (id)emptyGroupSpecifier;
+ (id)groupSpecifierWithFooterLinkButton:(id)arg1;
+ (id)groupSpecifierWithFooterText:(id)arg1 linkButton:(id)arg2;
+ (id)groupSpecifierWithFooterText:(id)arg1 linkButtons:(id)arg2;
+ (id)groupSpecifierWithHeader:(id)arg1 footer:(id)arg2 linkButtons:(id)arg3;
+ (id)groupSpecifierWithHeader:(id)arg1 footer:(id)arg2;
+ (id)groupSpecifierWithName:(id)arg1;
+ (int)keyboardTypeForString:(id)arg1;
+ (id)preferenceSpecifierNamed:(id)arg1 target:(id)arg2 set:(SEL)arg3 get:(SEL)arg4 detail:(Class)arg5 cell:(int)arg6 edit:(Class)arg7;
+ (id)switchSpecifierWithTitle:(id)arg1 target:(id)arg2 setter:(SEL)arg3 getter:(SEL)arg4 key:(id)arg5;

- (NSDictionary *)properties;
- (void)setProperty:(id)property forKey:(NSString*)key;
- (id)propertyForKey:(NSString*)key;

@end
