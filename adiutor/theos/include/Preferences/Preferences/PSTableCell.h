@class PSSpecifier;

enum PSTableCellType {
    PSGroupCell,
    PSLinkCell,
    PSLinkListCell,
    PSListItemCell,
    PSTitleValueCell,
    PSSliderCell,
    PSSwitchCell,
    PSStaticTextCell,
    PSEditTextCell,
    PSSegmentCell,
    PSGiantIconCell,
    PSGiantCell,
    PSSecureEditTextCell,
    PSButtonCell,
    PSEditTextViewCell
} PSTableCellType;

@interface PSTableCell : UITableViewCell  {
    id _value;
    UIImageView *_checkedImageView;
    BOOL _checked;
    BOOL _shouldHideTitle;
    NSString *_hiddenTitle;
    int _alignment;
    SEL _pAction;
    id _pTarget;
    BOOL _cellEnabled;
    PSSpecifier *_specifier;
    int _type;
    BOOL _lazyIcon;
    BOOL _lazyIconDontUnload;
    BOOL _lazyIconForceSynchronous;
    NSString *_lazyIconAppID;
    BOOL _reusedCell;
    BOOL _isCopyable;
    UILongPressGestureRecognizer *_longTapRecognizer;
}


@property(retain) PSSpecifier *specifier;
@property (nonatomic, retain) id target;
@property SEL action;

+ (Class)cellClassForSpecifier:(id)arg1;
+ (int)cellStyle;
+ (int)cellTypeFromString:(id)arg1;
+ (id)reuseIdentifierForBasicCellTypes:(int)arg1;
+ (id)reuseIdentifierForClassAndType:(int)arg1;
+ (id)reuseIdentifierForSpecifier:(id)arg1;
+ (id)stringFromCellType:(int)arg1;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier;

- (id)titleLabel;
- (void)setIcon:(id)arg1;
- (BOOL)isChecked;
- (id)iconImageView;
- (void)setType:(int)arg1;
- (int)type;
- (id)title;
- (void)setCellEnabled:(BOOL)arg1;
- (void)setValue:(id)arg1;
- (void)setSeparatorStyle:(int)arg1;

- (id)titleTextLabel;
- (id)value;
- (UILabel *)valueLabel;
@end
