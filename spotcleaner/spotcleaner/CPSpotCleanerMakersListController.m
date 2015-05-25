#import "CPSpotCleanerMakersListController.h"
#import "CPSpotCleanerPreferences.h"

@implementation CPSpotCleanerMakersListController

-(id)specifiers {
    if(_specifiers == nil) {
        _specifiers = [super specifiersForPlistName:@"SpotCleanerMakers"];
    }
    [self setTitle:[[CPSpotCleanerLocalizer sharedLocalizer] localizedStringForKey:@"MAKERS"]];
    return _specifiers;
}

- (void)loadView {
    [super loadView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(tweetSupport:)];
}

- (void)tweetSupport:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        SLComposeViewController *composeController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        [composeController setInitialText:@"Love using #SpotCleaner to cleanup the Spotify UI, thanks @CPDigDarkroom"];
        
        [self presentViewController:composeController animated:YES completion:nil];
        
        SLComposeViewControllerCompletionHandler myBlock = ^(SLComposeViewControllerResult result){
            [composeController dismissViewControllerAnimated:YES completion:nil];
        };
        composeController.completionHandler = myBlock;
    }
}

@end