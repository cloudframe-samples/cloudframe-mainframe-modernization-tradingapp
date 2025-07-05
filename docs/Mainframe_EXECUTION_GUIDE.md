
# 🛠️ Execution Guide: Running TradingApp on IBM Mainframe

This guide outlines how to configure and run the **TradingApp** on an IBM mainframe environment after all artifacts have been deployed.

---

## ✅ Step 1: Configure the `MAC1` REXX File

1. Edit the `MAC1` REXX script located in your CNTL dataset:
   ```
   USRHLQ.TRADING.CNTL(MAC1)
   ```
2. Replace all instances of `USRHLQ` with your desired HLQ using the command:
   ```
   C ALL USRHLQ <Your HLQ>
   ```
   Update dataset references:
   - `USRHLQ.TRADING.CNTL`
   - `USRHLQ.TRADING.SETUP.JCL`
   - `USRHLQ.TRADING.RUN.JCL`
   - `USRHLQ.TRADING.RUN.PROC`
   - `USRHLQ.TRADING.CARD`

3. Update REXX replacement variables:
   ```text
   <USRHLQ>    → HLQ of your choice
   <SQLID>     → your_sql_id
   <DB2HLQ>    → your DB2 HLQ
   <DB2PLAN>   → your plan
   <DB2DBID>   → your DB ID
   <DB2SSID>   → your subsystem ID
   <DB2RUN>    → your runlib
   <PLANNAME>  → your plan name
   ```

4. Save and execute the REXX. It will apply all updates to the referenced datasets.

---

## ✅ Step 2: Create DB2 Artifacts

- Run `DB2CRE` JCL from your CNTL dataset to create:
  - Storage group
  - Database
  - Tablespaces
  - Tables
  - Indexes

Ensure all steps complete successfully.

---

## ✅ Step 3: Compile COBOL Programs

- Submit `COMPILE` JCL to compile all necessary COBOL programs.

### 📌 Pre-Requisites

Ensure these datasets exist (replace `USRHLQ` accordingly):

| Dataset Name                  | Attributes             |
|------------------------------|------------------------|
| `USRHLQ.TRADING.LISTING`     | PO-E, FBA, LRECL=133   |
| `USRHLQ.TRADING.LOADLIB`     | PO-E, U, BLKSIZE=0     |
| `USRHLQ.TRADING.DBRMLIB`     | PO-E, FB, LRECL=80     |
| `USRHLQ.TRADING.SYSDEBUG`    | PO, FB, LRECL=1024     |

These datasets store listings, load modules, DBRMs, and debug info.

### ✅ Validation Checklist
- ✅ All programs compiled without errors
- ✅ Listings, load modules, and DBRMs are properly created

---

## ✅ Step 4: Bind DBRMs

- Run `DB2BIND` JCL to bind DB2 programs to your plan.
- Confirm all packages are bound successfully without SQLCODE errors.

---

## ✅ Step 5: Launch Baseline REXX (Trading Flow Driver)

- Execute the `BASELINE` REXX program from the CNTL dataset.

### 🖥️ UI Interaction

1. An interactive screen will appear.
2. Type `RUN` in the command line and press **Enter** to begin.

### 🧠 Color Legend:
- 🔵 Blue: Job ready
- 🟡 Yellow: Running
- 🟢 Green: Success
- 🔴 Red: Failure

---

## ✅ Step 6: Run Setup and Batch Phases

- The **Setup Phase** begins (loads data into DB2).
- Press **Enter** to:
  1. Start the **Acceptance Phase**
  2. Then the **Settlement Phase**
  3. Then **EXECRPT** generation
  4. Then **TRADERPT** generation

---

## ✅ Step 7: Generate and View Reports

The EXECRPT job will produce:
- Runtime statistics
- Trade summary report
- Exceptions report
- Customer-wise detailed report (TRADEPRT)

Once done, output datasets are displayed.

---

## ✅ Step 8: Review Output Reports

In the file explorer panel:
- Type `/` next to any output file to open and view its content.

### 📂 Generated Output Files

- `USRHLQ.TRADING.EXCEPTION.REPORT.MF`
- `USRHLQ.TRADING.REPORDER.REPORT.MF`
- `USRHLQ.TRADING.RUNLOG.REPORT.MF`
- `USRHLQ.TRADING.SUMMARY.REPORT.MF`

You may refer to the sample reports in the `OUTPUT` folder to validate results.

