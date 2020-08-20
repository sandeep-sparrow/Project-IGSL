      ******************************************************************
      * Author: SANDEEP PRAJAPATI
      * Date: 07-05-2020
      * Purpose: THIS IS ILLUSTRATION OF INTERACTIVE COBOL PROGRAM
      *        : WHICH ACCEPTS VALUES FROM USER TO CALCULATE DEDUCTIONS
      *        : FOR FINAL VALUE.
      ******************************************************************
       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID. CALC1002.
      *
       ENVIRONMENT DIVISION.
      *
       INPUT-OUTPUT SECTION.
      *
       DATA DIVISION.
      *
       FILE SECTION.
      *
       WORKING-STORAGE SECTION.
      *
       01  USER-ENTERED.
           05 MTM-AMOUNT              PIC 9(08)V99.
           05 BUY-AMOUNT              PIC 9(08)V99.
      *
       01  IGSL-DEDUCTIONS.
           05 BROKERAGE-CHARGE        PIC 9(06)V99.
           05 TRANSACTION-CHARGE      PIC 9(06)V99.
           05 STT-CHARGE              PIC 9(06)V99.
           05 STAMP-DUTY              PIC 9(01)          VALUE 5.
           05 GST-CHARGE              PIC 9(06)V99.
      *
       01  WORK-FIELD.
           05 TOTAL-CHARGE            PIC 9(06)V99.
           05 TOTAL-CHARGE-EDITED     PIC Z,ZZZ,ZZZ.99.
           05 MTM-AMOUNT-EDITED       PIC Z,ZZZ,ZZZ.99.
           05 MTM-AMOUNT-E            PIC Z,ZZZ,ZZZ.99.
           05 BUY-AMOUNT-EDITED       PIC Z,ZZZ,ZZZ.99.
      *
        01  SYSTEM-DATE-AND-TIME.
            05  CURRENT-DATE.
                10  CURRENT-YEAR           PIC 9(2).
                10  CURRENT-MONTH          PIC 9(2).
                10  CURRENT-DAY            PIC 9(2).
            05  CURRENT-TIME.
                10  CURRENT-HOUR           PIC 9(2).
                10  CURRENT-MINUTE         PIC 9(2).
                10  CURRENT-SECOND         PIC 9(2).
                10  CURRENT-HNDSEC         PIC 9(2).
      *
       PROCEDURE DIVISION.
      *
       001-CALCULATE-TOTAL-DEDUCTION.
      *
            DISPLAY "-------------------------------------------------".
            DISPLAY "******** INVENUTRE GROWTH AND SECURITIES ********".
            DISPLAY "-------------------------------------------------".
            DISPLAY "HELLO WORLD! - THIS PROGRAM CALCULATES DEDUCTIONS".
      *
            ACCEPT CURRENT-DATE FROM DATE.
            ACCEPT CURRENT-TIME FROM TIME.
      *
             PERFORM 100-CALCULATE-TOTAL-DEDUCTION
      *
            DISPLAY "END OF SESSION".
      *
            STOP RUN.
      *
        100-CALCULATE-TOTAL-DEDUCTION.
      *
            PERFORM 110-GET-USER-VALUES
            PERFORM 120-CALCULATE-NXT
      *
            MOVE TOTAL-CHARGE TO TOTAL-CHARGE-EDITED
            MOVE MTM-AMOUNT   TO MTM-AMOUNT-EDITED
            MOVE BUY-AMOUNT   TO BUY-AMOUNT-EDITED
      *
            DISPLAY '************INTRADAY REPORT**********************'
            DISPLAY 'CALC1002 STARTED DATE = ' CURRENT-MONTH '/'
                   CURRENT-DAY '/' CURRENT-YEAR  '  (mm/dd/yy)'
            DISPLAY '             TIME = ' CURRENT-HOUR ':'
                   CURRENT-MINUTE ':' CURRENT-SECOND
            DISPLAY '************REPORT START*************************'
            DISPLAY "TOTAL BUY AMOUNT           = " BUY-AMOUNT-EDITED
            DISPLAY "MTM AMOUNT                 = " MTM-AMOUNT-E
            DISPLAY "TOTAL CHARGES              = " TOTAL-CHARGE-EDITED
            DISPLAY "MTM AMOUNT AFTER DEDUCTION = " MTM-AMOUNT-EDITED
            DISPLAY '************REPORT END***************************'.
      *
       110-GET-USER-VALUES.
      *
               ACCEPT MTM-AMOUNT.
               MOVE MTM-AMOUNT TO MTM-AMOUNT-E.
               ACCEPT BUY-AMOUNT.
      *
       120-CALCULATE-NXT.
      *
               COMPUTE BROKERAGE-CHARGE = BUY-AMOUNT * 0.0005.
               COMPUTE TRANSACTION-CHARGE = BUY-AMOUNT * 0.0000305.
               COMPUTE STT-CHARGE = BUY-AMOUNT * 0.000126.
               COMPUTE GST-CHARGE =
                   (BROKERAGE-CHARGE + TRANSACTION-CHARGE) * 0.18.
               COMPUTE TOTAL-CHARGE =
                BROKERAGE-CHARGE + TRANSACTION-CHARGE + STT-CHARGE +
                STAMP-DUTY + GST-CHARGE.
               COMPUTE MTM-AMOUNT = MTM-AMOUNT - TOTAL-CHARGE.
      *
       END PROGRAM CALC1002.
