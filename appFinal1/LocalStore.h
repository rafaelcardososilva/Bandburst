//
//  SharedStore.h
//  appFinal1
//
//  Created by RAFAEL BARALDI on 15/05/14.
//  Copyright (c) 2014 RAFAEL BARALDI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

#import "TelaCadastroViewController.h"
#import "TelaLoginViewController.h"
#import "TelaEsqueciSenhaViewController.h"
#import "TelaPerfilViewController.h"
#import "TelaBuscaViewController.h"
#import "TelaUsuarioFiltrado.h"
#import "TelaInicioViewController.h"
#import "TelaHorariosViewController.h"
#import "TelaCadastroFotoViewController.h"
#import "TelaOpcoesViewController.h"
#import "TelaNovaBandaViewController.h"
#import "TelaAmigosViewController.h"
#import "TelaBandaViewController.h"
#import "TelaGravacoesViewController.h"
#import "TelaFavoritadosViewController.h"
#import "TelaPerfilBandaViewController.h"
#import "TelaPlayerViewController.h"
#import "LoadingViewController.h"

#import "TBInstrumentosViewController.h"
#import "TBInstrumentosQueTocaViewController.h"
#import "TBEstilosViewController.h"
#import "TBEstilosQueTocaViewController.h"

#import "TBFiltroEstilo.h"
#import "TBFiltroHorario.h"
#import "TBFiltroInstrumento.h"

#import "CoreAudioViewController.h"

#import "TPUsuario.h"

@interface LocalStore : NSObject

@property int RAIOBORDA;
@property int RAIOTEXT;
@property UIColor *FONTECOR;
@property NSString *FONTEFAMILIA;

@property NSString *USUARIOZERO;
@property NSString *URL;

@property TPUsuario *usuarioAtual;

@property TelaGravacoesViewController *TelaGravacoes;

@property TBInstrumentosViewController *TelaTBInstrumentos;
@property TBInstrumentosQueTocaViewController *TelaTBInstruementosQueToco;
@property TBEstilosQueTocaViewController *TelaTBEstilosQueToco;
@property TBEstilosViewController *TelaTBEstilos;
@property TelaPerfilViewController *TelaPerfil;
@property TelaCadastroViewController *TelaCadastro;
@property TelaEsqueciSenhaViewController *TelaEsqueciSenha;
@property TelaLoginViewController *TelaLogin;
@property TelaBuscaViewController *TelaBusca;
@property TelaInicioViewController *TelaInicio;
@property TelaHorariosViewController *TelaHorarios;
@property TelaCadastroFotoViewController *TelaCadastroFoto;
@property TelaUsuarioFiltrado *TelaUsuarioFiltrado;
@property TelaOpcoesViewController *TelaOpcoes;
@property CoreAudioViewController* TelaGravacao;
@property TelaNovaBandaViewController* TelaNovaBanda;
@property TelaAmigosViewController* TelaAmigos;
@property TelaBandaViewController *TelaBanda;
@property TelaCadastroViewController *TelaEditarPerfil;
@property TelaFavoritadosViewController *TelaFavoritados;
@property TelaPerfilBandaViewController *TelaPerfilBanda;
@property TelaPlayerViewController *TelaPlayer;
@property LoadingViewController *TelaLoading;

@property TBFiltroEstilo *TBFiltroEstilo;
@property TBFiltroHorario *TBFiltroHorario;
@property TBFiltroInstrumento *TBFiltroInstrumento;

@property AppDelegate *appDelegate;
@property NSManagedObjectContext *context;

+(LocalStore*)sharedStore;

-(NSString*)substituiCaracteresHTML:(NSString*)htmlCode;

+(BOOL)verificaSeViewJaEstaNaPilha:(NSArray*)viewControlers proximaTela:(UIViewController*)proximaTela;

+(void)setParaUsuarioZero;

+(void)carregaCoresDoLayout;

+(UITabBarController*)iniciaAplication;

+(void)hideTabBar:(UITabBarController*)tabbarcontroller;

+(void)showTabBar:(UITabBarController*)tabbarcontroller;

+(void)showViewSemNet:(UILabel*)lblSemNet;

+(BOOL)verificaSeTemInternet;

+(UILabel*) viewSemInternet;

@end
