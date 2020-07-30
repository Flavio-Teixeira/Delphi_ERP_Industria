*
*  PROGRAMA     : NFSN001C.prg
*
*  AUTOR        : Thomas Alexander Fabian
*
*  CRIA€ŽO      : 19/12/95
*
*  ALTERA€™ES   : 21/12/95
*
*  OBJETIVO     : Emitir notas fiscais (Lojista).
*
*  PROCEDIMENTO : Com base no carregamento de tela feito pelo usuario, emitir
*                 a nota fiscal correspondente. Gerando o arquivo de notas
*                 (NFSN010 e CNFSN010).
*

*--- DEFINICAO DOS ARQUIVOS ---*

select 1
use CLIN_010
    INDEX ON CLNOME10 TO CLIN_010
    index on CLCODCGC10 to CLIN01

select 2
use NFSN010
    index on NFNUMNOT10 to NFSN010

SELECT 3
USE CNFSN010
    INDEX ON NFNUMNOT10 TO CNFSN010

select 4
use PRON010A
index on PRCOD10 to PRON01

select 5
use FATN_010
   index on FTCDREG10 to FATN01

select 6
use TRANSN10
   index on TRANSCOD10 to TRAN01

select 7
use DESN_010
   index on DSMESREG10 to DESN01

SELE 9
USE MOVEST10 ALIAS JUNCAO

SELE 10
USE PROD010A INDEX PROD01

select 8
use NFANN_01

SELE 11
USE MOVESN10

SELE 12
USE CADREP10 INDEX REP01

*--- DEFINICAO DAS VARIAVEIS ---*

SET DECIMALS TO 2

SELE PRON010A
LP = RECCOUNT()
PN = 17
declare NFQTDE[LP],NFUNI[LP],NFPROD[LP],NFPR[LP],NFCF[LP],NFCAMPOA[LP],NFCAMPOB[LP],NFVALOR[LP],NFVALORT[LP],NFVALUNI[LP],NFUNI[LP],NFDESC[LP],COMP[LP],DESC[LP],NFLOTE[LP],INCPROD[LP]
DECLARE NUMNOT[LP/PN],VALNOT[LP/PN],DESNOT[LP/PN],NFVALDB1[LP/PN],NFVALDB2[LP/PN],NFVALDB3[LP/PN],;
        NFDESDB1[LP/PN],NFDESDB2[LP/PN],NFDESDB3[LP/PN], SOMCXS[LP/PN], CXSIGUAL[LP/PN], CXSDIFE[LP/PN],;
        LTSSOMA[LP/PN], UNID[LP/PN], NFPESO[LP/PN]
DTPROC = date()
store 0              to NFATUAL,NFICM,SUICID,VOLTA, INDDES, TOTDES1,L, FRETE
store space(3)       to NFBANC
store space(5)       to NFCOD
store DATE()         to NFDTEMI
store space(1)       to RESP, TIP_CLIE_P
NFATL                =  '1'
STORE SPACE(66)      TO NFOBS1, NFOBS
DESD_NOT             = 1
OP                   = 3
Emite_Lote           = 'S'

*--- Base de Calculo do ICMS com Reducao ---*

BC_ICMS_R = 0
BC_ICMS_N = 0 

VLR_ICMS_R = 0
VLR_ICMS_N = 0 

*--- MONTAGEM DA TELA ---*

set cursor off

NFSN_TELA1()

*--- PROCESSAMENTO ---*

set deleted on
set cursor on
select NFANN_01
tone(1200,2)
tone(1000,2)
@ 23,18 say 'Informe a data de emiss„o da nota : ' get NFDTEMI picture '99/99/99' valid NFDTEMI >= NFDTANT01
read
set cursor off
if lastkey() = 27
   set deleted off
   set cursor on
   close all
   return
endif
RESP = 'N'
NFATUAL = NFNUMANT01
set cursor on
do while RESP = 'N'
   tone(1200,2)
   tone(1000,2)
   @ 23,01 clear to 23,78
   @ 23,01 say 'A pr¢xima Nota Fiscal a ser emitida ‚ a :'
   @ 23,43 say NFATUAL + 1 picture '@E 99999'
   @ 23,48 say '...'
   @ 23,51 say 'Confirma ? <S/N>' get RESP picture '@! X' valid RESP $('SN')
   read
   if RESP = 'N'
      NFATUAL = 0
      @ 23,01 clear to 23,78
      @ 23,11 say 'Digite o n£mero da £ltima Nota Fiscal que foi emitida :'
      @ 23,66 get NFATUAL picture '@E 99999'
      read
   endif
enddo
set cursor off
WA = 1

DO WHILE .T.

   store ctod(space(8)) to NFDTSAI
   store space(1)       to NFCR,NFNATOP,NFVIA,DIF,DIF1
   store space(3)       to NFTAB,NFBANC
   store space(2)       to NFCOND1,NFCOND2,NFCOND3
   store 0              to NFBONIF,NFLIN,NFLIN1,NFLIN2,COL1,COL2,COL3,COL4,;
                           TOTQTDE,TOTVAL,TOTTAB,TOTCOMP,;
                           NFTRANS,NFDIF_1,NFDIF_2,TOTBCH,TOTBCHTAB
   store space(4)       to NFNUM,NFPED
   store space(16)      to NFCGC,NFDESCOP,NFDESCVIA
   store space(35)      to NFDTRANS, FCGCTRANS, NFIETRANS, NFUFTRANS, NFCTRANS, NFETRANS
   store ctod('')       to NFDTVDB,NFDTVDB1,NFDTVDB2,NFDTVDB3
   store 'S'            to RESP
   STORE 0              TO VALBON, TOTAL1, TOTAL2, DESCTAB, TOTDES



   FOR AA = 1 TO (LP/PN)
   STORE 0              TO VALNOT[AA], DESNOT[AA], NFVALDB1[AA], NFVALDB2[AA], NFVALDB3[AA], NUMNOT[AA],;
                        SOMCXS[AA], CXSIGUAL [AA], CXSDIFE[AA], LTSSOMA[AA], UNID[AA], NFPESO[AA]

   store space(6)       to NFDESDB1[AA],NFDESDB2[AA],NFDESDB3[AA]
   NEXT
   for IND = 1 to LP
       COMP[IND]     = ' '
       NFQTDE[IND]   = 0
       NFUNI[IND]    = ' '
       NFDESC[IND]   = ' '
       NFPR[IND]     = ' '
       NFCF[IND]     = ' '
       NFVALUNI[IND] = ' '
       NFVALOR[IND]  = ' '
       NFVALORT[IND] = ' '
       NFLOTE[IND]   = 0
   next

