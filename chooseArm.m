function action = chooseArm(e,rewards)
    % e is the probability for exploration
    randNum = rand(1,1); %generate random number
    if randNum <= e 
        %explore
        len = size(rewards,1);
        action = randi([1,len]);
    else
        %exploit
        [themax action]= max(rewards);
        %actionoption = find(max(rewards) == rewards);
        %action = actionoption(randi(numel(actionoption)));        
    end    
end