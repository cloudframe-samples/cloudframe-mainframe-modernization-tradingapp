**Batch Securities Trade Settlement Application**

# Application Overview

This application simulates International Securities trading activity using 10 currencies. It accepts, matches & settles Buy/Sell requests. The currencies used in this application are:

CAD - Canadian Dollar

CHF - Swiss Franc

CNY - Chinese Yuan Renminbi

EUR - Euro

GBX - British Pound

INR - Indian Rupee

JPY - Japanese Yen

KRW - Korean Won

MXN - Mexican Peso

USD - US Dollar

The application processes requests and updates the respective accounts once the trades are completed. The diagram below depicts the flow of jobs that will accomplish the task of processing the matching buy/sell requests and accepting the matched requests as the first phase shown within the pink box below. The second phase consists of the trading settlement jobs shown in the amber box. Finally, there are two report generation jobs, one of which produces the exception reports while the other one produces the trade report. These are represented within the green box.

It is essential that for each currency, the ACCP\* job is successfully completed before running the SETL\* job for that currency. 

![Batch Securities Trade Settlement Application ](images/image1.jpg)




**Acceptance Processing**

![](images/image2.jpg)

The acceptance stage of the processing of trade request consists of 10 jobs – one for each currency. These jobs execute the procedure TRDPROC, which is a common PROC that receives parameters from the JCL and executes the appropriate program. For all the acceptance jobs, the PROC executes TRDP000 which, in turn, calls MSTPB001 and MSTPB002.

**Settlement Processing**

![](images/image3.jpg)

As in the acceptance stage, the settlement stage also has 10 jobs corresponding to the 10 currencies being processed. These jobs call the same PROC as in the acceptance stage with different parameters based on which the program called is TRDPB001. This program, in turn, calls TRDPB002 and TRDPB003. TRDPB002 updates the securities account while TRDPB003 updates the money accounts.

**Reports Generation**

There are two jobs which produce reports based on the acceptance and settlement jobs above. The first one generates 3 reports. This job is EXECRPT and the reports are Run log, Summary report and Exception report.

![](images/image4.jpg)

And the other job is called TRADERPT and generates an order report.

![](images/image5.jpg)