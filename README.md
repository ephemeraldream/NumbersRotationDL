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

```
customLayer.m
```

The customLayer was implemented in two ways. I tried to incorporate my function, but the problem with small numbers, so it needs to be optimized further. 
So, I eventually put imrotate() inside my custorLayer. Backprop is also implemented (in a trivial way). 




# Comments by the Reviewer

* Good job, all goals accomplished
* All networks performed as expected for the architecture chosen
* Good knowledge of the layers and their proper placement in the model
* I think you may have squeezed a bit more performance by allowing more epochs. Validation never
  terminated training, and I have a feeling that the net was not yet fully trained. 
* A very concise and readable implementation of rotation. It is much less complicated
  that the one ChatGPT wrote for us, and also that I found by Google search.
  As I recall, you used a book to study the algorithm. Would you please send me the reference?
* NOTE: Used Emacs to indent your code, easier to read this way.

## Score: 100%
