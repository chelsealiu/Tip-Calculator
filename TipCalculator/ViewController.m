//
//  ViewController.m
//  TipCalculator
//
//  Created by Chelsea Liu on 6/19/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)calculateTip:(id)sender {
    
    NSString *inputPercentage = [self.percentageAmountTextfield text];
    
    //if input is valid
    bool isNumber = true;
    int counter = 0;
    for (int i = 0; i < [inputPercentage length]; i++) {
        unichar c = [inputPercentage characterAtIndex:i];
        if ((c>='0' && c<='9') || c =='.') {
            isNumber = true;
            if (c == '.') {
                counter ++;
            }
        }
        else {
            isNumber = false;
            break;
        }
    }
    
    //output in field
    if (isNumber == false || counter > 1) {
        self.tipAmountLabel.text = @"That is not a valid input.";
        self.totalAmountLabel.text = @" ";

    } else {
        NSNumber *percentageAmount = [NSNumber numberWithDouble: [inputPercentage doubleValue]];
        self.finalPercentageAmount = [percentageAmount doubleValue];
        
    }
    
    
    NSString *inputBill = [self.billAmountTextField text];
    
    //if input is valid
    bool isNumber2 = true;
    int counter2 = 0;
    for (int i = 0; i < [inputBill length]; i++) {
        unichar c = [inputBill characterAtIndex:i];
        if ((c>='0' && c<='9') || c =='.') {
            isNumber2 = true;
            if (c == '.') {
                counter2 ++;
            }
        }
        else {
            isNumber2 = false;
            break;
        }
    }
    
    //output in field
    if (isNumber2 == false || counter2 > 1) {
        self.tipAmountLabel.text = @"That is not a valid input.";
        self.totalAmountLabel.text = @" ";

        
    } else {
        
        //tip output
        NSNumber *billAmount = [NSNumber numberWithDouble: [inputBill doubleValue]];
        double tempBillAmount = [billAmount doubleValue];
        double tempTipAmount = tempBillAmount * self.finalPercentageAmount * 0.01;
        NSString *finalString = [NSString stringWithFormat: @"%.2f", tempTipAmount];
                self.tipAmountLabel.text = [@"Your tip is: $" stringByAppendingString:finalString];
        
        //final bill output
        double tempTotalAmount = tempTipAmount + tempBillAmount;
        NSString *finalTotal = [NSString stringWithFormat: @"%.2f", tempTotalAmount];
        self.totalAmountLabel.text = [@"Your total bill is: $ " stringByAppendingString:finalTotal];
    }
    
    

   

}


- (IBAction)adjustTipPercentage:(id)sender {
    
    self.tipSlider.minimumValue = 0;
    self.tipSlider.maximumValue = 100;
    self.tipSlider.userInteractionEnabled = YES;
    self.percentageAmountTextfield.text = [NSString stringWithFormat:@"%0.2f", self.tipSlider.value];
    
}

@end
