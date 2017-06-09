//
//  ViewController.m
//  KrishnaDropDown
//
//  Created by daffolapmac on 17/05/17.
//  Copyright © 2017 daffolapmac. All rights reserved.
//

#import "ViewController.h"
#import "DropDownView.h"
@interface ViewController () <DropDownViewDelegate>
@property (strong, nonatomic) IBOutlet UIButton *buttonName;
@property (strong, nonatomic) IBOutlet UIButton *button2;
@property (strong, nonatomic) DropDownView *dropDown;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _dataArry = [NSArray array];
    _dropDown = [[DropDownView alloc]init];
    _dropDown.delegate = self;
    [self jsonFetch];
}
- (IBAction)buttonAction:(id)sender {
    if (_dataArry.count == 0){
        return;
    }
//    DropDownView *dropDown = [[DropDownView alloc]initWithView:sender andData:_dataArry];
//    dropDown.delegate = self;
    
    //[_dropDown setToView:self.view andData:_dataArry];
    [_dropDown setDropDownOnView:self.view belowView:sender andData:_dataArry];
    [_dropDown toggle];

}
- (IBAction)buttonAction2:(id)sender {
    if (_dataArry.count == 0){
        return;
    }
    //[_dropDown setToView:self.view andData:_dataArry];
    [_dropDown setDropDownOnView:self.view belowView:sender andData:_dataArry];
    [_dropDown toggle];

}

- (void)selectedName:(NSString *)name andContainerView:(UIView *)containerView{
    if (containerView == _buttonName){
    [_buttonName setTitle:name forState:UIControlStateNormal];
    }
    if (containerView == _button2){
        [_button2 setTitle:name forState:UIControlStateNormal];
    }
}

- (void)jsonFetch{
    
    NSURL *url = [NSURL URLWithString:@"http://128.199.67.227/work/public/api/superproperty"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *data = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *erro = nil;
        
        if (data!=nil) {
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&erro ];
            
            if (json.count > 0) {
                
                _dataArry = [json objectForKey:@"properties"];
                NSLog(@"%@", _dataArry);
            }
            
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
       
    }];
    
    [data resume];
}




@end