do while .T.

   set cursor on



    IF WA = 1

    DO WHILE .T.

     select clin_010
     @ 23,01 clear to 23,78
     @ 23,26 say 'Digite o c¢digo do cliente...'
     @ 07,12 get NFCGC picture '99999999/9999-99'
     read

     if lastkey() = 27
        WA = WA - 1
        RETURN
     endif

     WA = WA + 1
     seek NFCGC
     if EOF()
        mens(23,0,.T.,'Este cliente n„o est  cadastrado... Tecle algo.')
        wa = wa - 1
        SELE 1
        USE CLIN_010
        set INDEX TO CLIN_010
        BROWSE()
        NFCGC = CLCODCGC10
        SELE 1
        USE CLIN_010
        set INDEX TO CLIN01
     ELSE
         EXIT
     endif
    ENDDO

     set cursor off


     IF CLSTACRE10 = "1"
       MENS(23,1,.T.,"Cliente esta devedor - N.F nao sera emitida ! Tecle algo...")
       WA = WA - 1
       loop
     ENDIF

     NFUF       = CLUF10
     TIP_CLIE_P = TIP_CLIE
     nfvend     = clvended10
     nfvendre   = clvended10
     set cursor on

   ENDIF

     IF WA = 2

       do while .T.
          SELE NFSN010
          @ 23,01 clear to 23,78
          @ 23,26 say 'Digite o n£mero do pedido...'
       *   NFPED = SPACE(04)
          @ 07,46 get NFPED picture '9999' valid NFPED <> space(3)
          read
          IF LASTKEY() = 27
             WA = WA - 1
             EXIT
          ENDIF
          WA = WA + 1
          seek NFPED
          if found()
            mens(23,0,.T.,'Este n£mero de pedido j  existe... Tecle algo.')
            wa = wa - 1
            loop
          endif
          exit
       enddo
       if lastkey() = 27
         loop
       endif
      ENDIF

     IF WA = 3

     DO WHILE .T.
       @ 23,01 CLEAR TO 23,78
       @ 23,26 SAY "Confirme o codigo de representante..."
       @ 07,74 GET NFVEND PICTURE "999"
       READ
          IF LASTKEY() = 27
             WA = WA - 1
             EXIT
          ENDIF
          WA = WA + 1
       SELE CLIN_010
       IF NFVEND   != CLVENDED10 .AND. NFVEND   != "999"
          MENS(23,1,.T.,"Codigo do representante n„o est  correto ! Tecle algo...")
          WA = WA - 1
          LOOP
       ELSE
           EXIT
       ENDIF
     ENDDO
       if lastkey() = 27
         loop
       endif
     ENDIF

     IF WA = 4
      store space(3)       to NFTAB
      @ 23,01 clear to 23,78
      @ 23,22 say 'Digite a tabela a ser utilizada...'
      READ


      DO WHILE NFTAB = SPACE(03)
        @ 08,12 get NFTAB picture '@! ' valid val(substr(NFTAB,1,2)) > 0 .and. val(substr(NFTAB,1,2)) <= 12 .and. substr(NFTAB,3,1) = ' ' .or.;
                                         val(substr(NFTAB,1,2)) > 0 .and. val(substr(NFTAB,1,2)) <= 12 .and. substr(NFTAB,3,1) = 'F' .OR. substr(NFTAB,3,1) = 'R' .OR. substr(NFTAB,3,1) = 'B'.OR. substr(NFTAB,3,1) = 'A'
        read
       IF LASTKEY() = 27
             WA = WA - 1
             EXIT
       ENDIF
       WA = WA + 1
      ENDDO
       if lastkey() = 27
         loop
       endif
      ENDIF

      IF WA = 5

        @ 23,01 clear to 23,78
        @ 23,28 say 'Digite a bonifica‡„o...'
        @ 08,26 get NFBONIF picture '99.9'
        read
         IF LASTKEY() = 27
             WA = WA - 1
             loop
        ENDIF
        WA = WA + 1
      ENDIF

      IF WA = 6

       do while .T.
         STORE SPACE(66)      TO NFOBS1, NFOBS
         @ 23,01 clear to 23,78
         @ 23,24 say 'Digite a natureza da opera‡„o...'
         @ 08,46 get NFNATOP picture '9' valid NFNATOP <> space(1)
         read
          IF LASTKEY() = 27
             WA = WA - 1
             EXIT
          ENDIF
          WA = WA + 1
         if NFNATOP <> '1' .and. NFNATOP <> '2' .and. NFNATOP <> '3' .AND. NFNATOP != '4' .AND. NFNATOP != '5'
            mens(23,0,.T.,'Natureza da opera‡„o diferente de 1, 2, 3, 4 ou 5... Tecle algo.')
            WA = WA - 1
            loop
         endif
         exit
       enddo
       if lastkey() = 27
          loop
       endif
       STORE SPACE(66)      TO NFOBS1, NFOBS
       if NFNATOP  = '1'
         NFDESCOP = 'VENDAS'
         NFOBS1   = 'ALIQUOTA DO IPI REDUZIDA A ZERO CONF.ART.1o DO DECRETO No.84338/79'
         If NFUF  = 'SP'
            NFCOD = '5.101'
            NFICM = 18
         Elseif NFUF = 'RS' .or. NFUF = 'PR' .or. NFUF = 'SC' .OR. NFUF = 'RJ' .OR. NFUF = 'MG'
            NFCOD = '6.101'
            NFICM = 12
         Else
            NFCOD = '6.101'
            NFICM = 7
         EndIf
       elseif NFNATOP = '2'
            NFDESCOP = 'DEVOLUCAO'
            DO NFN1_OBS2
            if NFUF  = 'SP'
               NFCOD = '5.201'
               NFICM = 18
            elseif NFUF = 'RS' .or. NFUF = 'PR' .or. NFUF = 'SC' .OR. NFUF = 'RJ' .OR. NFUF = 'MG'
               NFCOD = '6.201'
               NFICM = 12
            ELSE
               NFCOD = '6.201'
               NFICM = 7
            endif
       elseif NFNATOP = '3'
           NFDESCOP = 'REMESSA'
           do NFN1_OBS1
           if empty(NFOBS1)
              NFOBS1 = 'SUSPENSAO DO IPI CONF.ART.1o. INCISO I DO DECRETO No. 87981/82'
           endif
           NFOBS    = 'ICM DIFERIDO NOS TERMOS DO ART.382 DO DECRETO No.33118 DE 14/03/91'
           if NFUF  = 'SP'
             NFCOD = '5.901'
             NFICM = 0
           ELSE
              NFCOD = '6.901'
              NFICM = 0
          endif
       elseif NFNATOP = '4'
          NFDESCOP = 'IMPORTACAO'
          NFREG = '51'
          NFCOD = '3.101'
          NFICM = 18
          do NFN1_OBS2
       elseIF NFNATOP = '5'
            NFDESCOP = 'OUTRAS SAIDAS'
            NFREG  = '51'
            NFOBS1 = 'ALIQUOTA DO IPI REDUZIDA A ZERO CONF.ART.1o.DO DECRETO No.84338/79'
            if NFUF = 'SP'
               NFCOD = '5.949'
               NFICM = 18
            elseif NFUF = 'RS' .or. NFUF = 'PR' .or. NFUF = 'SC' .OR. NFUF = 'RJ' .OR. NFUF = 'MG'
                   NFCOD = '6.949'
                   NFICM = 12
            else
                NFCOD = '6.949'
                NFICM = 7
            endif
       elseif NFNATOP = '6'

          NFDESCOP = 'ENTRADA DE COMPRA'

          if NFUF  = 'SP'
               NFCOD = '1.101'
               NFICM = 18
          elseif NFUF = 'RS' .or. NFUF = 'PR' .or. NFUF = 'SC' .OR. NFUF = 'RJ' .OR. NFUF = 'MG'
               NFCOD = '2.101'
               NFICM = 12
          ELSE
               NFCOD = '2.101'
               NFICM = 7
          endif

          do NFN1_OBS2

       elseif NFNATOP = '7'

          NFDESCOP = 'ENTRADA DE DEVOLUCAO'

          if NFUF  = 'SP'
               NFCOD = '1.201'
               NFICM = 18
          elseif NFUF = 'RS' .or. NFUF = 'PR' .or. NFUF = 'SC' .OR. NFUF = 'RJ' .OR. NFUF = 'MG'
               NFCOD = '2.201'
               NFICM = 12
          ELSE
               NFCOD = '2.201'
               NFICM = 7
          endif

          do NFN1_OBS2
          
      endif

        SELECT CLIN_010

     IF CLPESSOA10 = "PF"
      SELE NFSN010
       IF   NFNATOP  = '1'
       NFDESCOP = 'VENDAS'
       NFOBS1   = 'ALIQUOTA DO IPI REDUZIDA A ZERO CONF.ART.1o DO DECRETO No.84338/79'
       if NFUF  = 'SP'
          NFCOD = '5.101'
          NFICM = 18
       elseif NFUF = 'RS' .or. NFUF = 'PR' .or. NFUF = 'SC' .OR. NFUF = 'RJ' .OR. NFUF = 'MG'
          NFCOD = '6.101'
          NFICM = 18
       ELSE
           NFCOD = '6.101'
           NFICM = 18
       endif
     elseif NFNATOP = '2'
           NFDESCOP = 'DEVOLUCAO'
           DO NFN1_OBS2
         if NFUF  = 'SP'
            NFCOD = '5.201'
            NFICM = 18  
         elseif NFUF = 'RS' .or. NFUF = 'PR' .or. NFUF = 'SC' .OR. NFUF = 'RJ' .OR. NFUF = 'MG'
                NFCOD = '6.201'
                NFICM = 18
         ELSE
             NFCOD = '6.201'
             NFICM = 18
         endif
     elseif NFNATOP = '3'
          NFDESCOP = 'REMESSA'
          do NFN1_OBS1
          if empty(NFOBS1)
             NFOBS1 = 'SUSPENSAO DO IPI CONF.ART.1o. INCISO I DO DECRETO No. 87981/82'
          endif
          NFOBS    = 'ICM DIFERIDO NOS TERMOS DO ART.382 DO DECRETO No.33118 DE 14/03/91'
          if NFUF  = 'SP'
             NFCOD = '5.901'
             NFICM = 0
          ELSE
              NFCOD = '6.901'
              NFICM = 0
          endif
     elseif NFNATOP = '4'
          NFDESCOP = 'IMPORTACAO'
          NFREG = '51'
          NFCOD = '3.101'
          NFICM = 18
          do NFN1_OBS2
     elseIF NFNATOP = '5'
            NFDESCOP = 'OUTRAS SAIDAS'
            NFREG  = '51'
            NFOBS1 = 'ALIQUOTA DO IPI REDUZIDA A ZERO CONF.ART.1o.DO DECRETO No.84338/79'
            if NFUF = 'SP'
               NFCOD = '5.949'
               NFICM = 18
            elseif NFUF = 'RS' .or. NFUF = 'PR' .or. NFUF = 'SC' .OR. NFUF = 'RJ' .OR. NFUF = 'MG'
                   NFCOD = '6.949'
                   NFICM = 18
            else
                NFCOD = '6.949'
                NFICM = 18
            endif
     elseif NFNATOP = '6'

          NFDESCOP = 'ENTRADA DE COMPRA'

          if NFUF  = 'SP'
               NFCOD = '1.101'
               NFICM = 18
          elseif NFUF = 'RS' .or. NFUF = 'PR' .or. NFUF = 'SC' .OR. NFUF = 'RJ' .OR. NFUF = 'MG'
               NFCOD = '2.101'
               NFICM = 12
          ELSE
               NFCOD = '2.101'
               NFICM = 7
          endif

          do NFN1_OBS2

       elseif NFNATOP = '7'

          NFDESCOP = 'ENTRADA DE DEVOLUCAO'

          if NFUF  = 'SP'
               NFCOD = '1.201'
               NFICM = 18
          elseif NFUF = 'RS' .or. NFUF = 'PR' .or. NFUF = 'SC' .OR. NFUF = 'RJ' .OR. NFUF = 'MG'
               NFCOD = '2.201'
               NFICM = 12
          ELSE
               NFCOD = '2.201'
               NFICM = 7
          endif

          do NFN1_OBS2

     endif

    ENDIF

    SELE NFSN010
    ENDIF

    IF WA = 7

     do while .T.
        @ 23,01 clear to 23,78
        @ 23,26 say 'Digite a Via de transporte...'
        @ 08,62 get NFVIA picture '9' valid NFVIA <> space(1)
        read
         IF LASTKEY() = 27
               WA = WA - 1
              EXIT
         ENDIF
         WA = WA + 1
         if NFVIA <> '1' .and. NFVIA <> '2' .and. NFVIA <> '3' .and. NFVIA <> '4'
           mens(23,0,.T.,'Via de transporte diferente de 1, 2, 3 ou 4... Tecle algo.')
           WA = WA - 1
           loop
         endif
         exit
     enddo
       if lastkey() = 27
          loop
       endif
     if NFVIA = '1'
        NFDESCVIA = 'RODOVIARIO'
     elseif NFVIA = '2'
       NFDESCVIA = 'AEREO'
     elseif NFVIA = '3'
       NFDESCVIA = 'FERROVIARIO'
     else
       NFDESCVIA = 'MARITIMO'
     endif
     select TRANSN10
   ENDIF

   IF WA = 8

     do while .T.
       @ 23,01 clear to 23,78
       @ 23,23 say 'Digite o c¢digo da transportadora...'
       @ 08,74 get NFTRANS picture '99'
       read
        IF LASTKEY() = 27
              WA = WA - 1
              EXIT
        ENDIF
        WA = WA + 1
       seek NFTRANS
       if .not. found()
          mens(23,0,.T.,'C¢digo da Transportadora n„o existe... Tecle algo.')
          WA = WA - 1
          loop
       endif
       NFDTRANS   = TRANSNOM10
       NFCGCTRANS = TRANSCGC10
       NFIETRANS  = TRANSIE10
       NFUFTRANS  = TRANSUF10
       NFCTRANS   = TRANSCID10
       NFETRANS   = TRANSEND10
       exit
    enddo
       if lastkey() = 27
          loop
       endif
   ENDIF

   IF WA = 9

    @ 23,01 clear to 23,78
    @ 23,20 say 'Digite o c¢digo do banco correspondente...'
    @ 09,12 get NFBANC picture '999' valid NFBANC = '   ' .or. NFBANC = '001' .or. NFBANC = '230' .or.;
                                                              NFBANC = '237' .or. NFBANC = '999'
    READ
     IF LASTKEY() = 27
          WA = WA - 1
          loop
     ENDIF
     WA = WA + 1
    if NFBANC = space(3)
       select CLIN_010
       seek NFCGC
       NFBANC = CLBANCO10
       @ 09,12 say NFBANC
    endif
   ENDIF

   IF WA = 10
    @ 23,01 clear to 23,78
    @ 23,08 say 'Informe se a Nota Fiscal ser  emitida com o Lote dos Produtos...'
    @ 09,31 get Emite_Lote picture '@! X' valid Emite_Lote $('SN')
    READ
     IF LASTKEY() = 27
          WA = WA - 1
          loop
     ENDIF
     WA = WA + 1
   ENDIF

   IF WA = 11

     @ 23,01 clear to 23,78
     @ 23,24 say 'Digite a condi‡„o de pagamento...'
     @ 09,69 get NFCOND1 picture '99'
     @ 09,72 get NFCOND2 picture '99'
     @ 09,75 get NFCOND3 picture '99'
     read

     if lastkey() = 27
      wa = wa - 1
      loop
     endif


     NFCOND1 = IF(NFNATOP="1",NFCOND1,"  ")
     IF NFCOND1 = "  "
       NFCOND1 = NFCOND2
       NFCOND2 = NFCOND3
       NFCOND3 = "  "
     ENDIF
     IF NFCOND2 = "  "
       NFCOND2 = NFCOND3
       NFCOND3 = "  "
     ENDIF
     @ 09,69 SAY NFCOND1
     @ 09,72 SAY NFCOND2
     @ 09,75 SAY NFCOND3
     NFBANC  = IF(NFCOND1="  ","999",NFBANC)
     @ 09,12 say NFBANC
     COL1  = 04
     COL2  = 11
     COL3  = 22
     COL4  = 32
     VEZ_D = 01
     ENDIF
     do while .T.
        if NFLIN2 = 8
           NFLIN2 = 0
           COL1   = COL1  + 38
           COL2   = COL2  + 38
           COL3   = COL3  + 38
	   COL4   = COL4  + 38 
           VEZ_D  = VEZ_D + 01
        endif
        IF VEZ_D = 03
           VEZ_D = 01
           COL1  = 04
           COL2  = 11
           COL3  = 22
	   COL4  = 32
           SCROLL(12,COL1,20,COL3,0)
           SCROLL(12,COL1+32,20,COL3+32,0)
        ENDIF
        NFLIN         = NFLIN  + 1
        NFLIN2        = NFLIN2 + 1
        NFPROD[NFLIN] = space(6)
        NFQTDE[NFLIN] = 0
        NFLIN1        = 11 + NFLIN2
        do ROTNINPUT
        if DIF1 = '1'
           DIF1 = ' '
           exit
        endif
        if NFLIN = LP
           NFLIN1 = NFLIN1 + 1
           do GRAVAN
           exit
        endif
     enddo
     @ 23,01 clear to 23,78
     @ 23,23 say 'Deseja digitar mais notas ? <S/N> ' get RESP picture '@! X' valid RESP $('SN')
     read
     SELE NFSN010

     if RESP = 'N'
        exit
     ELSE
       WA = 1
       NFSN_TELA1()
       EXIT
     ENDIF

     ENDDO
     if RESP = 'N'
        exit
     ENDIF

