//
//  ViewController.m
//  TableSearch
//
//  Created by sunil  on 7/5/17.
//  Copyright © 2017 sunil . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
   
}
@property(nonatomic,retain) NSMutableArray *tablearray;
@property(nonatomic,retain) NSMutableArray *searcharray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchBAR.delegate=self;
    _tablearray=[[NSMutableArray alloc]initWithObjects:@"sunil",@"shashi",@"harsha",@"Saicharan",@"ajay",@"babudurga",@"sailaxmi",@"anjali",@"rahul",@"fayaz",@"raviteja",@"mayaank", nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_searcharray.count>0) {
       return  _searcharray.count;
    }else{
        return _tablearray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellid=@"cellidentifier";
    UITableViewCell *cell=[_tableVIEW dequeueReusableCellWithIdentifier:cellid];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    if (_searcharray.count>0) {
         cell.textLabel.text=[_searcharray objectAtIndex:indexPath.row];
    }else{
      cell.textLabel.text=[_tablearray objectAtIndex:indexPath.row];
    }
    return  cell;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:YES animated:YES];
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSString *searchtext=searchBar.text;
   NSPredicate *predicate= [NSPredicate predicateWithFormat:@"SELF contains [c] %@",searchtext];
    self.searcharray=(NSMutableArray *)[self.tablearray filteredArrayUsingPredicate:predicate];
    [searchBar resignFirstResponder];
    [self.tableVIEW reloadData];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (searchText.length!=0)  {
        NSString *searchtext=searchBar.text;
        NSPredicate *predicate= [NSPredicate predicateWithFormat:@"SELF contains [c] %@",searchtext];
        self.searcharray=(NSMutableArray *)[self.tablearray filteredArrayUsingPredicate:predicate];
        [self.tableVIEW reloadData];
    }else{
        _searcharray=_tablearray;
        [self.tableVIEW reloadData];
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    searchBar.text=nil;
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
    _searcharray=_tablearray;
    [self.tableVIEW reloadData];
}

@end

