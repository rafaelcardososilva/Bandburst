//
//  TelaPerfilBandaViewController.h
//  Bandburst
//
//  Created by RAFAEL BARALDI on 21/10/14.
//  Copyright (c) 2014 RAFAEL BARALDI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPBanda.h"

@interface TelaPerfilBandaViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property BOOL visualizandoMembros;

@property (strong, nonatomic) IBOutlet UITableView *tbMembros;
@property (strong, nonatomic) IBOutlet UITableView *tbMusicas;
@property TPBanda* banda;
@property (strong, nonatomic) IBOutlet UIButton *btnEditar;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segTabela;
@property (strong, nonatomic) IBOutlet UIButton *btnChat;
@property (strong, nonatomic) IBOutlet UILabel *lblNome;

- (IBAction)segTabelaChange:(id)sender;
- (IBAction)btnCharClick:(id)sender;

@end