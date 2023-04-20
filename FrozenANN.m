[XTrain,~,YTrain] = digitTrain4DArrayData;
[XValidation,~,YValidation] = digitTest4DArrayData;

net = regressionTrained;
graph = layerGraph(net);
layers = graph.Layers;
connections = graph.Connections;
for ii = 1:size(layers,1)
    pr = properties(layers(ii));
    for p = 1:numel(pr)
        propName = pr{p};
        if ~isempty(regexp(propName, 'LearnRateFactor$', 'once'))
            layers(ii).(propName) = 0;
        end
    end
end




