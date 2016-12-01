object frmMain: TfrmMain
  Left = 1403
  Top = 114
  Width = 516
  Height = 167
  Caption = 'frmMain'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  ShowHint = True
  WindowMenu = mnVikna
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 90
    Width = 500
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 75
      end
      item
        Width = 75
      end
      item
        Width = 100
      end>
  end
  object cbMain: TCoolBar
    Left = 0
    Top = 0
    Width = 500
    Height = 45
    Bands = <
      item
        Control = DBNavigator1
        ImageIndex = -1
        Width = 494
      end>
    Images = ilMain
    object DBNavigator1: TDBNavigator
      Left = 11
      Top = 0
      Width = 484
      Height = 25
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Hints.Strings = (
        #1055#1077#1088#1096#1080#1081' '#1079#1072#1087#1080#1089
        #1055#1086#1087#1077#1088#1077#1076#1085#1110#1081' '#1079#1072#1087#1080#1089
        #1053#1072#1089#1090#1091#1087#1085#1080#1081' '#1079#1072#1087#1080#1089
        #1054#1089#1090#1072#1085#1085#1110#1081' '#1079#1072#1087#1080#1089
        #1044#1086#1076#1072#1090#1080' '#1079#1072#1087#1080#1089
        #1042#1080#1076#1072#1083#1080#1090#1080' '#1079#1072#1087#1080#1089
        #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1079#1072#1087#1080#1089
        #1047#1072#1092#1110#1082#1089#1091#1074#1072#1090#1080' '#1079#1084#1110#1085#1080
        #1042#1110#1076#1084#1110#1085#1080#1090#1080' '#1088#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103
        #1055#1086#1085#1086#1074#1080#1090#1080' '#1074#1110#1076#1086#1084#1086#1089#1090#1110)
      TabOrder = 0
    end
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 52
    object mnZahodi: TMenuItem
      Caption = #1047#1072#1093#1086#1076#1080
      Hint = #1056#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103' '#1078#1091#1088#1085#1072#1083#1110#1074' '#1079#1072#1093#1086#1076#1110#1074
      object mnZahodiShtrafi: TMenuItem
        Caption = #1064#1090#1088#1072#1092#1080
        object mnZahodiShtrafiShtrafi: TMenuItem
          Action = aShtrafi
        end
        object mnShtrafiChoices: TMenuItem
          Caption = '-'
        end
        object mnZahodiShtrafiNeSplacheni: TMenuItem
          Action = frmShtrafi.aNeSplacheni
        end
        object mnZahodiShtrafiNeVrucheni: TMenuItem
          Action = frmShtrafi.aNeVrucheni
        end
        object mnZahodiShtrafiPeredaniDoVDVS: TMenuItem
          Caption = #1055#1077#1088#1077#1076#1072#1085#1110' '#1076#1086' '#1042#1044#1042#1057
          object mnZahodiShtrafiPeredaniDoVDVSPeredani: TMenuItem
            Action = frmShtrafi.aPeredaniDoVDVSPeredani
          end
          object mnZahodiShtrafiPeredaniDoVDVSSplacheni: TMenuItem
            Action = frmShtrafi.aPeredaniDoVDVSSplacheni
          end
        end
        object mnZahodiShtrafiNePeredaniDoVDVS: TMenuItem
          Action = frmShtrafi.aNePeredaniDoVDVS
        end
        object mnZahodiShtrafiPrimusovoStygneni: TMenuItem
          Action = frmShtrafi.aPrimusovoStygneni
        end
        object mnZahodiShtrafiSkasovani: TMenuItem
          Action = frmShtrafi.aSkasovani
        end
        object mnZahodiShtrafiSpivrobitnik: TMenuItem
          Action = frmShtrafi.aSpivrobitnik
        end
        object mnZahodiShtrafiTipShtrafu: TMenuItem
          Action = frmShtrafi.aTipShtrafu
        end
        object mnZahodiShtrafiObjekt: TMenuItem
          Caption = #1054#1073#39#1108#1082#1090
          object mnZahodiShtrafiObjektAdresa: TMenuItem
            Action = frmShtrafi.aObjekt_Adresa
          end
          object mnZahodiShtrafiObjektNazva: TMenuItem
            Action = frmShtrafi.aObjekt_Nazva
          end
        end
        object mnZahodiShtrafiRozdilT23F18: TMenuItem
          Action = frmShtrafi.aRozdilT23F18
        end
      end
      object mnZahodiAdmin_Zapobizh_Zahodi: TMenuItem
        Caption = #1040#1076#1084#1110#1085#1110#1089#1090#1088#1072#1090#1080#1074#1085#1086'-'#1079#1072#1087#1086#1073#1110#1078#1085#1110' '#1079#1072#1093#1086#1076#1080
        object mnZahodiAdmin_Zapobizh_ZahodiAdminZapobizhZahodi: TMenuItem
          Action = aAdminZahodi
        end
        object mnAdminChoices: TMenuItem
          Caption = '-'
        end
        object mnZahodiAdmin_Zapobizh_ZahodiNeVrucheni: TMenuItem
          Action = frmAdminZapobizhZahodi.aNeVrucheni
        end
        object mnZahodiAdmin_Zapobizh_ZahodiNeZnytiZKontrolu: TMenuItem
          Action = frmAdminZapobizhZahodi.aNeZnytiZKontrolu
        end
        object mnZahodiAdmin_Zapobizh_ZahodiOskarzheni: TMenuItem
          Action = frmAdminZapobizhZahodi.aOskarzheni
        end
        object mnZahodiAdmin_Zapobizh_ZahodiNePovidomleni: TMenuItem
          Action = frmAdminZapobizhZahodi.aNePovidomleni
        end
        object mnZahodiAdmin_Zapobizh_ZahodiPovidomleni: TMenuItem
          Action = frmAdminZapobizhZahodi.aPovidomleni
        end
        object mnZahodiAdmin_Zapobizh_ZahodiOpechatani: TMenuItem
          Action = frmAdminZapobizhZahodi.aOpechatani
        end
        object mnZahodiAdmin_Zapobizh_ZahodiNeVidnovleni: TMenuItem
          Action = frmAdminZapobizhZahodi.aNeVidnovleni
        end
        object mnZahodiAdmin_Zapobizh_ZahodiObmezhennyAsortimentu: TMenuItem
          Action = frmAdminZapobizhZahodi.aObmezhennyAsortimentu
        end
        object mnZahodiAdmin_Zapobizh_ZahodiNazvaObjektu: TMenuItem
          Action = frmAdminZapobizhZahodi.aNazvaObjektu
        end
        object mnZahodiAdmin_Zapobizh_ZahodiAdresaObjektu: TMenuItem
          Action = frmAdminZapobizhZahodi.aAdresaObjektu
        end
        object mnZahodiAdmin_Zapobizh_ZahodiPIBPredstavnikaSES: TMenuItem
          Action = frmAdminZapobizhZahodi.aPIBPredstavnikaSES
        end
        object mnZahodiAdmin_Zapobizh_ZahodiTipPostanovi: TMenuItem
          Action = frmAdminZapobizhZahodi.aTipPostanovi
        end
        object mnZahodiAdmin_Zapobizh_ZahodiRozdilT23F18: TMenuItem
          Action = frmAdminZapobizhZahodi.aRozdilT23F18
        end
      end
      object mnZahodiViluchenny_Z_Realizacii: TMenuItem
        Caption = #1042#1080#1083#1091#1095#1077#1085#1085#1103' '#1079' '#1088#1077#1072#1083#1110#1079#1072#1094#1110#1111
        object mnZahodiViluchenny_Z_RealizaciiViluchennyZRealizacii: TMenuItem
          Action = aViluchennyZRealizacii
        end
        object mnVibir_Viluchenny_Choices: TMenuItem
          Caption = '-'
        end
        object mnZahodiViluchenny_Z_RealizaciiNeVrucheni: TMenuItem
          Action = frmViluchennyZRealizacii.aViluchennyNeVrucheni
        end
        object mnZahodiViluchenny_Z_RealizaciiOskarzheni: TMenuItem
          Action = frmViluchennyZRealizacii.aViluchennyOskarzheni
        end
        object mnZahodiViluchenny_Z_RealizaciiNazvaObjektu: TMenuItem
          Action = frmViluchennyZRealizacii.aViluchennyNazvaObjektu
        end
        object mnZahodiViluchenny_Z_RealizaciiAdresaObjektu: TMenuItem
          Action = frmViluchennyZRealizacii.aViluchennyAdresaObjektu
        end
        object mnZahodiViluchenny_Z_RealizaciiTipPostanovi: TMenuItem
          Action = frmViluchennyZRealizacii.aViluchennyTipPostanovi
        end
        object mnZahodiViluchenny_Z_RealizaciiPIBOsobiSES: TMenuItem
          Action = frmViluchennyZRealizacii.aViluchennyPIB_SES
        end
        object mnZahodiViluchenny_Z_RealizaciiPosadaOsobiSES: TMenuItem
          Action = frmViluchennyZRealizacii.aViluchennyPosadaSES
        end
        object mnZahodiViluchenny_Z_RealizaciiTipProdukcii: TMenuItem
          Action = frmViluchennyZRealizacii.aViluchennyTipProdukcii
        end
        object mnZahodiViluchenny_Z_RealizaciilRozdilT23F18: TMenuItem
          Action = frmViluchennyZRealizacii.aViluchennyT23F18
        end
      end
      object mnZahodiFinansovi_Sankcii: TMenuItem
        Caption = #1060#1110#1085#1072#1085#1089#1086#1074#1110' '#1089#1072#1085#1082#1094#1110#1111
        object mnZahodiFinansovi_SankciiFinansoviSankcii: TMenuItem
          Action = aFinansoviSankcii
        end
        object N13: TMenuItem
          Caption = '-'
        end
        object mnZahodiFinansovi_SankciiNeVrucheni: TMenuItem
          Action = frmFinansoviSankcii.aNeVrucheni
        end
        object mnZahodiFinansovi_SankciiNeSplacheni: TMenuItem
          Action = frmFinansoviSankcii.aNeSplacheni
        end
        object mnZahodiFinansovi_SankciiOskarzheni: TMenuItem
          Action = frmFinansoviSankcii.aOskarzheni
        end
        object mnZahodiFinansovi_SankciiObjekt: TMenuItem
          Caption = #1054#1073#39#1108#1082#1090
          object mnZahodiFinansovi_SankciiObjektNazvaObjektu: TMenuItem
            Action = frmFinansoviSankcii.aNazvaObjektu
          end
          object mnZahodiFinansovi_SankciiObjektAdresaObjektu: TMenuItem
            Action = frmFinansoviSankcii.aAdresaObjektu
          end
        end
        object mnZahodiFinansovi_SankciiSES: TMenuItem
          Caption = #1057#1045#1057
          object mnZahodiFinansovi_SankciiSESPIBPredstavnika: TMenuItem
            Action = frmFinansoviSankcii.aPIB_SES
          end
          object mnZahodiFinansovi_SankciiSESPosadaPredstavnika: TMenuItem
            Action = frmFinansoviSankcii.aPosada_SES
          end
        end
        object mnZahodiFinansovi_SankciiTipProdukcii: TMenuItem
          Action = frmFinansoviSankcii.aTipProdukcii
        end
        object mnZahodiFinansovi_SankciiRozdilT23F18: TMenuItem
          Action = frmFinansoviSankcii.aRozdilT23F18
        end
      end
      object mnRishennyRVK: TMenuItem
        Caption = #1056#1110#1096#1077#1085#1085#1103' '#1056#1042#1050
        Enabled = False
        Hint = #1055#1077#1088#1077#1083#1110#1082' '#1088#1110#1096#1077#1085#1100' '#1056#1042#1050
        RadioItem = True
        Visible = False
      end
      object mnVidstoronennyVidRoboti: TMenuItem
        Caption = #1042#1110#1076#1089#1090#1086#1088#1086#1085#1077#1085#1085#1103' '#1074#1110#1076' '#1088#1086#1073#1086#1090#1080
        Enabled = False
        Hint = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1074#1110#1076#1089#1090#1086#1088#1086#1085#1077#1085#1085#1103' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074' '#1074#1110#1076' '#1088#1086#1073#1086#1090#1080
        Visible = False
      end
      object mnPeredachaDoProkuraturi: TMenuItem
        Caption = #1055#1077#1088#1077#1076#1072#1095#1072' '#1076#1086' '#1087#1088#1086#1082#1091#1088#1072#1090#1091#1088#1080
        Enabled = False
        Hint = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1087#1077#1088#1077#1076#1072#1095#1110' '#1089#1087#1088#1072#1074' '#1076#1086' '#1087#1088#1086#1082#1091#1088#1072#1090#1091#1088#1080
        Visible = False
      end
      object mnPropozicii: TMenuItem
        Caption = #1055#1088#1086#1087#1086#1079#1080#1094#1110#1111
        Enabled = False
        Hint = 
          #1055#1077#1088#1077#1083#1110#1082' '#1088#1086#1079#1087#1086#1088#1103#1076#1078#1077#1085#1100' '#1097#1086#1076#1086' '#1087#1086#1082#1088#1072#1097#1077#1085#1085#1103' '#1077#1087#1110#1076#1077#1084#1110#1086#1083#1086#1075#1110#1095#1085#1086#1111' '#1089#1080#1090#1091#1072#1094#1110#1111' '#1085 +
          #1072' '#1086#1073#39#1108#1082#1090#1110
        Visible = False
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object mnVihod: TMenuItem
        Action = aVihod
      end
    end
    object mnDovidniki: TMenuItem
      Caption = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Hint = #1044#1086#1074#1110#1076#1085#1080#1082#1080' '#1076#1083#1103' '#1088#1086#1073#1086#1090#1080' '#1087#1088#1086#1075#1088#1072#1084#1080
      object mnDovidnikiTeritory: TMenuItem
        Caption = #1058#1077#1088#1080#1090#1086#1088#1110#1103
        Hint = #1044#1086#1074#1110#1076#1085#1080#1082#1080' '#1076#1083#1103' '#1074#1080#1079#1085#1072#1095#1077#1085#1085#1103' '#1090#1077#1088#1080#1090#1086#1088#1110#1111' '#1086#1073#1089#1083#1091#1075#1086#1074#1091#1074#1072#1085#1085#1103' '#1057#1045#1057
        object mnDovidnikiTeritoryMinistry: TMenuItem
          Action = aMinistry
        end
        object mnDovidnikiTeritoryTeritory: TMenuItem
          Action = aTeritory
        end
        object mnDovidnikiTeritoryRajoni: TMenuItem
          Action = aDistrict
        end
      end
      object mnDovidnikiPidkontrolniObjekti: TMenuItem
        Caption = #1055#1110#1076#1082#1086#1085#1090#1088#1086#1083#1100#1085#1110' '#1086#1073#39#1108#1082#1090#1080
        object mnDovidnikiPidkontrolniObjektiVidomchaPidporydkovanist: TMenuItem
          Action = aVidomchaPidporydkovanist
        end
        object mnDovidnikiPidkontrolniObjektiObjekti: TMenuItem
          Action = aObjekti
        end
      end
      object mnDovidnikiOrganizaciy: TMenuItem
        Caption = #1054#1088#1075#1072#1085#1110#1079#1072#1094#1110#1103
        Hint = #1044#1086#1074#1110#1076#1085#1080#1082#1080' '#1076#1083#1103' '#1085#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103' '#1088#1086#1073#1086#1090#1080' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111
        object mnDovidnikiOrganizaciyViddilenny: TMenuItem
          Action = aViddilenny
        end
        object mnDovidnikiOrganizaciyPosadi: TMenuItem
          Action = aPosadi
        end
        object mnDovidnikiOrganizaciySpivrobitniki: TMenuItem
          Action = aSpivrobitniki
        end
      end
      object mnDovidnikiNormativnaBaza: TMenuItem
        Caption = #1053#1086#1088#1084#1072#1090#1080#1074#1085#1072' '#1073#1072#1079#1072
        Hint = 
          #1044#1086#1074#1110#1076#1085#1080#1082' '#1085#1086#1088#1084#1072#1090#1080#1074#1085#1086#1111' '#1073#1072#1079#1080', '#1097#1086' '#1088#1077#1075#1091#1083#1102#1108' '#1088#1086#1073#1086#1090#1091' '#1089#1072#1085#1110#1090#1072#1088#1085#1086'-'#1077#1087#1110#1076#1077#1084#1110#1086#1083 +
          #1086#1075#1110#1095#1085#1086#1111' '#1089#1083#1091#1078#1073#1080
        object mnDovidnikiNormativnaBazaStatti: TMenuItem
          Action = aStatti
        end
        object mnDovidnikiNormativnaBazaNormativniAkti: TMenuItem
          Action = aNormativniAkti
        end
      end
      object mnDovidnikiDatas: TMenuItem
        Caption = #1044#1072#1085#1085#1110
        object mnDovidnikiDatasDataTables: TMenuItem
          Action = aDataTables
        end
        object mnDovidnikiDatasDataTypes: TMenuItem
          Action = aDataTypes
        end
      end
      object mnDovidnikiSumiShtrafu: TMenuItem
        Action = aSumiShtrafu
      end
      object mnDovidnikiViznatiVinnim: TMenuItem
        Action = aViznatiVinnim
      end
      object mnDovidnikiRozdil_T23_F18: TMenuItem
        Action = aRozdil_t23_f18
      end
      object mnDovidnikiTipShtrafu: TMenuItem
        Action = aTipShtrafu
      end
      object mnDovidnikiLaboratorniDoslidzhenny: TMenuItem
        Action = aLaboratorniDoslidzhenny
      end
      object mnDovidnikiKudiOskarzheno: TMenuItem
        Action = aKudiOskarzheno
      end
      object mnDovidnikiRezultatOskargenny: TMenuItem
        Action = aOskarzhenny
      end
      object mnDovidnikiNapravlenny: TMenuItem
        Action = aNapravlenny
      end
      object mnDovidnikiVidPostanovi: TMenuItem
        Action = aVidPostanovi
      end
      object mnDovidnikiSutPostanovi: TMenuItem
        Action = aVidObmezhen
      end
      object mnDovidnikiUmoviVidnovlenny: TMenuItem
        Action = aUmoviVidnovlenny
      end
      object mnDovidnikiOrganizacii: TMenuItem
        Action = aOrganizacii
      end
      object mnDovidnikiTipiProdukcii: TMenuItem
        Action = aTipProdukcii
      end
      object mnDovidnikiVirobniki: TMenuItem
        Action = aVirobniki
      end
      object mnDovidnikiOdiniciVimiru: TMenuItem
        Caption = #1054#1076#1080#1085#1080#1094#1110' '#1074#1080#1084#1110#1088#1091
        Hint = #1055#1077#1088#1077#1083#1110#1082' '#1086#1076#1080#1085#1080#1094#1100' '#1074#1080#1084#1110#1088#1091', '#1111#1093' '#1084#1085#1086#1078#1085#1080#1082#1080' '#1090#1072' '#1085#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103
        OnClick = mnDovidnikiOdiniciVimiruClick
      end
      object mnDovidnikiRivniSES: TMenuItem
        Action = aRivniSES
      end
      object mnDovidnikiRozdiliInicializacii: TMenuItem
        Action = aRozdiliInicializacii
        Visible = False
      end
    end
    object mnZvit: TMenuItem
      Caption = #1047#1074#1110#1090
      Hint = #1047#1074#1110#1090#1080', '#1097#1086' '#1092#1086#1088#1084#1091#1102#1090#1100#1089#1103' '#1087#1088#1086#1075#1088#1072#1084#1086#1102
      object mnZvitSchomisychnij: TMenuItem
        Action = aZvitSchomisychnij
      end
      object mnZvitT23F18: TMenuItem
        Action = aZvitT23F18
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnZvitZvyzki: TMenuItem
        Caption = #1047#1074#1103#1079#1082#1080
        object mnZvitZvyzkiZSchomisychnim: TMenuItem
          Action = aNalashtuvanny_ZvyazokZSchomicyachnim
        end
        object mnZvitZvyzkiZSchokvartalnim: TMenuItem
          Action = aZvitSchokvartalnij
        end
        object mnZvitZvyzkiZRezultatamiOskarzhenny: TMenuItem
          Action = aNalashtuvanny_ZvyazokZRezultatamiOskarzhenny
        end
      end
      object mnZvitReports: TMenuItem
        Action = aReports
        Visible = False
      end
    end
    object mnNalashtuvanny: TMenuItem
      Caption = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103
      Hint = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103' '#1087#1088#1086#1075#1088#1072#1084#1080
      object mnNalashtuvannyOrganizaciy: TMenuItem
        Action = aOrganizaciya
      end
      object mnNalashtuvannyNalashtuvannySistemi: TMenuItem
        Action = aNalashtuvannySistemy
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object mnNalashtuvannyVidPostanovi: TMenuItem
        Action = aNalashtuvannyViduPostanovi
      end
    end
    object mnAdministruvanny: TMenuItem
      Caption = #1040#1076#1084#1110#1085#1110#1089#1090#1088#1091#1074#1072#1085#1085#1103
      object mnAdministruvannyArchiving: TMenuItem
        Action = aArchiving
        Visible = False
      end
      object mnAdministruvannyRestore: TMenuItem
        Action = aRestore
        Visible = False
      end
      object mnAdministruvannyCleaning: TMenuItem
        Action = aCleaning
        Visible = False
      end
      object N3: TMenuItem
        Caption = '-'
        Visible = False
      end
      object mnNalashtuvannyKoristuvachi: TMenuItem
        Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110
        Hint = #1056#1086#1073#1086#1090#1072' '#1079' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072#1084#1080' '#1110' '#1087#1088#1072#1074#1072#1084#1080' '#1076#1086#1089#1090#1091#1087#1091' '#1076#1086' '#1074#1110#1076#1086#1084#1086#1089#1090#1077#1081
        object mnNalashtuvannyKoristuvachiGlobalUsers: TMenuItem
          Action = aNalashtuvannyGlobalUsers
          Visible = False
        end
        object N4: TMenuItem
          Caption = '-'
          Visible = False
        end
        object mnNalashtuvannyKoristuvachiFunkciiDostupu: TMenuItem
          Caption = #1060#1091#1085#1082#1094#1110#1111' '#1076#1086#1089#1090#1091#1087#1091
          Hint = #1055#1077#1088#1077#1083#1110#1082' '#1087#1088#1072#1074' '#1076#1086#1089#1090#1091#1087#1091' '#1076#1086' '#1077#1083#1077#1084#1077#1085#1090#1110#1074' '#1082#1077#1088#1091#1074#1072#1085#1085#1103
          Visible = False
          object mnNalashtuvannyKoristuvachiFunkciiDostupuVikna: TMenuItem
            Action = aNalashtuvanny_Vikna
            Visible = False
          end
          object mnNalashtuvannyKoristuvachiFunkciiDostupuElementiVikon: TMenuItem
            Action = aNalashtuvanny_ElementiVikon
            Visible = False
          end
          object N17: TMenuItem
            Caption = '-'
            Enabled = False
            Visible = False
          end
          object mnFunkciiDostupu: TMenuItem
            Action = aNalashtuvanny_FunkciiDostupu
            Enabled = False
            Visible = False
          end
        end
        object N1: TMenuItem
          Caption = '-'
          Visible = False
        end
        object mnNalashtuvannyKoristuvachiGrupi: TMenuItem
          Action = aNalashtuvannyGroups
          Visible = False
        end
        object mnNalashtuvannyKoristuvachiKoristuvachi: TMenuItem
          Action = aNalashtuvannyKoristuvachi
          Hint = #1055#1077#1088#1077#1083#1110#1082' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110#1074' '#1089#1080#1089#1090#1077#1084#1080' '#1082#1077#1088#1091#1074#1072#1085#1085#1103' '#1087#1088#1072#1074#1072#1084#1080' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110#1074
        end
        object mnNalashtuvannyKoristuvachiPravaKoristuvachiv: TMenuItem
          Action = aNalashtuvanny_PravaKoristuvachiv
          Visible = False
        end
        object N9: TMenuItem
          Caption = '-'
          Visible = False
        end
        object mnAdministruvannyUsers: TMenuItem
          Action = aUsers
          Caption = #1055#1110#1076#1082#1083#1102#1095#1077#1085#1110' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110
          Visible = False
        end
      end
      object N6: TMenuItem
        Caption = '-'
        Visible = False
      end
      object mnAdministruvannyImport: TMenuItem
        Action = aImport
        Visible = False
      end
      object mnAdministruvannyExport: TMenuItem
        Action = aExport
        Visible = False
      end
      object N8: TMenuItem
        Caption = '-'
        Visible = False
      end
      object mnAdministruvannyProtokol: TMenuItem
        Action = aProtokol
        Visible = False
      end
    end
    object mnVikna: TMenuItem
      Caption = #1042#1110#1082#1085#1072
      Hint = #1056#1086#1073#1086#1090#1072' '#1079' '#1074#1110#1076#1082#1088#1080#1090#1080#1084#1080' '#1074#1110#1082#1085#1072#1084#1080
      object mnViknaTileHorizontal: TMenuItem
        Action = aWindowTileHorizontal
      end
      object mnViknaTileVertical: TMenuItem
        Action = aWindowTileVertical
      end
      object mnViknaCascade: TMenuItem
        Action = aWindowCascade
      end
      object mnViknaArrange: TMenuItem
        Action = aWindowArrange
      end
      object mnViknaMinimizeAll: TMenuItem
        Action = aWindowMinimizeAll
      end
      object mnViknaClose: TMenuItem
        Action = aWindowClose
      end
    end
    object mnHelp: TMenuItem
      Caption = #1044#1086#1087#1086#1084#1086#1075#1072
      Hint = #1044#1086#1087#1086#1084#1086#1075#1072' '#1076#1083#1103' '#1088#1086#1073#1086#1090#1080' '#1079' '#1087#1088#1086#1075#1088#1072#1084#1086#1102
      object mnHelpAbout: TMenuItem
        Action = aProProgramu
      end
    end
  end
  object ssUsers: TIBSecurityService
    ServerName = 'localhost'
    Protocol = TCP
    LoginPrompt = False
    TraceFlags = []
    SecurityAction = ActionAddUser
    UserID = 0
    GroupID = 0
    Left = 124
    Top = 52
  end
  object alMain: TActionList
    Images = ilMain
    Left = 36
    Top = 52
    object aProProgramu: TAction
      Category = #1044#1086#1087#1086#1084#1086#1075#1072
      Caption = #1055#1088#1086' '#1087#1088#1086#1075#1088#1072#1084#1091
      Hint = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1087#1088#1086#1075#1088#1072#1084#1091
      OnExecute = aProProgramuExecute
    end
    object aWindowClose: TWindowClose
      Category = #1042#1110#1082#1085#1072
      Caption = #1047#1072#1082#1088#1080#1090#1080
      Enabled = False
      Hint = #1047#1072#1082#1088#1080#1090#1080' '#1074#1110#1082#1085#1086
    end
    object aWindowCascade: TWindowCascade
      Category = #1042#1110#1082#1085#1072
      Caption = #1050#1072#1089#1082#1072#1076#1086#1084
      Enabled = False
      Hint = #1042#1080#1089#1090#1088#1086#1111#1090#1080' '#1082#1072#1089#1082#1072#1076#1086#1084
      ImageIndex = 17
    end
    object aWindowTileHorizontal: TWindowTileHorizontal
      Category = #1042#1110#1082#1085#1072
      Caption = #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086
      Enabled = False
      Hint = #1042#1080#1089#1090#1088#1086#1111#1090#1080'  '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086
      ImageIndex = 15
    end
    object aWindowTileVertical: TWindowTileVertical
      Category = #1042#1110#1082#1085#1072
      Caption = #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086
      Enabled = False
      Hint = #1042#1080#1089#1090#1088#1086#1111#1090#1080' '#1074#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086
      ImageIndex = 16
    end
    object aWindowMinimizeAll: TWindowMinimizeAll
      Category = #1042#1110#1082#1085#1072
      Caption = #1047#1075#1086#1088#1085#1091#1090#1080' '#1074#1089#1110
      Enabled = False
      Hint = #1047#1075#1086#1088#1085#1091#1090#1080' '#1074#1089#1110' '#1074#1110#1082#1085#1072
    end
    object aWindowArrange: TWindowArrange
      Category = #1042#1110#1082#1085#1072
      Caption = #1042#1080#1089#1090#1088#1086#1111#1090#1080
      Enabled = False
      Hint = #1042#1080#1089#1090#1088#1086#1111#1090#1080' '#1074#1110#1082#1085#1072
    end
    object aShtrafi: TAction
      Category = #1047#1072#1093#1086#1076#1080
      Caption = #1064#1090#1088#1072#1092#1080
      Hint = #1047#1072#1087#1086#1074#1085#1077#1085#1085#1103' '#1078#1091#1088#1085#1072#1083#1091' '#1087#1086#1089#1090#1072#1085#1086#1074' '#1085#1072' '#1096#1090#1088#1072#1092#1080
      ImageIndex = 0
      OnExecute = aShtrafiExecute
    end
    object aNalashtuvannySistemy: TAction
      Category = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103
      Caption = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103' '#1089#1080#1089#1090#1077#1084#1080
      Hint = #1057#1080#1089#1090#1077#1084#1085#1110' '#1085#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103' '#1087#1088#1086#1075#1088#1072#1084#1080
      OnExecute = aNalashtuvannySistemyExecute
    end
    object aAdminZahodi: TAction
      Category = #1047#1072#1093#1086#1076#1080
      Caption = #1040#1076#1084#1110#1085#1110#1089#1090#1088#1072#1090#1080#1074#1085#1086'-'#1079#1072#1087#1086#1073#1110#1078#1085#1110' '#1079#1072#1093#1086#1076#1080
      Hint = #1055#1077#1088#1077#1083#1110#1082' '#1072#1076#1084#1110#1085#1110#1089#1090#1088#1072#1090#1080#1074#1085#1086'-'#1079#1072#1087#1086#1073#1110#1078#1085#1080#1093' '#1079#1072#1093#1086#1076#1110#1074
      OnExecute = aAdminZahodiExecute
    end
    object aViluchennyZRealizacii: TAction
      Category = #1047#1072#1093#1086#1076#1080
      Caption = #1042#1080#1083#1091#1095#1077#1085#1085#1103' '#1079' '#1088#1077#1072#1083#1110#1079#1072#1094#1110#1111
      Hint = #1055#1077#1088#1077#1083#1110#1082' '#1087#1086#1089#1090#1072#1085#1086#1074' '#1087#1088#1086' '#1074#1080#1083#1091#1095#1077#1085#1085#1103' '#1079' '#1088#1077#1072#1083#1110#1079#1072#1094#1110#1093
      OnExecute = aViluchennyZRealizaciiExecute
    end
    object aFinansoviSankcii: TAction
      Category = #1047#1072#1093#1086#1076#1080
      Caption = #1060#1110#1085#1072#1085#1089#1086#1074#1110' '#1089#1072#1085#1082#1094#1110#1111
      Hint = #1055#1077#1088#1077#1083#1110#1082' '#1087#1086#1089#1090#1072#1085#1086#1074' '#1087#1088#1086' '#1079#1072#1089#1090#1086#1089#1091#1074#1072#1085#1085#1103' '#1092#1110#1085#1072#1085#1089#1086#1074#1086#1111' '#1089#1072#1085#1082#1094#1110#1111
      OnExecute = aFinansoviSankciiExecute
    end
    object aVihod: TAction
      Category = #1047#1072#1093#1086#1076#1080
      Caption = #1042#1080#1093#1110#1076
      Hint = #1047#1072#1074#1077#1088#1096#1077#1085#1085#1103' '#1088#1086#1073#1086#1090#1080' '#1079' '#1087#1088#1086#1075#1088#1072#1084#1086#1102
      ShortCut = 16472
      OnExecute = aVihodExecute
    end
    object aOrganizaciya: TAction
      Category = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103
      Caption = #1054#1088#1075#1072#1085#1110#1079#1072#1094#1110#1103
      Hint = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1102
      OnExecute = aOrganizaciyaExecute
    end
    object aMinistry: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1052#1110#1085#1110#1089#1090#1077#1088#1089#1090#1074#1072
      Hint = #1044#1086#1074#1110#1076#1085#1080#1082' '#1084#1110#1085#1110#1089#1090#1077#1088#1089#1090#1074
      OnExecute = aMinistryExecute
    end
    object aTeritory: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1058#1077#1088#1080#1090#1086#1088#1110#1103
      Hint = #1044#1086#1074#1110#1076#1085#1080#1082' '#1090#1077#1088#1080#1090#1086#1088#1110#1081
      OnExecute = aTeritoryExecute
    end
    object aDistrict: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1056#1072#1081#1086#1085#1080
      Hint = #1044#1086#1074#1110#1076#1085#1080#1082' '#1088#1072#1081#1086#1085#1110#1074
      OnExecute = aDistrictExecute
    end
    object aVidomchaPidporydkovanist: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1042#1110#1076#1086#1084#1095#1072' '#1087#1110#1076#1087#1086#1088#1103#1076#1082#1086#1074#1072#1085#1110#1089#1090#1100
      Hint = #1044#1086#1074#1110#1076#1085#1080#1082' '#1074#1110#1076#1086#1084#1089#1090#1074
      OnExecute = aVidomchaPidporydkovanistExecute
    end
    object aObjekti: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1054#1073#39#1108#1082#1090#1080
      Hint = #1044#1086#1074#1110#1076#1085#1080#1082' '#1086#1073#39#1108#1082#1090#1110#1074
      OnExecute = aObjektiExecute
    end
    object aViddilenny: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1042#1110#1076#1076#1110#1083#1077#1085#1085#1103
      Hint = #1044#1086#1074#1110#1076#1085#1080#1082' '#1074#1110#1076#1076#1110#1083#1077#1085#1100
      OnExecute = aViddilennyExecute
    end
    object aPosadi: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1055#1086#1089#1072#1076#1080
      Hint = #1044#1086#1074#1110#1076#1085#1080#1082' '#1087#1086#1089#1072#1076
      OnExecute = aPosadiExecute
    end
    object aSpivrobitniki: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1057#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1080
      Hint = #1044#1086#1074#1110#1076#1085#1080#1082' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074
      OnExecute = aSpivrobitnikiExecute
    end
    object aViznatiVinnim: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1042#1080#1079#1085#1072#1090#1080' '#1074#1080#1085#1085#1080#1084
      Hint = #1044#1086#1074#1110#1076#1085#1080#1082' '#1086#1073#1074#1080#1085#1091#1074#1072#1095#1077#1085#1100
      OnExecute = aViznatiVinnimExecute
    end
    object aStatti: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1057#1090#1072#1090#1090#1110
      Hint = 
        #1044#1086#1074#1110#1076#1085#1080#1082' '#1089#1090#1072#1090#1090#1077#1081' '#1079#1072#1082#1086#1085#1086#1076#1072#1074#1089#1090#1074#1072' '#1059#1082#1088#1072#1111#1085#1080' '#1103#1082#1110' '#1088#1077#1075#1083#1072#1084#1077#1085#1090#1091#1102#1090#1100' '#1085#1072#1082#1083#1072#1076#1077 +
        #1085#1085#1103' '#1096#1090#1088#1072#1092#1091
      OnExecute = aStattiExecute
    end
    object aNormativniAkti: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1053#1086#1088#1084#1072#1090#1080#1074#1085#1110' '#1072#1082#1090#1080
      Hint = #1057#1083#1086#1074#1085#1080#1082' '#1085#1086#1088#1084#1072#1090#1080#1074#1085#1080#1093' '#1072#1082#1090#1110#1074
      OnExecute = aNormativniAktiExecute
    end
    object aRozdil_t23_f18: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1056#1086#1079#1076#1110#1083' '#1090'.23 '#1092'.18'
      Hint = #1044#1086#1074#1110#1076#1085#1080#1082' '#1088#1086#1079#1076#1110#1083#1110#1074' '#1074' '#1090'.23 '#1092#1086#1088#1084#1080' '#8470'18'
      OnExecute = aRozdil_t23_f18Execute
    end
    object aTipShtrafu: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1058#1080#1087' '#1096#1090#1088#1072#1092#1091
      Hint = #1055#1077#1088#1077#1083#1110#1082' '#1090#1080#1087#1110#1074' '#1096#1090#1088#1072#1092#1110#1074' '#1079#1072' '#1074#1080#1076#1086#1084' '#1086#1073#1089#1090#1077#1078#1077#1085#1100
      OnExecute = aTipShtrafuExecute
    end
    object aSumiShtrafu: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1057#1091#1084#1080' '#1096#1090#1088#1072#1092#1091
      Hint = #1055#1077#1088#1077#1083#1110#1082' '#1089#1091#1084' '#1096#1090#1088#1072#1092#1110#1074', '#1103#1082#1110' '#1084#1086#1078#1085#1072' '#1089#1090#1103#1075#1085#1091#1090#1080' '#1079#1072' '#1087#1086#1088#1091#1096#1077#1085#1085#1103
      OnExecute = aSumiShtrafuExecute
    end
    object aLaboratorniDoslidzhenny: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1110' '#1076#1086#1089#1083#1110#1076#1078#1077#1085#1085#1103
      Hint = #1044#1086#1074#1110#1076#1085#1080#1082' '#1090#1080#1087#1110#1074' '#1083#1072#1073#1086#1088#1072#1090#1086#1088#1085#1080#1093' '#1076#1086#1089#1083#1110#1076#1078#1077#1085#1100
      OnExecute = aLaboratorniDoslidzhennyExecute
    end
    object aKudiOskarzheno: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1050#1091#1076#1080' '#1086#1089#1082#1072#1088#1078#1077#1085#1086
      Hint = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111', '#1076#1086' '#1103#1082#1080#1093' '#1084#1086#1078#1085#1072' '#1086#1089#1082#1072#1088#1078#1080#1090#1080' '#1087#1086#1089#1090#1072#1085#1086#1074#1091
      OnExecute = aKudiOskarzhenoExecute
    end
    object aOskarzhenny: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1086#1089#1082#1072#1088#1078#1077#1085#1085#1103
      Hint = #1055#1077#1088#1077#1083#1110#1082' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1081' '#1076#1086' '#1103#1082#1080#1093' '#1084#1086#1078#1077' '#1073#1091#1090#1080' '#1086#1089#1082#1072#1088#1078#1077#1085#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1072
      OnExecute = aOskarzhennyExecute
    end
    object aNapravlenny: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1085#1103
      Hint = #1055#1077#1088#1077#1083#1110#1082', '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1081', '#1103#1082#1080#1084' '#1087#1110#1076#1082#1086#1085#1090#1088#1086#1083#1100#1085#1072' '#1057#1045#1057
      OnExecute = aNapravlennyExecute
    end
    object aVidPostanovi: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1042#1080#1076' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
      Hint = 
        #1042#1080#1076' '#1087#1086#1089#1090#1072#1085#1086#1074#1080' '#1087#1088#1086' '#1079#1072#1089#1090#1086#1089#1091#1074#1072#1085#1085#1103' '#1072#1076#1084#1110#1085#1110#1089#1090#1088#1072#1090#1080#1074#1085#1086'-'#1079#1072#1087#1086#1073#1110#1078#1085#1080#1093' '#1079#1072#1093#1086#1076#1110 +
        #1074
      OnExecute = aVidPostanoviExecute
    end
    object aNalashtuvannyViduPostanovi: TAction
      Category = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103
      Caption = #1042#1080#1076' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
      Hint = 
        #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103' '#1074#1110#1076#1086#1084#1086#1089#1090#1077#1081', '#1097#1086' '#1074#1074#1086#1076#1103#1090#1100#1089#1103' '#1074' '#1079#1072#1083#1077#1078#1085#1086#1089#1090#1110' '#1074#1110#1076' '#1074#1080#1076#1091' '#1087#1086#1089#1090 +
        #1072#1085#1086#1074#1080
      OnExecute = aNalashtuvannyViduPostanoviExecute
    end
    object aVidObmezhen: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1057#1091#1090#1100' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
      Hint = #1042#1080#1076' '#1086#1073#1084#1077#1078#1077#1085#1100
      OnExecute = aVidObmezhenExecute
    end
    object aUmoviVidnovlenny: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1059#1084#1086#1074#1080' '#1074#1110#1076#1085#1086#1074#1083#1077#1085#1085#1103
      Hint = #1055#1077#1088#1077#1083#1110#1082' '#1091#1084#1086#1074' '#1074#1110#1076#1085#1086#1074#1083#1077#1085#1085#1103' '#1088#1086#1073#1086#1090#1080
      OnExecute = aUmoviVidnovlennyExecute
    end
    object aOrganizacii: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1054#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111
      Hint = #1044#1086#1074#1110#1076#1085#1080#1082' '#1087#1110#1076#1082#1086#1085#1090#1088#1086#1083#1100#1085#1080#1093' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1081
      OnExecute = aOrganizaciiExecute
    end
    object aTipProdukcii: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1058#1080#1087#1080' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
      Hint = #1044#1086#1074#1110#1076#1085#1080#1082' '#1090#1080#1087#1110#1074' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
      OnExecute = aTipProdukciiExecute
    end
    object aVirobniki: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1042#1080#1088#1086#1073#1085#1080#1082#1080
      Hint = #1044#1086#1074#1110#1076#1085#1080#1082' '#1074#1080#1088#1086#1073#1085#1080#1082#1110#1074
      OnExecute = aVirobnikiExecute
    end
    object aNalashtuvannyGlobalUsers: TAction
      Category = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103
      Caption = #1043#1083#1086#1073#1072#1083#1100#1085#1110' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110
      Hint = #1055#1077#1088#1077#1083#1110#1082' '#1075#1083#1086#1073#1072#1083#1100#1085#1080#1093' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110#1074' ('#1076#1083#1103' '#1087#1110#1076#1082#1083#1102#1095#1077#1085#1085#1103' '#1076#1086' '#1073#1072#1079#1080' '#1076#1072#1085#1080#1093')'
      OnExecute = aNalashtuvannyGlobalUsersExecute
    end
    object aNalashtuvannyKoristuvachi: TAction
      Category = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103
      Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110
      Hint = #1055#1077#1088#1077#1083#1110#1082' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110#1074' '#1089#1080#1089#1090#1077#1084#1080' '#1082#1077#1088#1091#1074#1072#1085#1085#1103' '#1087#1088#1072#1074#1072#1084#1080' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110#1074')'
      OnExecute = aNalashtuvannyKoristuvachiExecute
    end
    object aNalashtuvannyGroups: TAction
      Category = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103
      Caption = #1043#1088#1091#1087#1080
      Hint = #1055#1077#1088#1077#1083#1110#1082' '#1075#1088#1091#1087' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110#1074
      OnExecute = aNalashtuvannyGroupsExecute
    end
    object aZvitSchomisychnij: TAction
      Category = #1047#1074#1110#1090#1080
      Caption = #1065#1086#1084#1110#1089#1103#1095#1085#1080#1081
      OnExecute = aZvitSchomisychnijExecute
    end
    object aZvitT23F18: TAction
      Category = #1047#1074#1110#1090#1080
      Caption = #1058#1072#1073#1083#1080#1094#1103' 23 '#1092#1086#1088#1084#1080' 18'
      OnExecute = aZvitT23F18Execute
    end
    object aZvitSchokvartalnij: TAction
      Category = #1047#1074#1110#1090#1080
      Caption = #1047#1074#1103#1079#1086#1082' '#1079' '#1097#1086#1082#1074#1072#1088#1090#1072#1083#1100#1085#1080#1084' '#1079#1074#1110#1090#1086#1084
      OnExecute = aZvitSchokvartalnijExecute
    end
    object aNalashtuvanny_Vikna: TAction
      Category = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103
      Caption = #1042#1110#1082#1085#1072
      OnExecute = aNalashtuvanny_ViknaExecute
    end
    object aNalashtuvanny_FunkciiDostupu: TAction
      Category = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103
      Caption = #1060#1091#1085#1082#1094#1110#1111' '#1076#1086#1089#1090#1091#1087#1091
      OnExecute = aNalashtuvanny_FunkciiDostupuExecute
    end
    object aNalashtuvanny_ElementiVikon: TAction
      Category = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103
      Caption = #1045#1083#1077#1084#1077#1085#1090#1080' '#1074#1110#1082#1086#1085
      OnExecute = aNalashtuvanny_ElementiVikonExecute
    end
    object aNalashtuvanny_PravaKoristuvachiv: TAction
      Category = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103
      Caption = #1055#1088#1072#1074#1072' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110#1074
      OnExecute = aNalashtuvanny_PravaKoristuvachivExecute
    end
    object aNalashtuvanny_ZvyazokZSchomicyachnim: TAction
      Category = #1047#1074#1110#1090#1080
      Caption = #1047#1074#1103#1079#1086#1082' '#1079' '#1097#1086#1084#1110#1089#1103#1095#1085#1080#1084' '#1079#1074#1110#1090#1086#1084
      OnExecute = aNalashtuvanny_ZvyazokZSchomicyachnimExecute
    end
    object aNalashtuvanny_ZvyazokZRezultatamiOskarzhenny: TAction
      Category = #1047#1074#1110#1090#1080
      Caption = #1047#1074#1103#1079#1086#1082' '#1079' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1072#1084#1080' '#1086#1089#1082#1072#1088#1078#1077#1085#1085#1103
      OnExecute = aNalashtuvanny_ZvyazokZRezultatamiOskarzhennyExecute
    end
    object aArchiving: TAction
      Category = #1040#1076#1084#1110#1085#1110#1089#1090#1088#1091#1074#1072#1085#1085#1103
      Caption = #1040#1088#1093#1110#1074#1091#1074#1072#1085#1085#1103
      Hint = #1040#1088#1093#1110#1074#1091#1074#1072#1085#1085#1103' '#1076#1072#1085#1080#1093
    end
    object aRestore: TAction
      Category = #1040#1076#1084#1110#1085#1110#1089#1090#1088#1091#1074#1072#1085#1085#1103
      Caption = #1042#1110#1076#1085#1086#1074#1083#1077#1085#1085#1103
      Hint = #1042#1110#1076#1085#1086#1074#1083#1077#1085#1085#1103' '#1076#1072#1085#1080#1093' '#1079' '#1072#1088#1093#1110#1074#1091
    end
    object aUsers: TAction
      Category = #1040#1076#1084#1110#1085#1110#1089#1090#1088#1091#1074#1072#1085#1085#1103
      Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110
      Hint = #1055#1077#1088#1077#1083#1110#1082' '#1087#1110#1076#1082#1083#1102#1095#1077#1085#1080#1093' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110#1074
    end
    object aImport: TAction
      Category = #1040#1076#1084#1110#1085#1110#1089#1090#1088#1091#1074#1072#1085#1085#1103
      Caption = #1030#1084#1087#1086#1088#1090
      Hint = #1030#1084#1087#1086#1088#1090' '#1074#1110#1076#1086#1084#1086#1089#1090#1077#1081
    end
    object aExport: TAction
      Category = #1040#1076#1084#1110#1085#1110#1089#1090#1088#1091#1074#1072#1085#1085#1103
      Caption = #1045#1082#1089#1087#1086#1088#1090
      Hint = #1045#1082#1089#1087#1086#1088#1090' '#1074#1110#1076#1086#1084#1086#1089#1090#1077#1081
    end
    object aProtokol: TAction
      Category = #1040#1076#1084#1110#1085#1110#1089#1090#1088#1091#1074#1072#1085#1085#1103
      Caption = #1055#1088#1086#1090#1086#1082#1086#1083
      Hint = #1055#1088#1086#1090#1086#1082#1086#1083' '#1088#1086#1073#1086#1090#1080' '#1087#1088#1086#1075#1088#1072#1084#1080
    end
    object aRivniSES: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1056#1110#1074#1085#1110' '#1057#1045#1057
      OnExecute = aRivniSESExecute
    end
    object aDataTypes: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1058#1080#1087#1080' '#1076#1072#1085#1080#1093
      Hint = #1044#1086#1074#1110#1076#1085#1080#1082' '#1090#1080#1087#1110#1074' '#1076#1072#1085#1080#1093', '#1097#1086' '#1074#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1102#1090#1100#1089#1103' '#1074' '#1041#1044
      OnExecute = aDataTypesExecute
    end
    object aCleaning: TAction
      Category = #1040#1076#1084#1110#1085#1110#1089#1090#1088#1091#1074#1072#1085#1085#1103
      Caption = #1054#1095#1080#1089#1090#1082#1072
      Hint = #1054#1095#1080#1089#1090#1082#1072' '#1073#1072#1079#1080' '#1076#1072#1085#1080#1093' '#1074#1110#1076' '#1085#1077' '#1079#1074#39#1103#1079#1072#1085#1080#1093' '#1074#1110#1076#1086#1084#1086#1089#1090#1077#1081
    end
    object aDataTables: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1058#1072#1073#1083#1080#1094#1110
      Hint = #1044#1086#1074#1110#1076#1085#1080#1082' '#1090#1072#1073#1083#1080#1094#1100' '#1076#1072#1085#1080#1093
      OnExecute = aDataTablesExecute
    end
    object aReports: TAction
      Category = #1047#1074#1110#1090#1080
      Caption = #1047#1074#1110#1090#1080
      Hint = #1055#1077#1088#1077#1083#1110#1082' '#1079#1074#1110#1090#1110#1074', '#1103#1082#1110' '#1092#1086#1088#1084#1091#1102#1090#1100#1089#1103' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1110
      OnExecute = aReportsExecute
    end
    object aRozdiliInicializacii: TAction
      Category = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1056#1086#1079#1076#1110#1083#1080' '#1110#1085#1110#1094#1110#1072#1083#1110#1079#1072#1094#1110#1111
      Hint = 
        #1044#1086#1074#1110#1076#1085#1080#1082' '#1088#1086#1079#1076#1110#1083#1110#1074' '#1110#1085#1110#1094#1110#1072#1083#1110#1079#1072#1094#1110#1111'. '#1042#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1108#1090#1100#1089#1103' '#1087#1088#1080' '#1085#1072#1083#1072#1096#1090#1091#1074#1072#1085 +
        #1085#1110' '#1079#1074#1110#1090#1110#1074
      OnExecute = aRozdiliInicializaciiExecute
    end
  end
  object dbAzz: TIBDatabase
    LoginPrompt = False
    DefaultTransaction = trAzz
    Left = 68
    Top = 52
  end
  object trAzz: TIBTransaction
    DefaultDatabase = dbAzz
    Left = 96
    Top = 52
  end
  object ilMain: TImageList
    Left = 188
    Top = 52
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 220
    Top = 52
  end
  object sWordApp: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 304
    Top = 48
  end
end
