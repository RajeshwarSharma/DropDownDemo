//
//  DropDownView.h
//  KrishnaDropDown
//
//  Created by daffolapmac on 17/05/17.
//  Copyright © 2017 daffolapmac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DropDownViewDelegate <NSObject>
@required

- (void)selectedName:(NSString *)name andContainerView:(UIView *)containerView;

@end

@interface DropDownView : UIView<UITableViewDelegate,UITableViewDataSource>
- (id)init;

-(void)setDropDownOnView:(UIView *)onView belowView:(UIView *)belowView andData:(NSArray *)dataArry;

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dataArry;
@property (weak) id<DropDownViewDelegate> delegate;
@property (nonatomic) BOOL isVisible;
@property (strong, nonatomic) UIView *onView;
@property (strong, nonatomic) UIView *belowView;
- (void)toggle;

@end