enddo
  set cursor on

  set deleted off
  close all
  return

*--- ROTINA DE INPUT ---*

procedure ROTNINPUT
select PRON010A

do while .T.
   @ 23,01 clear to 23,78
   @ 23,26 say 'Digite o c¢digo do produto...'
   @ NFLIN1,COL1 get NFPROD[NFLIN] picture '@!' valid NFPROD[NFLIN] <> space(6)
   read
   if NFPROD[NFLIN] = 'TOTAL'
      if NFLIN = 1
         mens(23,0,.T.,'Vocˆ n„o digitou nenhum produto, n„o posso totalizar... Tecle algo.')
         loop
      endif
      NFLIN = NFLIN - 1
      DIF1  = '1'
      do GRAVAN
      exit
   endif
   seek NFPROD[NFLIN]

   if .not. found()
      mens(23,0,.T.,'C¢digo do produto n„o existe... Tecle algo.')
      loop
   endif
   for IND = 1 to NFLIN
       if NFPROD[NFLIN] = COMP[IND]
          mens(23,0,.T.,'Este produto j  foi digitado... Tecle algo.')
          DIF1 = '1'
       endif
   next
   if DIF1 = '1'
      DIF1 = ' '
      loop
   else
      COMP[NFLIN] = NFPROD[NFLIN]
      DESC[NFLIN] = DESCONTO
   endif
   @ 23,01 clear to 23,78
   @ 23,30 say 'Digite a quantidade...'
   @ NFLIN1,COL2 get NFQTDE[NFLIN] picture '999999.999' valid NFQTDE[NFLIN] > 0
   read

   if NFQTDE[NFLIN] > PRESTATU10
      NFDIF_1 = NFQTDE[NFLIN] - PRESTATU10
      NFDIF_2 = NFDIF_2 + NFDIF_1
      @ NFLIN1,COL3 say NFDIF_1 picture '999999.99'
      mens(23,0,.T.,'Estoque Inferior - Tecle <ENTER> para Processeguir ou <ESC> para Voltar.')

      @ NFLIN1,COL3 say '         '

      if lastkey() = 27
        STORE SPACE(06) TO COMP[NFLIN]
        STORE         0 TO NFDIF_1,NFDIF_2
        loop
      endif

   endif

   *** Carrega o Lote do Produto ***

   If Emite_Lote = 'S' 
      NFLOTE[NFLIN] = PRLOTE10
      @ 23,01 clear to 23,78
      @ 23,30 say 'Digite o Lote do Produto...'
      @ NFLIN1,COL4 get NFLOTE[NFLIN] picture '9999999' valid NFQTDE[NFLIN] > 0
      read
   EndIf 

   do ROTTOTN
   exit
