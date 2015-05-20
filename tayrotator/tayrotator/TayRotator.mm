#import "CPTayRotatorLogoTableCell.h"
#import "CPTayRotatorCustomHeaderView.h"
#import "CPTayRotatorPreferences.h"
#import <MobileGestalt/MobileGestalt.h>

@interface TayRotatorListController: CPTayRotatorListController <MFMailComposeViewControllerDelegate>{
}
@end

@implementation TayRotatorListController
-(id)specifiers {
    if(_specifiers == nil) {
        _specifiers = [super specifiersForPlistName:@"TayRotator"];
    }
    return _specifiers;
}

- (void)loadView {
    [super loadView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(tweetSupport:)];
}

-(void)viewDidLoad {
    UIImage *icon = [[UIImage alloc] initWithContentsOfFile:HEADER_ICON];
    icon = [icon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImageView *iconView = [[UIImageView alloc] initWithImage:icon];
    self.navigationItem.titleView = iconView;
    self.navigationItem.titleView.alpha = 0;

    [super viewDidLoad];

    [NSTimer scheduledTimerWithTimeInterval:0.5
                                     target:self
                                   selector:@selector(increaseAlpha)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)increaseAlpha {
    [UIView animateWithDuration:0.5
                     animations:^{
                         self.navigationItem.titleView.alpha = 1;
                }completion:nil];
}

- (void)tweetSupport:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        SLComposeViewController *composeController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        [composeController setInitialText:@"#TayRotator is awesome!"];
        
        [self presentViewController:composeController animated:YES completion:nil];
        
        SLComposeViewControllerCompletionHandler myBlock = ^(SLComposeViewControllerResult result){
            [composeController dismissViewControllerAnimated:YES completion:nil];
        };
        composeController.completionHandler = myBlock;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return (UIView *)[[CPTayRotatorCustomHeaderView alloc] init];
    } else if(section == 4){
        return (UIView *)[[CPTayRotatorLogoTableCell alloc] init];
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 140.f;
    } else if(section == 4){
        return 30.f;
    }
    return (CGFloat)-1;
}

- (void)emailCP {
    MFMailComposeViewController *emailCP = [[MFMailComposeViewController alloc] init];
    [emailCP setSubject:@"TayRotator Support"];
    [emailCP setToRecipients:[NSArray arrayWithObjects:@"CP Digital Darkroom <tweaks@cpdigitaldarkroom.support>", nil]];

   /* NSString *product = nil, *version = nil, *build = nil;

    
        product = (NSString *)MGCopyAnswer(kMGProductType);
        version = (NSString *)MGCopyAnswer(kMGProductVersion);
        build = (NSString *)MGCopyAnswer(kMGBuildVersion);

    [emailCP setMessageBody:[NSString stringWithFormat:@"\n\nCurrent Device: %@, iOS %@ (%@)", product, version, build] isHTML:NO];*/

    [emailCP addAttachmentData:[NSData dataWithContentsOfFile:@"/var/mobile//Library/Preferences/com.cpdigitaldarkroom.tayrotator.plist"] mimeType:@"application/xml" fileName:@"TayRotatorPrefs.plist"];
    system("/usr/bin/dpkg -l >/tmp/dpkgl.log");
    [emailCP addAttachmentData:[NSData dataWithContentsOfFile:@"/tmp/dpkgl.log"] mimeType:@"text/plain" fileName:@"dpkgl.txt"];
    [self.navigationController presentViewController:emailCP animated:YES completion:nil];
    emailCP.mailComposeDelegate = self;
    [emailCP release];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    [self dismissViewControllerAnimated: YES completion: nil];
}

@end