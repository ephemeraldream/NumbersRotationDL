[XTrain,~,YTrain] = digitTrain4DArrayData;


x = digitRotation(XTrain(:,:,1), 180)
imshow(x)