enddo
return

*--- ROTINA DE TOTALIZACAO ---*

procedure ROTTOTN
select NFANN_01
MESCALC = if(day(date())>NFDIATAB01,month(date())+1,month(date()))
MESCALC = if(MESCALC=13,01,MESCALC)
MESCALC = ALLTRIM(STR(MESCALC))
MESCALC = IF(LEN(MESCALC)=1,"0"+MESCALC,MESCALC)
MESCALC = LEFT(NFTAB,2)

IF SUBSTR(NFTAB,3,1) = "R"
  PRECO   = "PRPREC" + MESCALC + "30"
ELSEIF SUBSTR(NFTAB,3,1) = "B"
  PRECO   = "PRPREC" + MESCALC + "40"
ELSEIF SUBSTR(NFTAB,3,1) = "A"
  PRECO   = "PRPREC" + MESCALC + "50"
ELSE
  PRECO   = "PRPREC" + MESCALC + "10"
ENDIF

* PRECO   = "PRPREC" + MESCALC + IF(SUBSTR(NFTAB,3,1)="R","30","10")

select PRON010A
SEEK NFPROD[NFLIN]
DESC[NFLIN] = DESCONTO
NFVALOR[NFLIN]  = &PRECO. * NFQTDE[NFLIN]
NFVALUNI[NFLIN] = &PRECO.
TABELA = LEFT(NFTAB,2)

* PRECO     = "PRPREC" + TABELA + IF(SUBSTR(NFTAB,3,1)="R","30","10")

IF SUBSTR(NFTAB,3,1) = "R"
  PRECO   = "PRPREC" + MESCALC + "30"
ELSEIF SUBSTR(NFTAB,3,1) = "B"
  PRECO   = "PRPREC" + MESCALC + "40"
ELSEIF SUBSTR(NFTAB,3,1) = "A"
  PRECO   = "PRPREC" + MESCALC + "50"
ELSE
  PRECO   = "PRPREC" + MESCALC + "10"
ENDIF

VALTAB    = &PRECO. * NFQTDE[NFLIN]
NFVALORT[NFLIN]  = &PRECO. * NFQTDE[NFLIN]
VALTABUNI = &PRECO.
TOTQTDE     = TOTQTDE + NFQTDE[NFLIN]
IF DESC [NFLIN] = "S" .OR. VAL(TIP_CLIE_P) = 4 .OR. VAL(TIP_CLIE_P) = 2
   TOTVAL = TOTVAL + NFVALOR[NFLIN]
   TOTTAB = TOTTAB + VALTAB
