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

![imrotate by 180 degrees:](https://github.com/ephemeraldream/NumbersRotationDL/blob/main/Images/imrotate.png)
 
However, here is rotation using my function: 

![bicubic rotation by 180 degrees](https://github.com/ephemeraldream/NumbersRotationDL/blob/main/Images/bicu2.png)

We see that for some reason, the image was zoomed in by 10-15%. Nevertheless, the rotation happens. 

The customLayer was implemented in two ways. I tried to incorporate my function, but the problem with small numbers, so it needs to be optimized further. 
So, I eventually put imrotate() inside my custorLayer. Backprop is also implemented (in a trivial way). 




