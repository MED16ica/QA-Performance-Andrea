@echo on
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set timestamp=%MM%%DD%%YY%-%HH%%Min%%Sec%

E:
CD E:\JMETER\apache-jmeter-5.2.1\bin
Start jmeter -n -t "E:\Performance Scripts\NETD\091420GrpEnrollment.jmx" -l "E:\Performance Analysis\NETD\GrpEnroll%timestamp%.csv" -e -o "E:\Performance HTML\NETD\GrpEnroll%timestamp%"