ENDIF
IF DESC [NFLIN] = "N"
   TOTBCH    = TOTBCH    + NFVALOR[NFLIN]
   TOTBCHTAB = TOTBCHTAB + VALTAB
ENDIF
NFUNI[NFLIN]  = PRUNI10
NFDESC[NFLIN] = PRDESC10
NFPR[NFLIN]   = PRCODPRO10
NFCF[NFLIN]   = PRCODCF10

*If Emite_Lote = 'S' 
*   NFLOTE[NFLIN] = PRLOTE10
*EndIf 

return

*--- ROTINA DE GRAVACAO E FINALIZACAO ---*

procedure GRAVAN
@ NFLIN1,COL1 say 'Total:'
set cursor on
do while .T.
   @ 23,01 clear to 23,77
   @ 23,27 say 'Digite o total do pedido...'
   TOTCOMP = TOTQTDE
   @ NFLIN1,COL2-1 get TOTCOMP picture '9999999.999' valid TOTCOMP > 0
   read
   if TOTCOMP <> TOTQTDE
      mens(23,0,.T.,'O total da quantidade n„o confere... Tecle algo.')
      loop
   endif
   if NFDIF_2 <> 0
      mens(23,0,.T.,'Esta nota n„o pode ser feita devido a insuficiencia de estoque... Tecle Algo.')
      exit
   endif
   if TOTVAL + TOTBCH > 9999999999.99
      mens(23,0,.T.,'O valor da nota est  muito grande... Favor dividi-la... Tecle algo.')
      exit
   endif
   select FATN_010
   seek NFTAB
   FREMIN = FTFREMIN10
   if TOTVAL <> 0
      if TOTVAL < FTPEDMIN10
         mens(23,0,.T.,'Total do pedido inferior ao valor minimo por pedido... Tecle algo.')
         @ 23,01 clear to 23,78
         @ 23,33 say 'Aceita ? <S/N> ' get RESP picture '@! X' valid RESP $('SN')
         read
         if RESP = 'N'
            exit
         endif
      endif
   endif
   set cursor off
   select DESN_010
   seek NFTAB
   TOTDES = TOTTAB * NFBONIF / 100
   TOTAL1 = TOTTAB - TOTDES - TOTBCHTAB
   if TOTTAB <> 0 .AND. SUBSTR(NFTAB,3,1) != "F"
      do while EOF() = .F.
      if TOTAL1 >= DSVALINI10 .and. TOTAL1 <= DSVALFIM10 .and. dsmesreg10 == nftab
         DESCTAB = DSDESC10
         exit
      else
          skip
      endif
      enddo
   endif
   set cursor on
   @ 23,01 clear to 23,78
   @ 23,22 say 'Confirma os dados digitados ? <S/N> ' get RESP picture '@! X' valid RESP $('SN')
   read
   set cursor off
   if RESP = 'N'
      exit
   endif
   NFATUAL = NFATUAL + 1
   NFATL   = ' '
   if NFCOND3 <> space(2)
      do ROTNCOND3
   elseif NFCOND2 <> space(2)
          do ROTNCOND2
   else
      store ctod(' ') to NFDTVDB1,NFDTVDB2,NFDTVDB3
      NFDTVDB = NFDTEMI + val(NFCOND1)
   endif

   select NFSN010
   append blank
   replace NFCDREG010 with '0'
   replace NFCODCGC10 with NFCGC
   replace NFNUMSEQ10 with NFPED
   replace NFNUMNOT10 with NFATUAL
   replace NFDATA10   with NFDTEMI
   IF NFNATOP = '1'
      replace NFDATAV10  with NFDTVDB
   ENDIF
   REPLACE NFINDDES10 WITH NFBONIF
   replace NFNUMTAB10 with NFTAB
   replace NFUF10     with NFUF
   replace NFFAT10    with '0'
   replace NFCONDPG10 with NFCOND1+NFCOND2+NFCOND3
   replace NFCODVED10 with substr(NFCOD,1,1) + substr(nfcod,3,3)
   replace NFNATOP10  with NFNATOP
   replace NFVIA10    with NFVIA
   replace NFTRANSP10 with NFTRANS
   replace NFBANCO10  with NFBANC
   replace NFDTVDB110 with NFDTVDB1
   replace NFDTVDB210 with NFDTVDB2
   replace NFDTVDB310 with NFDTVDB3
   replace nfvended10 with nfvend, nfvendre10 with nfvendre
   VAR_PROG(2,0)
   SELECT CNFSN010
   PROD_NOT = 1
   DESD_NOT = 1
   for IND = 1 to NFLIN
       select NFANN_01
       replace NFDTANT01  with NFDTEMI
       replace NFNUMANT01 with NFATUAL
       NUMNOT[DESD_NOT] = NFATUAL
       SELE CNFSN010
       APPEND BLANK
       REPLACE NFNUMNOT10 WITH NUMNOT[DESD_NOT]
       replace NFPROD10   with NFPROD[IND]
       replace NFQTDE10   with NFQTDE[IND]
       IF NFBONIF <> 0
         REPLACE NFPRECO WITH (NFVALOR[IND]) - ((NFVALOR[IND]*NFBONIF)/100)
       ELSE
         REPLACE NFPRECO WITH NFVALOR[IND]
       ENDIF
       select PRON010A
       seek NFPROD[IND]
       IF .NOT. EOF()
          if PRTIPO10 = '40'
             CXSIGUAL [DESD_NOT] = CXSIGUAL[DESD_NOT] + NFQTDE[IND]
          elseif PRUNI10 = 'CXS' .OR. PRUNI10 = "KIT"
                 CXSDIFE[DESD_NOT] = CXSDIFE[DESD_NOT] + NFQTDE[IND]
          else
              LTSSOMA[DESD_NOT] = LTSSOMA[DESD_NOT] + NFQTDE[IND]
          endif
          IF PRUNI10 = "CXS" .OR. PRUNI10 = "LTS" .OR. PRUNI10 = "KIT" .OR. PRUNI10 = "FR "  
             UNID [DESD_NOT] = UNID [DESD_NOT] + NFQTDE [IND]
          ENDIF
          NFPESO[DESD_NOT] = NFPESO[DESD_NOT] + (NFQTDE[IND] * PRPESO10)
          NFESTATU = PRESTATU10
          SELE MOVESN10
          APPEND BLANK
          REPLACE MVCODREG10 WITH "51"
          replace MVNUMNOT10 with NFATUAL
          replace MVDTEMNF10 with DTPROC
          replace MVCODPRO10 with NFPROD[IND]
          replace MVQTDPRO10 with NFQTDE[IND]
          replace MVTABPRE10 with NFTAB
          replace MVNUMREG10 with recno()
          replace MVESTATU10 with NFESTATU
          IF NFCGC = "48558779/0001-91"
             SELE PROD010A
             seek NFPROD[IND]
             IF FOUND()
                NFESTATU = PRESTATU10
                REPLACE PRESTATU10 WITH PRESTATU10 + NFQTDE[IND]
             ENDIF
             select JUNCAO
             append blank
             REPLACE MVCODREG10 WITH "01"
             replace MVNUMNOT10 with NFATUAL
             replace MVDTEMNF10 with DTPROC
             replace MVCODPRO10 with NFPROD[IND]
             replace MVQTDPRO10 with NFQTDE[IND]
             replace MVTABPRE10 with NFTAB
             replace MVNUMREG10 with recno()
             replace MVESTATU10 with NFESTATU
          ENDIF
          SELE PRON010A
          REPLACE PRESTATU10 WITH PRESTATU10 - NFQTDE[IND]
	  If Emite_Lote = 'S' 
	     Replace PRLOTE10 With NFLOTE[IND]
	  EndIf 
       ENDIF
       VALNOT[DESD_NOT] = VALNOT[DESD_NOT] + NFVALOR[IND]
       TOTAL1 = NFVALORT[IND] - (NFVALORT[IND] * NFBONIF / 100)
       TOTAL2 = TOTAL1 - (TOTAL1 * DESCTAB / 100)
