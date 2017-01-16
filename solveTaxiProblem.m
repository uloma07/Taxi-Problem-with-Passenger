function [initTaxi,initPsgr,initDrop,policy1,policy2,cummulativeValues1,cummulativeValues2,totalReward,finalepisode] = solveTaxiProblem(episodes,patience,algorithm,epsilon,discount,learningRate,initReward,passenger,goal)
%function to solve the taxi problem using Q-learning or SARSA algorithms
%   episodes (1x1) Number of episodes to run the algorithm
%   patience (1x1) Number of restarts per episode or How long the passenger
%   waits before quitting an episode
%   algorithm (string) Algorithm to use. May be QL or SARSA

    clc;
    initTaxi = 24;%randi([1, 25]); %Taxi is uniformly randomly in any of the 25 grid squares
    fixedLocations = [1,4,21,25,initTaxi];
    if nargin < 8
        initPsgr = fixedLocations(randi([1, 5])); %passengerLocation is uniformly randomly in one of the 5 passenger states
    else
        initPsgr=passenger;
    end
    
    if nargin < 9
        initDrop = fixedLocations(randi([1, 4])); %dropoffLocation is uniformly randomly one of the 4 drop-off locations
    else
        initDrop = goal;
    end  
    wait = 5;
    rewards1 = initReward*ones(25,5); %initialise average reward gotten when each action is taken these are the Q values
    rewards2 = initReward*ones(25,5);
    eps = epsilon; % probability of exploration epsillon
    discountFactor = discount; %discount factor
    lr = learningRate; % learning rate
    counts1 =  zeros(25,5); %count of actions at each state or gridlocation 
    counts2 =  zeros(25,5);
    cummulativeValues1 = zeros(episodes,1);
    cummulativeValues2 = zeros(episodes,1);
    totalReward = zeros(episodes,1);
    totalAvgReward = zeros(episodes,1);   
    
    for episode=0:1:episodes-1
        taxiLocation = initTaxi;
        dropOffLocation = initDrop;
        psgrlocation = initPsgr;
        passengerDropped = false;
        passengerPicked = false;
        timeLimit = patience;
        pickupSteps = 0;    
        e = eps*(.05^episode);
        tr=0;   
    
        while passengerDropped == false && timeLimit > 0 
            oldLocation = taxiLocation;
            Qnew = 0;
            if ~passengerPicked  % if passenger is not picked          
                action = chooseArm(e, rewards1(oldLocation,:)); %returns the index of the arm chosen
                count = counts1(oldLocation,action); %gets the number of times this arm has been used
                Q = rewards1(oldLocation,action); %get the current Q state-action value

                [reward,taxiLocation,pickupSteps,psgrlocation,passengerPicked,passengerDropped] = getReward(action,oldLocation,pickupSteps,psgrlocation,passengerPicked,passengerDropped,dropOffLocation);

                if passengerPicked
                    sprintf('passenger picked, episode: %d',episode);            
                end           
                
                nextOptimum = max(rewards1(taxiLocation,:));
                
                if(strcmp(algorithm,'QL'))
                    Qnew = QLearning(Q,reward,discountFactor,nextOptimum,lr);
                elseif(strcmp(algorithm,'SARSA'))
                    newaction = chooseArm(e, rewards1(taxiLocation,:));
                    nextQ = rewards1(taxiLocation,newaction);
                    Qnew = SARSA(Q,reward,discountFactor,nextQ,lr); 
                else
                    sprintf('Unrecognised Algorithm: %s',algorithm); 
                    return;
                end                
                rewards1(oldLocation,action) = Qnew;
                counts1(oldLocation,action)= count + 1;    
                
            else
                action = chooseArm(e, rewards2(oldLocation,:)); %returns the index of the arm chosen
                count = counts2(oldLocation,action); %gets the number of times this arm has been used
                Q = rewards2(oldLocation,action); %get the current Q state-action value
                act = action;
                if action == 5
                    act=6;
                end
                [reward,taxiLocation,pickupSteps,psgrlocation,passengerPicked,passengerDropped] = getReward(act,oldLocation,pickupSteps,psgrlocation,passengerPicked,passengerDropped,dropOffLocation);

                if passengerDropped
                    sprintf('passenger dropped, episode: %d',episode);            
                end          
                
                nextOptimum = max(rewards2(taxiLocation,:));
                
                if(strcmp(algorithm,'QL'))
                    Qnew = QLearning(Q,reward,discountFactor,nextOptimum,lr);
                elseif(strcmp(algorithm,'SARSA'))
                    newaction = chooseArm(e, rewards2(taxiLocation,:));
                    nextQ = rewards2(taxiLocation,newaction);
                    Qnew = SARSA(Q,reward,discountFactor,nextQ,lr);
                else
                    sprintf('Unrecognised Algorithm: %s',algorithm);
                    return;
                end                
                rewards2(oldLocation,action) = Qnew;
                counts2(oldLocation,action)= count + 1; 
            end
            timeLimit = timeLimit - 1; %reduce time limit
            tr = tr+reward;
        end                    
        cummreward1 = sum(rewards1,2);
        cummulativeValues1(episode+1,1) = mean(cummreward1);
        cummreward2 = sum(rewards2,2);
        cummulativeValues2(episode+1,1) = mean(cummreward2);
        totalReward(episode+1,1)=tr;
        %totalAvgReward(episode+1,1)=tr/(patience-timeLimit);
        threshold = abs(2*0.00001*discountFactor/(1-discountFactor));
        
        if episode>0 && abs(cummulativeValues1(episode+1,1) - cummulativeValues1(episode,1)) <= threshold && abs(cummulativeValues2(episode+1,1) - cummulativeValues2(episode,1)) <= threshold
            wait = wait - 1;
            threshold
            episode
            if wait == 0
                finalepisode = episode+1;
                break;
            end
        end
        finalepisode = episode+1;
    end

[~,policy1] = max(rewards1,[],2);  
[~,policy2] = max(rewards2,[],2); 
    
end

function Qnew = QLearning(Q,reward,discountFactor,nextOptimum,lr)
    Qnew = Q + lr *(reward + ((discountFactor*nextOptimum)- Q));
end

function Qnew = SARSA(Q,reward,discountFactor,nextQ,lr)    
    Qnew = Q + lr *(reward + ((discountFactor*nextQ)- Q));
end

