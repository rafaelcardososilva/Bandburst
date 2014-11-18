//
//  TelaLoginViewController.m
//  appFinal1
//
//  Created by Rafael Cardoso on 07/07/14.
//  Copyright (c) 2014 RAFAEL BARALDI. All rights reserved.
//

#import "TelaLoginViewController.h"
#import "TelaBuscaViewController.h"
#import "TelaEsqueciSenhaViewController.h"

#import "LoginStore.h"
#import "LocalStore.h"

#import "IHKeyboardAvoiding.h"

#import "Reachability.h"

@interface TelaLoginViewController ()

@end

@implementation TelaLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [IHKeyboardAvoiding setAvoidingView:self.view withTarget:_target];
    
    [[[self navigationController] navigationBar] setTintColor:[[LocalStore sharedStore] FONTECOR]];
    [self carregaLayout];
    
    [self verificaSeEstaLogado];
    
    //LOADING
    //Fundo para o load
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 700)];
    view.backgroundColor = [UIColor grayColor];
    view.alpha = 0.5f;
//    [self.view addSubview:view];
    
    //Bloquea o acesso do usuario na View
    [self.view setUserInteractionEnabled:YES];
    
    //Load
    UIActivityIndicatorView *load = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [load setCenter:self.view.center];
    [load startAnimating];
//    [self.view addSubview:load];
}

-(void) verificaSeEstaLogado{
    
    if([LoginStore verificaSeEstaLogado]){
        
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [self presentViewController:[LocalStore iniciaAplication] animated:NO completion:^{
                
            }];
        });
    }
}

-(void)carregaLayout{
    
    //Entrar
    _btnEntrar.backgroundColor = [[LocalStore sharedStore] FONTECOR];
    _btnEntrar.layer.cornerRadius = [[LocalStore sharedStore] RAIOBORDA];
    [[_btnEntrar titleLabel] setFont:[UIFont fontWithName:[[LocalStore sharedStore] FONTEFAMILIA] size:16]];
    
    //Cadastrar
    _btnCadastrar.backgroundColor = [[LocalStore sharedStore] FONTECOR];
    _btnCadastrar.layer.cornerRadius = [[LocalStore sharedStore] RAIOBORDA];
    [[_btnCadastrar titleLabel] setFont:[UIFont fontWithName:[[LocalStore sharedStore] FONTEFAMILIA] size:16]];
    
    //Login
    _btnContinuar.backgroundColor = [[LocalStore sharedStore] FONTECOR];
    _btnContinuar.layer.cornerRadius = [[LocalStore sharedStore] RAIOBORDA];
    [[_btnContinuar titleLabel] setFont:[UIFont fontWithName:[[LocalStore sharedStore] FONTEFAMILIA] size:16]];

    //TXT Email
    [_txtSenha setSecureTextEntry:YES];
    [[_txtEmail layer]setBorderWidth:2.0f];
    [[_txtEmail layer] setCornerRadius:[[LocalStore sharedStore] RAIOTEXT]];
    [[_txtEmail layer] setBorderColor:[[LocalStore sharedStore] FONTECOR].CGColor];
    [_txtEmail setFont:[UIFont fontWithName:[[LocalStore sharedStore] FONTEFAMILIA] size:16]];
    
    //TXT Senha
    [[_txtSenha layer] setBorderWidth:2.0f];
    [[_txtSenha layer] setCornerRadius:[[LocalStore sharedStore] RAIOTEXT]];
    [[_txtSenha layer] setBorderColor:[[LocalStore sharedStore] FONTECOR].CGColor];
    [_txtSenha setFont:[UIFont fontWithName:[[LocalStore sharedStore] FONTEFAMILIA] size:16]];
    
    //Esqueceu senha
    _lblEsqueceuSenha.tintColor = [[LocalStore sharedStore] FONTECOR];
    [[_lblEsqueceuSenha titleLabel] setFont:[UIFont fontWithName:[[LocalStore sharedStore] FONTEFAMILIA] size:16]];
}

-(void)viewWillAppear:(BOOL)animated{

    //Navigation Controller
    [[self navigationItem] setTitle:@"Bandburst"];
    [[self navigationItem] setHidesBackButton:YES];
}

-(void)viewDidDisappear:(BOOL)animated{
//    //[[self navigationItem] setTitle:@""];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationItem setHidesBackButton:YES];

    _txtSenha.text = @"";
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

//Return Text Field
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)btnSenhaClick:(id)sender {
    
    //Salva email temporario
    [[LoginStore sharedStore] setEmailTemporario:_txtEmail.text];
    
    [[self navigationController] pushViewController:[[LocalStore sharedStore] TelaEsqueciSenha] animated:YES];
}

- (IBAction)btnContinuarClick:(id)sender {
    
    NSString *email = _txtEmail.text;
    NSString *senha = _txtSenha.text;
    
    if([email length] > 0 && [senha length] > 0){
        
        //Funcao que Vai usar a Internet
        //Verifica se tem internet
        if ([LocalStore verificaSeTemInternet]) {
            
            
            self.view.alpha = 0.5f;
            
            //View Carregando
            if([LoginStore login:email senha:senha]){
                [self presentViewController:[LocalStore iniciaAplication] animated:YES completion:^{}];
            }
            else{
                UIAlertView *alertDadosIncorretos = [[UIAlertView alloc] initWithTitle:@"ERRO" message:@"E-mail ou senha inválidos" delegate:self cancelButtonTitle:@"Rejeitar" otherButtonTitles:nil];
                [alertDadosIncorretos show];
            }
        }
        else{
            UILabel*lblSemNet = [LocalStore viewSemInternet];
            
            [self.view addSubview:lblSemNet];
            [LocalStore showViewSemNet:lblSemNet];
        }
    }
}

- (IBAction)btnCadastrarClick:(id)sender {
    
    if ([LocalStore verificaSeViewJaEstaNaPilha:[[self navigationController] viewControllers] proximaTela:[[LocalStore sharedStore] TelaCadastro]]) {
        [[self navigationController] popToViewController:[[LocalStore sharedStore] TelaCadastro] animated:YES];
    }
    else{
        [[self navigationController] pushViewController:[[LocalStore sharedStore] TelaCadastro] animated:YES];
    }
}

- (IBAction)btnEntrarClick:(id)sender {
    
    [LocalStore setParaUsuarioZero];

    [self presentViewController:[LocalStore iniciaAplication] animated:YES completion:^{
        
    }];
    
    
//    if ([LocalStore verificaSeViewJaEstaNaPilha:[[self navigationController] viewControllers] proximaTela:[[LocalStore sharedStore] TelaBusca]]) {
//        [[self navigationController] popToViewController:[[LocalStore sharedStore] TelaGravacao] animated:YES];
//    }
//    else{
//        [[self navigationController] pushViewController:[[LocalStore sharedStore] TelaBusca] animated:YES];
//    }
}

@end