*       TOTAL3 = NFVALOR[IND] - NFVALORT[IND]
       TOTAL3 = 0
       DESNOT[DESD_NOT] = DESNOT[DESD_NOT] + (NFVALORT[IND] - TOTAL2) + TOTAL3
*       TOTAL1 = (NFVALORT[IND] * NFBONIF / 100)
*       TOTAL2 = NFVALORT[IND] - TOTAL1
*       TOTAL3 = IF(DESC[IND]="S",(TOTAL2*DESCTAB/100),0)
*       TOTAL4 = NFVALOR[IND] - NFVALORT[IND]
*       DESNOT[DESD_NOT] = DESNOT[DESD_NOT] + (TOTAL1 + TOTAL3 + TOTAL4)
       SELE NFSN010
       REPLACE NFVALTOT10 WITH VALNOT[DESD_NOT] - DESNOT[DESD_NOT]
       REPLACE NFVALDES10 WITH DESNOT[DESD_NOT]
       if NFCOND3 <> space(2)
          do ROTNCOND3
       elseif NFCOND2 <> space(2)
              do ROTNCOND2
       else
           STORE SPACE(6) TO NFDESDB1[DESD_NOT],NFDESDB2[DESD_NOT],NFDESDB3[DESD_NOT]
           store ctod(' ') to NFDTVDB1,NFDTVDB2,NFDTVDB3
           store 0         to NFVALDB1[DESD_NOT],NFVALDB2[DESD_NOT],NFVALDB3[DESD_NOT]
           NFDTVDB = NFDTEMI + val(NFCOND1)
       endif
       replace NFDESDB110 with NFDESDB1[DESD_NOT]
       replace NFDESDB210 with NFDESDB2[DESD_NOT]
       replace NFDESDB310 with NFDESDB3[DESD_NOT]
       REPLACE NFVALDB110 WITH NFVALDB1[DESD_NOT]
       REPLACE NFVALDB210 WITH NFVALDB2[DESD_NOT]
       REPLACE NFVALDB310 WITH NFVALDB3[DESD_NOT]
       replace NFDTVDB110 with NFDTVDB1
       replace NFDTVDB210 with NFDTVDB2
       replace NFDTVDB310 with NFDTVDB3
       IF PROD_NOT = PN
          PROD_NOT = 0
          IF NFPROD[IND+1] != SPACE(06) .AND. NFPROD[IND+1] != "TOTAL"
             DESD_NOT = DESD_NOT + 1
             NFATUAL = NFATUAL + 1
             NUMNOT[DESD_NOT] = NFATUAL
             SELE NFSN010
             APPEND BLANK
             GRAVA_VAR(2,0,.F.)
             REPLACE NFNUMNOT10 WITH NFATUAL
             VAR_PROG(2,0)
             select NFANN_01
             replace NFDTANT01  with NFDTEMI
             replace NFNUMANT01 with NFATUAL
          ENDIF
       ENDIF
       VAR_PROG(2,0)
       PROD_NOT = PROD_NOT + 1
   next
   do ROTNIMP
   exit
enddo
set cursor off
return

*--- ROTINA DE IMPRESSAO ---*

procedure ROTNIMP
pos_nfsn()

verimp()
*Set Print On
*Set Printer To "Fla.txt"
Set Device To Printer

@ L,000 SAY CHR(15)
@ L,088 say 'X'
SET CONSOLE OFF
BB = 1
FOR AA = 1 TO DESD_NOT
@ L,000 SAY CHR(15)
@ L,088 say 'X'
NOTA_P = ALLTRIM(STR(INT(NUMNOT[AA])))
NOTA_P = REPLICATE("0",6-LEN(NOTA_P)) + NOTA_P
@ L,128 SAY NOTA_P
@ l,153 say nota_p
L = L + 2
*@ L,042 SAY "PFC N§ 430"
L = L + 3
@ L,004 say alltrim(NFDESCOP)
@ L,045 SAY NFCOD
L = L + 3

select CLIN_010
@ L,004 say CLRAZSOC10
@ L,097 say CLCODCGC10
@ L,128 say NFDTEMI
L = L + 2
@ L,004 say CLENDER10
@ L,080 SAY CLBAIRRO10
@ L,108 SAY CLCEP10
L = L + 2
@ L,004 say CLCIDADE10
@ L,054 SAY "(" + ALLTRIM(CLDDD10) + ")/" + CLFONE10
@ L,080 say CLUF10
@ L,097 SAY CLIE10
L = L + 3
@ L,004 say NFDTEMI

IF NFNATOP = "1"
   @ L,030 SAY NUMNOT [AA]                PICTURE "999999"
   @ L,055 SAY VALNOT [AA] - DESNOT [AA]  PICTURE "999,999.99"
   @ L,084 SAY NUMNOT [AA]                PICTURE "999999"
   if val(NFCOND3) <> 0
      @ L,100 SAY NFCOND1 + ' / ' + NFCOND2 + ' / ' + NFCOND3 + ' D.D.'
   elseif val(NFCOND2) <> 0
          @ L,100 say NFCOND1 + ' / ' + NFCOND2 + ' D.D.'
   elseif val(NFCOND1) = 0
          @ L,100 say 'A VISTA'
   else
       @ L,100 say NFDTEMI + VAL(NFCOND1)
   endif
ENDIF
L = L + 4
@ L,004 say CLENDcob10
L = L + 2
DESCVAL = VALNOT[AA] - DESNOT[AA]
LI = L
LINHA   = EXTENSO3(DESCVAL)
L = LI
@ L,004 say LINHA
L = L + 2
if NFCOND1 <> space(5) .and. NFCOND2 <> space(5)
   @ L,030 say NFDESDB1[AA]
   @ L,044 say NFDTEMI  + val(NFCOND1)
   @ L,065 say NFVALDB1[AA] picture '999,999.99'
   @ L,085 say NFDESDB2[AA]
   @ L,100 say NFDTEMI  + val(NFCOND2)
   @ L,128 say NFVALDB2[AA] picture '999,999.99'
   L = L + 1
   if NFCOND3 <> space(5)
      @ L,030 say NFDESDB3[AA]
      @ L,044 say NFDTEMI  + val(NFCOND3)
      @ L,065 say NFVALDB3[AA] picture '999,999.99'
   endif
else
    L = L + 1
endif

L = L + 2
If Emite_Lote = 'S'
   @ L,057 say 'LOTE'
EndIf 
L = L + 1

TOT_NOTA_P = 0

BC_ICMS_R = 0
BC_ICMS_N = 0 

VLR_ICMS_R = 0
VLR_ICMS_N = 0 

