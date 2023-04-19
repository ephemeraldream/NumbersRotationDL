load("mnist.mat");


C = randi([-10,10],4,4);
C(end, end, 2) = 1;


Xtrain = training.images;
Xtrain(end, end, end, 1) = 1;
Xtrain = permute(Xtrain, [1,2,4,3]);
Ytrain = categorical(training.labels);

Xtest = test.images;
Xtest(end,end,end, 1) = 1;
Xtest = permute(Xtest, [1,2,4,3]);
Ytest = categorical(test.labels);

inputSize = [28,28,1];

layers = [
    imageInputLayer(inputSize)
    convolution2dLayer(5,20)
    batchNormalizationLayer
    reluLayer
    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];

options = trainingOptions('sgdm', ...
    'MaxEpochs',4, ...
    'ValidationData',{Xtest, Ytest}, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');

net = trainNetwork(Xtrain, Ytrain,layers,options);

YPred = classify(net,Xtest);
YValidation = Ytest;
accuracy = mean(YPred == YValidation);












