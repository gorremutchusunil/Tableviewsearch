//
//  ViewController.h
//  TableSearch
//
//  Created by sunil  on 7/5/17.
//  Copyright © 2017 sunil . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableVIEW;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBAR;


@end

