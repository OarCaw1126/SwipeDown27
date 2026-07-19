#import <UIKit/UIKit.h>

@interface SBHomeScreenViewController : UIViewController
@end

%hook SBHomeScreenViewController

- (void)viewDidLoad {
    %orig;
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleLiquidSwipe:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self.view addGestureRecognizer:swipeDown];
}

%new
- (void)handleLiquidSwipe:(UISwipeGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        UIView *overlayView = [[UIView alloc] initWithFrame:self.view.bounds];
        overlayView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4]; // Fondo oscuro traslúcido
        overlayView.alpha = 0.0;
        overlayView.tag = 2600; // Identificador único
        
        UILabel *clockLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 120)];
        clockLabel.text = @"12:30";
        clockLabel.textAlignment = NSTextAlignmentCenter;
        
        clockLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:90]; 
        clockLabel.textColor = [UIColor systemRedColor]; // Cambiar al color preferido
        
        clockLabel.layer.shadowColor = [UIColor blackColor].CGColor;
        clockLabel.layer.shadowOffset = CGSizeMake(0, 5);
        clockLabel.layer.shadowOpacity = 0.8;
        clockLabel.layer.shadowRadius = 4.0;
        
        [overlayView addSubview:clockLabel];
        [self.view addSubview:overlayView];
        
        overlayView.transform = CGAffineTransformMakeTranslation(0, -self.view.bounds.size.height);
        
        [UIView animateWithDuration:0.4 
                              delay:0 
             usingSpringWithDamping:0.7 
              initialSpringVelocity:1.0 
                            options:UIViewAnimationOptionCurveEaseInOut 
                         animations:^{
                             overlayView.alpha = 1.0;
                             overlayView.transform = CGAffineTransformIdentity;
                         } completion:nil];
                         
        UITapGestureRecognizer *dismissTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissLiquidOverlay:)];
        [overlayView addGestureRecognizer:dismissTap];
    }
}

%new
- (void)dismissLiquidOverlay:(UITapGestureRecognizer *)sender {
    UIView *overlayView = sender.view;
    
    [UIView animateWithDuration:0.3 animations:^{
        overlayView.alpha = 0.0;
        overlayView.transform = CGAffineTransformMakeTranslation(0, -overlayView.bounds.size.height);
    } completion:^(BOOL finished) {
        [overlayView removeFromSuperview];
    }];
}

%end
