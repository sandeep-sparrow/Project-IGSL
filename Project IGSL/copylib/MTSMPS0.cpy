       01  IGSLSTKI.
           02  FILLER PIC X(12).
           02  CRDATEL    COMP  PIC  S9(4).
           02  CRDATEF    PICTURE X.
           02  FILLER REDEFINES CRDATEF.
             03 CRDATEA    PICTURE X.
           02  FILLER   PICTURE X(2).
           02  CRDATEI  PIC X(10).
           02  MTMAMTL    COMP  PIC  S9(4).
           02  MTMAMTF    PICTURE X.
           02  FILLER REDEFINES MTMAMTF.
             03 MTMAMTA    PICTURE X.
           02  FILLER   PICTURE X(2).
           02  MTMAMTI  PIC X(10).
           02  BUYAMTL    COMP  PIC  S9(4).
           02  BUYAMTF    PICTURE X.
           02  FILLER REDEFINES BUYAMTF.
             03 BUYAMTA    PICTURE X.
           02  FILLER   PICTURE X(2).
           02  BUYAMTI  PIC X(10).
           02  TCHRGL    COMP  PIC  S9(4).
           02  TCHRGF    PICTURE X.
           02  FILLER REDEFINES TCHRGF.
             03 TCHRGA    PICTURE X.
           02  FILLER   PICTURE X(2).
           02  TCHRGI  PIC X(20).
           02  FNAMTL    COMP  PIC  S9(4).
           02  FNAMTF    PICTURE X.
           02  FILLER REDEFINES FNAMTF.
             03 FNAMTA    PICTURE X.
           02  FILLER   PICTURE X(2).
           02  FNAMTI  PIC X(20).
           02  MESSAGEL    COMP  PIC  S9(4).
           02  MESSAGEF    PICTURE X.
           02  FILLER REDEFINES MESSAGEF.
             03 MESSAGEA    PICTURE X.
           02  FILLER   PICTURE X(2).
           02  MESSAGEI  PIC X(79).
           02  DUMMYL    COMP  PIC  S9(4).
           02  DUMMYF    PICTURE X.
           02  FILLER REDEFINES DUMMYF.
             03 DUMMYA    PICTURE X.
           02  FILLER   PICTURE X(2).
           02  DUMMYI  PIC X(1).
       01  IGSLSTKO REDEFINES IGSLSTKI.
           02  FILLER PIC X(12).
           02  FILLER PICTURE X(3).
           02  CRDATEC    PICTURE X.
           02  CRDATEH    PICTURE X.
           02  CRDATEO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  MTMAMTC    PICTURE X.
           02  MTMAMTH    PICTURE X.
           02  MTMAMTO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  BUYAMTC    PICTURE X.
           02  BUYAMTH    PICTURE X.
           02  BUYAMTO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  TCHRGC    PICTURE X.
           02  TCHRGH    PICTURE X.
           02  TCHRGO  PIC X(20).
           02  FILLER PICTURE X(3).
           02  FNAMTC    PICTURE X.
           02  FNAMTH    PICTURE X.
           02  FNAMTO  PIC X(20).
           02  FILLER PICTURE X(3).
           02  MESSAGEC    PICTURE X.
           02  MESSAGEH    PICTURE X.
           02  MESSAGEO  PIC X(79).
           02  FILLER PICTURE X(3).
           02  DUMMYC    PICTURE X.
           02  DUMMYH    PICTURE X.
           02  DUMMYO  PIC X(1).
