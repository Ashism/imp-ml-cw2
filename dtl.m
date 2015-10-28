function dtree = dtl(instances,feature,target)
    % 
    % instances is the training dataset
    % feature is the row vector of feature avaliable to use at this stage
    % target is the target of the instances
    [count , ~]  = hist(target,unique(target));
    if count == 1
        dtree = 
        return 
   

    
end