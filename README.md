Information
===========
This work is My graduation project. In this toolbox i used the fusion of two descriptors. Deformable Part Models 
introduced by [2] and Color Histogram of Oriented Phases introduced by [7].

Overview
===========
Deformable part model based on HOG system has been quite popular in the computer vision world in the past years because
of its highly detection scores on object detections like pedestrians, bicycles, cars…In this report I represent a novel method
based on deformable part models but with a new descriptor called Colour Histogram of Oriented Phase (CHOP).
This method has shown great results compared to HOG based DPM on one of the most challenging datasets PASCAL VOC 2007.
While our scores are slightly under HOG based DPM on day context dataset our method has shown great results on night context
although it was trained on a day context and this is due to the ability of CHOP in extracting features with luminance variations. 

Screenshots of Results
======================
![alt text](http://images.ivmlab.org/14.PNG)

![alt text](http://images.ivmlab.org/15.PNG)

![alt text](http://images.ivmlab.org/16.PNG)

![alt text](http://images.ivmlab.org/17.PNG)

![alt text](http://images.ivmlab.org/18.PNG)



References
==========

[1] P. Felzenszwalb, D. McAllester, D. Ramaman.  
A Discriminatively Trained, Multiscale, Deformable Part Model.  
Proceedings of the IEEE CVPR 2008.

[2] P. Felzenszwalb, R. Girshick, D. McAllester, D. Ramanan.  Object
Detection with Discriminatively Trained Part Based Models.
IEEE Transactions on Pattern Analysis and Machine Intelligence, Vol. 32, No. 9, September 2010.

[3] P. Felzenszwalb, D. McAllester
Object Detection Grammars.
University of Chicago, Computer Science TR-2010-02, February 2010

[4] R. Girshick, P. Felzenszwalb, D. McAllester.
Object Detection with Grammar Models.
Proceedings of Neural Information Processing Systems (NIPS) 2011.

[5] R. Girshick.
From Rigid Templates to Grammars: Object Detection with Structured Models.
Ph.D. dissertation, The University of Chicago, April 2012.

[6] Cascade Object Detection with Deformable Part Models
P. Felzenszwalb, R. Girshick, D. McAllester.
In Proceedings of the IEEE CVPR 2010.
[7] Hussin K. Ragb and Vijayan K. Asari, “Color and Local Phase Based Descriptor for Human detection,” IEEE 2016.


System Requirements
===================
 * Linux or OS X
 * MATLAB
 * GCC >= 4.2 (or an older version if it has OpenMP support)
 * At least 4GB of memory (plus an additional 0.75GB for each
   parallel matlab worker)

The software was tested on several versions of Linux and Mac OS X using
MATLAB versions R2011a. There may be compatibility issues with older
versions of MATLAB.


Basic Usage
===========

1. Unpack the code.
2. Start matlab.
3. Run the 'compile' function to compile the helper functions.
   (you may need to edit compile.m to use a different convolution 
    routine depending on your system)
4. Load a model and an image.
5. Use 'process' to detect objects.

Example:
>> load VOC2007/car_final.mat;       % car model trained on the PASCAL 2007 dataset
>> im = imread('000034.jpg');        % test image
>> bbox = process(im, model, -0.5);  % detect objects
>> showboxes(im, bbox);              % display results

The main functions defined in the object detection code are:

boxes = imgdetect(im, model, thresh)              % detect objects in image im
bbox = bboxpred_get(model.bboxpred, dets, boxes)  % bounding box location regression
I = nms(bbox, overlap)                            % non-maximal suppression
bbox = clipboxes(im, bbox)                        % clip boxes to image boundary
showboxes(im, boxes)                              % visualize detections
visualizemodel(model)                             % visualize models

Their usage is demonstrated in the 'demo' script.  

The directories 'VOC20??' contain matlab .mat file with models trained
on several PASCAL datasets (the train+val subsets).  Loading one of
these files from within matlab will define a variable 'model' with the
model trained for a particular object category in the current workspace.  
The value 'model.thresh' defines a threshold that can be used in the 
'imgdetect' function to obtain a high recall rate.


Using the learning code
=======================

1. Download and install the 2006-2011 PASCAL VOC devkit and dataset.
   (you should set VOCopts.testset='test' in VOCinit.m)
2. Modify 'voc_config.m' according to your configuration.
3. Start matlab.
4. Run the 'compile' function to compile the helper functions.
   (you may need to edit compile.m to use a different convolution 
    routine depending on your system)
5. Use the 'pascal' script to train and evaluate a model. 

example:
>> pascal('bicycle', 3);   % train and evaluate a 6 component bicycle model

The learning code saves a number of intermediate models in a model cache
directory defined in 'voc_config.m'.
