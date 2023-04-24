# NumbersRotationDL
Implementation of ANN with number rotation


As a first step, the classification NN was implemented. I used CNN there. 
> try 
```
anntest.m
```

As a second step, I build the regression network that detects an angle of digit rotation. 
>try
```
CNNregression.m
```

Then I implemented a script that freezed all the weights of the network. 
```
FrozenANN.m
```

## CustomLayer.m
This was a major problem for this project. I tried two different implementations. The fucntion:
```
failedRotation.m
```
doesn't even work. But I didn't delete it, hoping to fix. 

The second function called 
```
digitRotation.m
```
It performs bicubic interpolation. However, there is a need for clarification. Let's compare the behaviour of this function and MATLAB's imrotate()

