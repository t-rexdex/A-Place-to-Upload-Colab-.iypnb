opts = detectImportOptions('data_multi_var.csv'); 
opts.SelectedVariableNames = {'Age', 'EstimatedSalary', 'Purchased'};
data = readtable('data_multi_var.csv', opts)

stand_age = (data.Age - mean(data.Age))/std(data.Age);
data.Age = stand_age;
stand_estimted_salary = (data.EstimatedSalary - mean(data.EstimatedSalary))/std(data.EstimatedSalary);
data.EstimatedSalary = stand_estimted_salary;

classification_model = fitctree(data,'Purchased~Age+EstimatedSalary');
cv = cvpartition(classification_model.NumObservations, 'HoldOut', 0.2);
cross_validated_model = crossval(classification_model,'cvpartition',cv);

Predictions = predict(cross_validated_model.Trained{1},data(test(cv),1:end-1));
view(cross_validated_model.Trained{1},'mode','graph')