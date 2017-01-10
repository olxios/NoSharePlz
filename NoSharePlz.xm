@interface SBSApplicationShortcutItem : NSObject

@property (nonatomic, copy) NSString *type;

@end


%hook SBIconController

-(id)appIconForceTouchController:(id)controller applicationShortcutItemsForGestureRecognizer:(UIGestureRecognizer *)recognizer
{
    NSArray *icons = %orig;
    NSMutableArray *newIcons = [NSMutableArray array];

    for (SBSApplicationShortcutItem *item in icons)
    {
        if (![item.type isEqualToString:@"com.apple.springboard.application-shortcut-item.share"])
        {
            [newIcons addObject:item];
        }
    }

    return newIcons;
}

%end
