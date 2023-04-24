[XTrain,~,YTrain] = digitTrain4DArrayData;

y = imrotate(XTrain(:,:,1),180)
x = digitRotation(XTrain(:,:,1), 190)
imshow(x)