for VOLTA = 1 to PN
    QTD_P = NFQTDE[VOLTA+(BB-1)]
    IF QTD_P != 0
       P_DEC = QTD_P - INT(QTD_P)
       IF P_DEC = 0
          MASCARA =  '9999999999'
       ELSE
           MASCARA = '999999.999'
       ENDIF
       @ L,076 say QTD_P picture MASCARA
    ENDIF
    @ L,008 say NFDESC[VOLTA+(BB-1)]
    If Emite_Lote = 'S' 
       @ L,054 say NFLOTE[VOLTA+(BB-1)]   picture '@EZ 9999999'
    EndIf 
    @ L,063 SAY NFCF [VOLTA+(BB-1)]
    @ L,067 SAY NFPR [VOLTA+(BB-1)]
    @ L,071 say NFUNI[VOLTA+(BB-1)]
    @ L,090 say NFVALUNI[VOLTA+(BB-1)] picture '99,999.99'
    @ L,109 say NFVALOR[VOLTA+(BB-1)]  picture '999,999.99'

    *** Calculo ICMS com Reducao ***

    If .Not. Empty(NFVALOR[VOLTA+(BB-1)])
       If NFNATOP != '3' .And. NFNATOP != '4' 
          If NFUF = 'SP'
             If NFCF [VOLTA+(BB-1)] = 'A' .Or. NFCF [VOLTA+(BB-1)] = 'B' .Or. NFCF [VOLTA+(BB-1)] = 'D' .Or. NFCF [VOLTA+(BB-1)] = 'E' .Or. NFCF [VOLTA+(BB-1)] = 'I' .Or. NFCF [VOLTA+(BB-1)] = 'J' .Or. NFCF [VOLTA+(BB-1)] = 'L' .Or. NFCF [VOLTA+(BB-1)] = 'M' .Or. NFCF [VOLTA+(BB-1)] = 'Q' .Or. NFCF [VOLTA+(BB-1)] = 'R' .Or. NFCF [VOLTA+(BB-1)] = 'S' .Or. NFCF [VOLTA+(BB-1)] = 'T' .Or. NFCF [VOLTA+(BB-1)] = 'U'
                NFICM = 12
                BC_ICMS_R = BC_ICMS_R + NFVALOR[VOLTA+(BB-1)]
             ElseIf NFCF [VOLTA+(BB-1)] = 'F' .Or. NFCF [VOLTA+(BB-1)] = 'N' .Or. NFCF [VOLTA+(BB-1)] = 'O' .Or. NFCF [VOLTA+(BB-1)] = 'P' .Or. NFCF [VOLTA+(BB-1)] = 'C'
                NFICM = 18
                BC_ICMS_N = BC_ICMS_N + NFVALOR[VOLTA+(BB-1)]
             Else
                BC_ICMS_N = BC_ICMS_N + NFVALOR[VOLTA+(BB-1)]
             EndIf
          Else
             BC_ICMS_N = BC_ICMS_N + NFVALOR[VOLTA+(BB-1)]
          EndIf
       Else
          BC_ICMS_N = BC_ICMS_N + NFVALOR[VOLTA+(BB-1)]
       EndIf
    EndIf 

    *** Final do Calculo ICMS com Reducao ***

    IF QTD_P != 0
       @ L,068 SAY IF(NFUF="AM","4","0")
       @ L,123 SAY NFICM PICTURE "99%"
    ENDIF
    L = L + 1
next
BB = BB + PN
*@ L,109 say replicate('-',10)
*L = L + 1
   @ L,088 SAY "Total ----->"
@ L,109 say VALNOT[AA] picture '999,999.99'
L = L + 1
if DESNOT[AA] != 0
   @ L,088 say 'Desconto -->'
   @ L,109 say DESNOT[AA]  picture '999,999.99'
endif

*** Preparacao para Impressao do ICMS ***

If NFBONIF > 0
   If BC_ICMS_N > 0
      BC_ICMS_N = BC_ICMS_N - ((BC_ICMS_N * NFBONIF) / 100)
   EndIf
   If BC_ICMS_R > 0 
      BC_ICMS_R = BC_ICMS_R - ((BC_ICMS_R * NFBONIF) / 100)
   EndIf 
EndIf

If DESCTAB > 0
   If BC_ICMS_N > 0
      BC_ICMS_N = BC_ICMS_N - ((BC_ICMS_N * DESCTAB) / 100)
   EndIf 
   If BC_ICMS_N > 0
      BC_ICMS_R = BC_ICMS_R - ((BC_ICMS_R * DESCTAB) / 100)
   EndIf 
EndIf

If NFNATOP != '3' .And. NFNATOP != '4' 
   If BC_ICMS_N > 0
      If NFUF = 'SP'
         VLR_ICMS_N = ((BC_ICMS_N * 18) / 100)
      Else
         VLR_ICMS_N = ((BC_ICMS_N * NFICM) / 100)
      EndIf 
   EndIf
Else
   If BC_ICMS_N > 0
      VLR_ICMS_N = ((BC_ICMS_N * NFICM) / 100)
   EndIf 
EndIf 

If NFNATOP != '3' .And. NFNATOP != '4' 
   If BC_ICMS_R > 0
      If NFUF = 'SP'
         VLR_ICMS_R = ((BC_ICMS_R * 12) / 100)
      Else
         VLR_ICMS_R = ((BC_ICMS_R * NFICM) / 100)
      EndIf
   EndIf
Else
   If BC_ICMS_R > 0
      VLR_ICMS_R = ((BC_ICMS_R * NFICM) / 100)
   EndIf 
EndIf 

*L = L + 1
@ L,004 SAY NFOBS1
L = L + 1
If NFNATOP != '3' .And. NFNATOP != '4' 
   If BC_ICMS_R > 0
      If NFUF = 'SP'
         @ L,004 Say 'REDUC.DA B.CALC.EM 33,33% CONF.ART.39 DO ANEXO II DO RICMS/00,DADO PELO DECR.SP49113/04-(B.NORM.R$'
         @ L,103 Say BC_ICMS_N          Picture '999,999.99'
         @ L,114 Say '/ B.RED.R$'
         @ L,125 Say BC_ICMS_R          Picture '999,999.99'
         @ L,135 Say ')'
      Else
         @ L,004 SAY NFOBS
      EndIf
   Else
      @ L,004 SAY NFOBS
   EndIf
Else
   @ L,004 SAY NFOBS
EndIf 

L = L + 3

*** Forma de Impressao Antiga ***
*@ L,007 say VALNOT[AA] - DESNOT[AA]  picture '999,999.99'
*@ L,035 say (((VALNOT[AA]-DESNOT[AA]) * NFICM) / 100) picture '99,999.99'

@ L,007 say (BC_ICMS_N + BC_ICMS_R)   picture '999,999.99'
@ L,035 say (VLR_ICMS_N + VLR_ICMS_R) picture '99,999.99'

*** Finalizacao para Impressao do ICMS ***

@ L,119 say VALNOT[AA] - DESNOT[AA]  picture '999,999.99'
L = L + 2
@ L,119 say VALNOT[AA] - DESNOT[AA]                 picture '999,999.99'
L = L + 3


   replace CLDT10     with NFDTEMI

   IF NFBONIF <> 0
     REPLACE CLULTVAL10 WITH VALNOT[AA] - DESNOT[AA]
   ELSE
     REPLACE CLULTVAL10 WITH VALNOT[AA] 
   ENDIF




@ L,004 say NFDTRANS
IF AA = 1
   frete = IF((TOTVAL+TOTBCH)<FREMIN,2,1)
   frete = IF(TIP_CLIE_P="04",2,FRETE)
   FRETE = IF(NFDTRANS="SEDEX",1,FRETE)
   CID_P = CLCIDADE10
   FRETE = IF(CID_P="SAO PAULO".OR.CID_P="SANTO ANDRE".OR.CID_P="SAO BERNARDO DO CAMPO".OR.CID_P="SAO CAETANO DO SUL".OR.CID_P="MAUA".OR.CID_P="RIBEIRAO PIRES".OR.CID_P="DIADEMA",1,FRETE)
