%%%
clear 
clc 
close all


file = readtable('exam1and2.txt');
%data = array2table(file, 'VariableNames',{'x1','x2', 'Status'});
mdl = fitctree(file,'Var3~Var1+Var2');
cv = cvpartition(mdl.NumObservations,'HoldOut',0.3);
cvm = crossval(mdl,'cvpartition',cv);
predictions = predict(cvm.Trained{1},file(test(cv),1:end-1));
view(cvm.Trained{1},'mode','graph')
trueRes = table2array(file(test(cv),end));
per = 0;
for idx = 1:size(predictions,1)

    if predictions(idx,1) == trueRes(idx,1)
       per = per +1;  
    end


end



acc = (per/size(trueRes,1))*100
