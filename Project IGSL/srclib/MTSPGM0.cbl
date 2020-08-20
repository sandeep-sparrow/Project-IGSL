       IDENTIFICATION DIVISION.
       PROGRAM-ID. MTSPGM0.
      *
      *************************************************
      *  A SAMPLE COBOL/CICS PROGRAM                  *
      *  PROJECT IGSL                                 *
      *  AUTHOR        : SANDEEP PRAJAPATI            *
      *  DATE-WRITTEN  : 2020-AUGUST                  *
      *************************************************
      *
       ENVIRONMENT DIVISION.
      *
       DATA DIVISION.
      *
       WORKING-STORAGE SECTION.
      *
       01 WS-COMMAREA                 PIC X(40).
      *
       01  IGSL-DEDUCTIONS.
           05 BROKERAGE-CHARGE        PIC 9(06)V99.
           05 TRANSACTION-CHARGE      PIC 9(06)V99.
           05 STT-CHARGE              PIC 9(06)V99.
           05 STAMP-DUTY              PIC 9(01)          VALUE 5.
           05 GST-CHARGE              PIC 9(06)V99.
      *
       01  WORK-FIELD.
           05 MTM-AMOUNT              PIC 9(08)V99.
           05 BUY-AMOUNT              PIC 9(08)V99.
           05 TOTAL-CHARGE            PIC 9(06)V99.
           05 TOTAL-CHARGE-EDITED     PIC Z,ZZZ,ZZZ.99.
           05 MTM-AMOUNT-EDITED       PIC Z,ZZZ,ZZZ.99.
           05 MTM-AMOUNT-E            PIC Z,ZZZ,ZZZ.99.
           05 BUY-AMOUNT-EDITED       PIC Z,ZZZ,ZZZ.99.
      *
        01  SYSTEM-DATE-AND-TIME.
            05  CURRENT-DATE.
                10  CURRENT-YEAR      PIC 9(2).
                10  CURRENT-MONTH     PIC 9(2).
                10  CURRENT-DAY       PIC 9(2).
        01  WS-CURRENT-DATE           PIC X(10).
      *
      *COPYBOOKS
      * Symbolic map for employee Inquery
           COPY MTSMPS0.
      *DFH Attention Identifies Copybook
           COPY DFHAID.
      *DFH BMS Communication Area copybook
           COPY DFHBMSCA.
      *
       LINKAGE SECTION.
      *
       01 DFHCOMMAREA            PIC X(40).
      *
       PROCEDURE DIVISION.
      *
           IF EIBCALEN > ZERO
             MOVE DFHCOMMAREA    TO WS-COMMAREA
           END-IF.
      *
      *
           EVALUATE TRUE
      *
             WHEN EIBCALEN = ZERO
               MOVE LOW-VALUES   TO  IGSLSTKO
               PERFORM SEND-MAP
      *
             WHEN EIBAID = DFHCLEAR
               MOVE LOW-VALUES   TO  IGSLSTKO
               PERFORM SEND-MAP
      *
             WHEN EIBAID = DFHPA1 OR DFHPA2 OR DFHPA3
               CONTINUE
      *
             WHEN EIBAID = DFHPF3
               MOVE LOW-VALUES TO  IGSLSTKO
               MOVE "BYE, PRESS CLEAR KEY TO ENTER A TRANSACTION ID"
                    TO MESSAGEO
               PERFORM SEND-MAP-DATA
      *
               EXEC CICS
                 RETURN
               END-EXEC
      *
             WHEN EIBAID = DFHENTER
               PERFORM PROCESS-PARA
      *
             WHEN OTHER
               MOVE LOW-VALUES TO IGSLSTKO
               MOVE "INVALID KEY PRESSED" TO MESSAGEO
               PERFORM SEND-MAP-DATA
      *
           END-EVALUATE.
      *
           EXEC CICS
              RETURN TRANSID('MTS0')
              COMMAREA (WS-COMMAREA)
           END-EXEC.
      *
       PROCESS-PARA.
      *
           PERFORM RECEIVE-MAP
      *
           ACCEPT CURRENT-DATE   FROM DATE.

      *
           STRING CURRENT-DAY,
                  '/',
                  CURRENT-MONTH,
                  '/',
                  CURRENT-YEAR DELIMITED BY SIZE
                  INTO WS-CURRENT-DATE
           END-STRING.
      *
           MOVE BUYAMTI      TO BUY-AMOUNT
           MOVE MTMAMTI      TO MTM-AMOUNT
      *
               COMPUTE BROKERAGE-CHARGE = BUY-AMOUNT * 0.0005
               COMPUTE TRANSACTION-CHARGE = BUY-AMOUNT * 0.0000305
               COMPUTE STT-CHARGE = BUY-AMOUNT * 0.000126
               COMPUTE GST-CHARGE =
                   (BROKERAGE-CHARGE + TRANSACTION-CHARGE) * 0.18
               COMPUTE TOTAL-CHARGE =
                BROKERAGE-CHARGE + TRANSACTION-CHARGE + STT-CHARGE +
                STAMP-DUTY + GST-CHARGE
               COMPUTE MTM-AMOUNT = MTM-AMOUNT - TOTAL-CHARGE
      *
           MOVE TOTAL-CHARGE        TO TOTAL-CHARGE-EDITED
           MOVE MTM-AMOUNT          TO MTM-AMOUNT-EDITED
      *
           MOVE TOTAL-CHARGE-EDITED TO TCHRGO
           MOVE MTM-AMOUNT-EDITED   TO FNAMTO
           MOVE WS-CURRENT-DATE     TO CRDATEO
           MOVE "OK!"               TO MESSAGEO
      *
           PERFORM SEND-MAP-DATA.
      *
           EXIT.
      *
       SEND-MAP.
           EXEC CICS SEND
              MAP    ('IGSLSTK')
              MAPSET ('MTSMPS0')
              FROM   (IGSLSTKO)
              ERASE
           END-EXEC.
      *
           EXIT.
      *
       SEND-MAP-DATA.
           EXEC CICS SEND
              MAP    ('IGSLSTK')
              MAPSET ('MTSMPS0')
              FROM   (IGSLSTKO)
              DATAONLY
           END-EXEC.
      *
           EXIT.
      *
       RECEIVE-MAP.
            EXEC CICS RECEIVE
              MAP    ('IGSLSTK')
              MAPSET ('MTSMPS0')
              INTO   (IGSLSTKI)
            END-EXEC.
      *
           EXIT.
      *
