unit test_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,shellapi, StdCtrls, xmldom, XMLIntf, msxmldom, XMLDoc, OleCtrls,
  SHDocVw, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    x: TXMLDocument;
    Button2: TButton;
    edtq: TEdit;
    wb: TIdHTTP;
    redOut: TRichEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
ShellExecute(0, nil, 'cmd.exe', '/C node C:\Users\User\Desktop\DelphiAPI\app.js', nil, SW_SHOW);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
s : String;
begin
s := edtq.Text;
x.FileName := 'http://localhost:8080/?search='+s;
x.Active:= true;
redOut.Paragraph.TabCount := 3;
redOUt.Paragraph.Tab[0] := 0;
redOut.Paragraph.Tab[1] := 50;
//redout.Text := x.XML.Text;
redout.Lines.Add('Title: '+ #9+ x.ChildNodes['root'].ChildNodes['title'].Text);
redout.Lines.Add('Genre: '+ #9+ x.ChildNodes['root'].ChildNodes['genre'].Text);
redout.Lines.Add('Views: '+ #9+ x.ChildNodes['root'].ChildNodes['views'].Text);
redout.Lines.Add('Likes: '+ #9+ x.ChildNodes['root'].ChildNodes['likeCount'].Text);
redout.Lines.Add('Dislikes: '+ #9+ x.ChildNodes['root'].ChildNodes['dislikeCount'].Text);
end;
end.
