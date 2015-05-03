@interface NSConcreteNotification : NSNotification
{
    NSString *name;
    id object;
    NSDictionary *userInfo;
    BOOL dyingObject;
}

+ (id)newTempNotificationWithName:(id)arg1 object:(id)arg2 userInfo:(id)arg3;
- (void)recycle;
- (void)dealloc;
- (id)initWithName:(id)arg1 object:(id)arg2 userInfo:(id)arg3;
- (id)userInfo;
- (id)object;
- (id)name;

@end