ENDIF

If NFUF == "MG"
   frete = 1
EndIf

IF SUBSTR(NFTAB,3,1) = "B"
  @ L,082 SAY "1"
ELSEIF SUBSTR(NFTAB,3,1) = "A"
  @ L,082 SAY "1"
ELSE
  @ L,082 SAY frete PICTURE "9"
ENDIF

@ L,110 SAY NFCGCTRANS
L = L + 2
@ L,004 SAY NFETRANS
@ L,068 SAY NFCTRANS
@ L,104 SAY NFUFTRANS
@ L,110 SAY NFIETRANS
L = L + 2
SOMCXS [AA] = (CXSIGUAL[AA] / 220) + (CXSDIFE[AA]  / 100) + (LTSSOMA[AA]  / 45)
@ L,010 say volu(SOMCXS[AA]) picture '9999'
SELE NFSN010
IF NFNUMNOT10 != NUMNOT[AA]
   GO TOP
   DO WHILE NFNUMNOT10 != NUMNOT[AA]
   SKIP
   ENDDO
ENDIF
REPLACE NFVOLUME10 WITH volu(SOMCXS[AA])
@ L,032 say 'VOLUME'
@ L,097 say (NFPESO[AA] / 1000) picture '9,999.999'
@ L,107 say 'Kg'
@ L,123 say (NFPESO[AA] / 1000) picture '9,999.999'
@ L,133 say 'Kg'
L = L + 3
* @ L,045 SAY '2106900299'
L = L + 1
* @ L,045 SAY '0403100100'
L = L + 3
*@ L,025 SAY '2101200101'
@ L,045 SAY UNID [AA] * 2 PICTURE "9999"
*L = L + 5
*@ L,128 SAY NOTA_P
L = L + 7
NEXT
set device  to screen
set console on
return



*--- ROTINAS DE DESDOBRAMENTO

*--- ROTINA DE DESDOBRAMENTO DA CONDICAO 2 ---*

procedure ROTNCOND2
NFDESDB1[DESD_NOT] = str(NFATUAL,5) + 'A'
NFDESDB2[DESD_NOT] = str(NFATUAL,5) + 'B'
NFDESDB3[DESD_NOT] = space(6)
CALCOND  = ((VALNOT[DESD_NOT] - DESNOT[DESD_NOT]) / 2)
NFVALDB1[DESD_NOT] = CALCOND
NFVALDB2[DESD_NOT] = (VALNOT[DESD_NOT] - DESNOT[DESD_NOT] - NFVALDB1[DESD_NOT])
NFVALDB3[DESD_NOT] = 0
NFDTVDB1 = NFDTEMI + val(NFCOND1)
NFDTVDB2 = NFDTEMI + val(NFCOND2)
NFDTVDB3 = ctod(' ')
return

*--- ROTINA DE DESDOBRAMENTO DA CONDICAO 3 ---*

procedure ROTNCOND3
NFDESDB1[DESD_NOT] = str(NFATUAL,5) + 'A'
NFDESDB2[DESD_NOT] = str(NFATUAL,5) + 'B'
NFDESDB3[DESD_NOT] = str(NFATUAL,5) + 'C'
CALCOND = ((VALNOT[DESD_NOT] - DESNOT[DESD_NOT]) / 3)
store CALCOND to NFVALDB1[DESD_NOT],NFVALDB2[DESD_NOT]
NFVALDB3[DESD_NOT] = (VALNOT[DESD_NOT] - DESNOT[DESD_NOT] - NFVALDB1[DESD_NOT])
NFVALDB3[DESD_NOT] = (NFVALDB3[DESD_NOT] - NFVALDB2[DESD_NOT])
NFDTVDB1 = NFDTEMI + val(NFCOND1)
NFDTVDB2 = NFDTEMI + val(NFCOND2)
NFDTVDB3 = NFDTEMI + val(NFCOND3)
return

*--- ROTINA DE MONTAGEM DA TELA - 1 ---*

FUNCTION NFSN_TELA1
SCROLL(04,02,20,78,0)
janela(04,02,20,78,.T.)
cabec('Ibrasmak','2000','Emiss„o de NOTAS FISCAIS (Distribuidor)')
@ 06,02 say 'Ã'
@ 06,78 say '´'
@ 06,03 say replicate('Ä',75)
@ 05,28 say 'EMISSŽO DE NOTAS FISCAIS'
@ 07,03 clear to 19,77

@ 07,04 say 'C.G.C.:                             Ped.:                      Vend.:'
@ 08,04 say 'Tab.  :       Bonif.:          Nat.Oper.:      Via Tran.:     Trans.:'
@ 09,04 say 'Banco :       Emitir Lote:                    Condi‡„o de Pgto.:   ³  ³'

@ 10,03 say 'úúúúúúúúúúúúúúúúúúúúúúúúúúúúúúDADOS DO PEDIDOúúúúúúúúúúúúúúúúúúúúúúúúúúúúúú'
@ 11,04 say 'Prod.  Qtd.       Dif.      Lote    ú Prod.  Qtd.       Dif.      Lote'

for ptel = 12 to 19
    @ ptel,40 say 'ú'
next

 * C.G.C.: 9999999999999999            Ped.: 9999                 Vend.: 999 *
 * Tab.  : 999   Bonif.: 9999     Nat.Oper.: 9    Via Tran.: 9   Trans.: 99  *
 * Banco : 999   Emitir Lote: 9                  Condi‡„o de Pgto.: 99³99³99 *
 *úúúúúúúúúúúúúúúúúúúúúúúúúúúúúúDADOS DO PEDIDOúúúúúúúúúúúúúúúúúúúúúúúúúúúúúú*
 * Prod.  Qtd.       Dif.      Lote    ú Prod.  Qtd.       Dif.      Lote    *
 * xxxxxx 999999.999 999999.99 9999999 ú xxxxxx 999999.999 999999.99 9999999 *

@ 23,01 clear to 23,78



procedure NFN1_OBS1
mens(23,0,.T.,'Linha de observa‡„o da Nota... Tecle algo.')
@ 23,02 clear to 23,78
@ 23,07 get NFOBS1 picture '@!'
read

procedure NFN1_OBS2
mens(23,0,.T.,'1¦ Linha de observa‡„o da Nota... Tecle algo.')
@ 23,02 clear to 23,78
@ 23,07 get NFOBS picture '@!'
read
mens(23,0,.T.,'2¦ Linha de observa‡„o da Nota... Tecle algo.')
@ 23,02 clear to 23,78
@ 23,07 get NFOBS1 picture '@! '
read
return


function pos_nfsn
if SUICID = 0
   SUICID = 1
   L = 2
   RESP   = 'N'
   VEZ    = 1
   do while RESP = 'N'
      verimp()
      *Set Print On
      *Set Printer To "Fla.txt"
      Set Device To Printer

      set console off
      @ L,000 SAY CHR(15)
      @ L,088 say 'X'
      set device  to screen
      set console on
      set cursor on
      @ 23,01 clear to 23,78
      @ 23,25 say 'Posi‡„o est  correta ? <S/N> ' get RESP picture '@! ' valid RESP $('SN')
      read
      set cursor off
   enddo

   Set Device  To Printer
endif
