% 强化学习
cc
rng('default');  
env=one_dimensional_env(6,0.05);
one_dimensional_rl=rl_q_table(env.len,env.actions,0.9,0.1,0.9);
pause(2)
for episode =1:env.max_episodes
    is_terminated = 0;
    env = env.reset();
    env.render();
    while ~is_terminated
        A = one_dimensional_rl.choose_action(env.agent);
        env = env.step(A);  % 采取动作获得状态和奖励
        q_predict = one_dimensional_rl.q_table(env.agent, A);
        if env.done ~= 1
            q_target = env.reward + one_dimensional_rl.gamma * max(one_dimensional_rl.q_table(env.observation, :));  % 没有结束
        else
            q_target = env.reward;  % 一局结束了
            is_terminated = 1;  % 更新标记
        end
        one_dimensional_rl=one_dimensional_rl.update_q_table(env.agent, A,q_predict,q_target);  % 更新
%         disp(one_dimensional_rl.q_table)
        env.agent=env.observation;
        env.render();
    end
end
