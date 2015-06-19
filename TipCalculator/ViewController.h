//
//  ViewController.h
//  TipCalculator
//
//  Created by Chelsea Liu on 6/19/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;

@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;



@property (weak, nonatomic) IBOutlet UITextField *percentageAmountTextfield;

@property (weak, nonatomic) IBOutlet UILabel *totalAmountLabel;

@property (nonatomic) double finalPercentageAmount;

@property (weak, nonatomic) IBOutlet UISlider *tipSlider;


@end

