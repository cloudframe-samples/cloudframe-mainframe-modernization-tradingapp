//ACCPKRW  JOB (QA),'QA',CLASS=D,MSGCLASS=X,
//         COND=(8,LT)
//*
//PROCLIB  JCLLIB ORDER=CLOUDFRM.TRADING.BATCHDB2.RUN.PROC
//*
//*KRW Currency Trade Acceptance/Matching
//*
//ACCPKRW  EXEC TRDPROC,RUNPARM='ACCPKRW'
//SYSTSIN  DD DISP=SHR,DSN=CLOUDFRM.TRADING.BATCHDB2.CARD(ACCPKRW)
