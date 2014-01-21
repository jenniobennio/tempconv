//
//  TempViewController.m
//  TempConverter
//
//  Created by Jenny Kwan on 1/19/14.
//  Copyright (c) 2014 Jenny Kwan. All rights reserved.
//

#import "TempViewController.h"

@interface TempViewController ()
- (IBAction)onTap:(id)sender;
- (IBAction)editFEnded:(id)sender;
- (IBAction)editCEnded:(id)sender;
- (IBAction)onClearButton:(id)sender;

- (void) onDoneButton;
@end

@implementation TempViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.fahrenheitTextField.delegate = self;
    
    self.convertButton.layer.cornerRadius = 10;
    self.convertButton.clipsToBounds = YES;
    self.clearButton.layer.cornerRadius = 10;
    self.clearButton.clipsToBounds = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClearButton:(id)sender{
    self.celsiusTextField.text = nil;
    self.fahrenheitTextField.text = nil;
    [self onDoneButton];
}

- (IBAction)onTap:(id)sender {
    [self onDoneButton];
}

- (IBAction)editFEnded:(id)sender {
    float fVal = [self.fahrenheitTextField.text floatValue];
    self.celsiusTextField.text = [NSString stringWithFormat:@"%0.2f", (fVal-32)/1.8];
}

- (IBAction)editCEnded:(id)sender {
    float cVal = [self.celsiusTextField.text floatValue];
    self.fahrenheitTextField.text = [NSString stringWithFormat:@"%0.2f", cVal*1.8 + 32];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = nil;
    return YES;
}


- (void)onDoneButton {
    [self.view endEditing:YES];
}
@end
