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
        function obj = rl_q_table(actions,epsilon,alpha,gamma)
            % 初始化
            obj.actions=actions;
            obj.epsilon=epsilon;
            obj.alpha=alpha;
            obj.gamma=gamma;
            obj.q_table = containers.Map();
        end
        function dump(obj)
            keySet = keys(obj.q_table);
            len=length(keySet);
            if len<=0
                return
            end
            disp('---------------------------')
            for i=1:len
                disp([keySet{i} ':' StrHelper.arr2str(obj.q_table(keySet{i}))])
            end
        end
        function table_ling=find_line(obj,state)
            agent_str = StrHelper.arr2str(state);
            if ~isKey(obj.q_table,agent_str)
                obj.q_table(agent_str) = zeros(1,length(obj.actions));
            end
            table_ling = obj.q_table(agent_str);
        end
        function obj=learn(obj,env, A)
            q_predict_arr = obj.find_line(env.agent);
            q_predict = q_predict_arr(A);
            if env.done ~= 1
                q_target = env.reward + obj.gamma * max(obj.find_line(env.observation));  % 没有结束
            else
                q_target = env.reward;  % 一局结束了
            end
            % 更新QLearning table
            table_line = obj.find_line(env.agent);
            table_line(A) = table_line(A) + obj.alpha * (q_target - q_predict);
            obj.q_table(StrHelper.arr2str(env.agent)) = table_line;
        end
        
        function action_name = choose_action(obj,state)
            % 选择一个动作
            state_actions = obj.find_line(state);% 取出这一步的概率
            if (rand() > obj.epsilon) || (all(state_actions == 0))
                % 初始时随机选择
                action_name = obj.actions(randi(length(obj.actions)));
            else  % 贪心选择
                [~,I] = max(state_actions);
                max_index = state_actions==state_actions(I);
                if sum(max_index)>1
                    action_name = obj.actions(max_index);
                    action_name = action_name(randi(length(action_name)));
                else
                action_name = obj.actions(I);
                end
                % 选概率大的
            end
        end
    end
end

