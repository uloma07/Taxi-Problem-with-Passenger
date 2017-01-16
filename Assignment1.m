%%
%%Question1
%initialise 5 random scenarios and plot algorithm behaviour for Q-Learning

clear;
clc;
count =1;
convergeq= [0;0;0];
converges= [0;0;0];
for i = 0.9
    [initTaxi,initPsgr,initDrop,policy1,policy2,cummulativeValues1,cummulativeValues2,totalReward,finalEpisode] = solveTaxiProblem(1000,100,'QL',0.1,i,0.8,1,1,25);
    %figure(i)
    %plot(cummulativeValues1(1:100,:),'g')    
    %hold on
    %plot(cummulativeValues2(1:100,:),'b')
    %legend('Pick','Drop','Location','northoutside','Orientation','horizontal')
    %hold off
    %str = sprintf('Average Reward over 100 episodes collected by agent using SARSA \n Using P=%d, T=%d, G=%d',initPsgr,initTaxi,initDrop);
    %title(str)
    %xlabel('Episodes')
    %ylabel('Average Reward')
    [initTaxis,initPsgrs,initDrops,policy1s,policy2s,cummulativeValues1s,cummulativeValues2s,totalRewards,finalEpisodes] = solveTaxiProblem(1000,100,'SARSA',0.1,0.95,0.8,i,1,25);
    
    
    figure(count)
    plot(cummulativeValues1(1:finalEpisode),'g')    
    hold on
    plot(cummulativeValues2(1:finalEpisode),'b')
    legend('pick','drop','Location','northoutside','Orientation','horizontal')
    hold off
    str = sprintf('Comparison of Discount rate =0.9 with QLearning  \n Using P=%d, T=%d, G=%d',initPsgr,initTaxi,initDrop);
    title(str)
    xlabel('Episodes')
    ylabel('Average Reward')
        
    figure(count+1)
    plot(cummulativeValues1s(1:finalEpisodes),'g')    
    hold on
    plot(cummulativeValues2s(1:finalEpisodes),'b')
    legend('pick','drop','Location','northoutside','Orientation','horizontal')
    hold off
    str = sprintf('Comparison of Discount rate =0.9 with SARSA \n Using P=%d, T=%d, G=%d',initPsgr,initTaxi,initDrop);
    title(str)
    xlabel('Episodes')
    ylabel('Average Reward')
    
end

%%

%Question 2
%fix passenger location and goal then solve.

clear;
clc;
episodes = 10000;
[initTaxi,initPsgr,initDrop,policy1,policy2,cummulativeValues1,cummulativeValues2]=solveTaxiProblem(episodes,200,'QL',1,21);
figure(i)
plot(cummulativeValues1,'g')
hold on
plot(cummulativeValues2,'b')
hold off

title('2-D Line Plot')
xlabel('Episodes')
ylabel('Average Reward')

%%