//
//  ViewController.m
//  JK
//
//  Created by JK on 2018/9/2.
//  Copyright © 2018 JK. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *imageList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *plistPath = [[NSBundle mainBundle] pathForResource: @"ImageList" ofType:@"plist"];
    self.imageList = [[NSArray alloc] initWithContentsOfFile:plistPath];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.imageList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    
    NSUInteger row = [indexPath row];
    
    NSDictionary *rowDict = self.imageList[row];
    cell.textLabel.text = rowDict[@"desc"];
    NSString *imagePath = [[NSString alloc] initWithFormat:@"%@.jpeg", rowDict[@"name"]];
    cell.imageView.image = [UIImage imageNamed:imagePath];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
