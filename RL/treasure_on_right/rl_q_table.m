classdef rl_q_table
    % 强化学习逻辑
    properties
        q_table
        actions
        epsilon
        alpha
        gamma
    end
    methods
        function obj = rl_q_table(n_states,actions,epsilon,alpha,gamma)
            % 初始化
            obj.actions=actions;
            obj.epsilon=epsilon;
            obj.alpha=alpha;
            obj.gamma=gamma;
            obj.q_table = zeros(n_states, length(actions));
        end
        function obj=update_q_table(obj,agent, A,q_predict,q_target)
            % 更新QLearning table
             obj.q_table(agent, A) = obj.q_table(agent, A) + obj.alpha * (q_target - q_predict);
        end
        
        function action_name = choose_action(obj,state)
            % 选择一个动作
            state_actions = obj.q_table(state, :) ;% 取出这一步的概率
            if (rand() > obj.epsilon) || (all(state_actions == 0))
                % 初始时随机选择
                action_name = obj.actions(randi(2));
            else  % 贪心选择
                [~,I] = max(state_actions);
                action_name = obj.actions(I);
                % 选概率大的
            end
        end
    end
end

