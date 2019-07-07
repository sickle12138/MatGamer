% 强化学习
ccc
rng('default');  
env=two_dimensional_env(4,4,0.01);
two_dimensional_rl=rl_q_table(env.actions,0.9,0.1,0.9);
% pause(2)
for episode =1:env.max_episodes
    env = env.reset();
    env.render();
    while 1
        A = two_dimensional_rl.choose_action(env.agent);
        env = env.step(A);  % 采取动作获得状态和奖励
        two_dimensional_rl=two_dimensional_rl.learn(env, A);  % 更新
        two_dimensional_rl.dump();
        env.agent=env.observation;
        env.render();
        if env.done
            break
        end
    end
end
