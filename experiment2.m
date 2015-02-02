function experiment2(i, n)
    p = {
        0.05,0.9,0.01,0,[512 512],@(x) x,'sigm',0,0,100;
        0.05,0.9,0.001,0,[512 512],@(x) x,'sigm',0,0,100;
        0.05,0.9,0.001,0,[512 512],@(x) x,'tanh_opt',0,0,100;
        0.05,0.9,0.000001,0,[512 512],@(x) x,'relu',0,0,100;
        0.05,0.9,0.0001,0,[512 512],@(x) max(log2(x),0),'relu',0,0,100;
        0.05,0.9,0.01,0,[512 512],@(x) x,'sigm',0.5,0,100;
        0.05,0.9,0.01,0,[512 512],@(x) x,'sigm',0,0.0001,100;
        0.05,0.9,0.01,0.5,[512 512],@(x) x,'sigm',0,0,100;
        0.05,0.9,0.001,0,[1024 1024],@(x) x,'sigm',0,0,100;
        0.05,0.9,0.01,0,[256 256 256],@(x) x,'sigm',0,0,100;
        0.05,0.95,0.01,0,[512 512],@(x) x,'sigm',0,0,100;
        0.05,0.9,0.01,0,[512 512],@(x) max(log2(x),0),'sigm',0,0,100;
    };

    addpath(genpath('DeepLearnToolbox'));
    rng('shuffle');
    a = NNAgent(p{i,1}, p{i,2}, p{i,3}, p{i,4}, p{i,5}, p{i,6}, p{i,7}, p{i,8}, p{i,9}, p{i,10});
    results = a.play(n);
    save(['results' num2str(i) '.mat']);
    %quit;
end
