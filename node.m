classdef node 
    properties 
        % is this a leaf node
        is_leaf = 0; 
        % attribute to split over
        split_attribute = NaN; 
        % criterion to split [function handle]
        split_criterion = NaN;
        children= NaN;
    end
end