unit Splash_Screen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg;

type
  TSplashScreen = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    LBL_Status: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplashScreen: TSplashScreen;

implementation

{$R *.dfm}

end.
