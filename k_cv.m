function metrics = k_cv(trainer,instances,target,k,repeat)
    % k-fold Cross-Validation
    % metrics is a cell array 
    % trainer is the training function
    % instancess is the ORIGINAL dataset [row is instance, column is instances]
    % k is the fold

    % the instances and target must have the same number of rows
    assert(size(instances,1)==size(target,1));
    % k and repeat must be integer 
    assert(~mod(k,1));
    assert(~mod(repeat,1));


    % create the index to be extracted
    nrow = size(instances,1);



    metrics = classperf(target);
    for rep = 1:repeat
        indices = crossvalind('Kfold',nrow,k);
        for i = 1:k
            test_index = (indices == 1i);
            train_index = ~test_index;
            test_instances = instances(test_index,:);
            train_instances = instances(train_index,:);
            test_target = target(test_index,:);
            train_target = target(train_index,:);

            % train and predict
            model = trainer(train_instances,train_target);
            predicted_class = classifier(model,test_instances);

            classperf(metrics,predicted_class,test_target); % classperf(CP, classout, testidx)
        end
    end
end


