classdef rl_q_table
    % ǿ��ѧϰ�߼�
    properties
        q_table
        actions
        epsilon
        alpha
        gamma
    end
    methods
        function obj = rl_q_table(n_states,actions,epsilon,alpha,gamma)
            % ��ʼ��
            obj.actions=actions;
            obj.epsilon=epsilon;
            obj.alpha=alpha;
            obj.gamma=gamma;
            obj.q_table = zeros(n_states, length(actions));
        end
        function obj=update_q_table(obj,agent, A,q_predict,q_target)
            % ����QLearning table
             obj.q_table(agent, A) = obj.q_table(agent, A) + obj.alpha * (q_target - q_predict);
        end
        
        function action_name = choose_action(obj,state)
            % ѡ��һ������
            state_actions = obj.q_table(state, :) ;% ȡ����һ���ĸ���
            if (rand() > obj.epsilon) || (all(state_actions == 0))
                % ��ʼʱ���ѡ��
                action_name = obj.actions(randi(2));
            else  % ̰��ѡ��
                [~,I] = max(state_actions);
                action_name = obj.actions(I);
                % ѡ���ʴ��
            end
        end
    end
end

