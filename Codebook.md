Codebook for the tidy dataset produced by script analysis.R


##Columns and Descriptions

1.  subject:      ID of the subject who performed the activity
2.  activity:     Name of activity (Walking, Walking upstairs, Walking downstairs, Sitting, Standing, Laying)
3.  Domain:       Time domain signal or Frequency domain signal
4.  Acceleration: Acceleration signal (Body or Gravity)
5.  Instrument:   Measuring Instrument (Accelerometer or Gyrospector)
6.  Magnitude:    Signal magnitude calculated using Euclidian formula
7.  Jerk:         Jerk signal
8.  Axis:         Axis sending the signal (X, Y, Z)
9.  function:     Mean or Std
10. value:        Average by activity and subject





##Data preview

```r
head(final)
```

```
##   activity subject Domain Acceleration    Instrument Magnitude Jerk Axis
## 1  WALKING       1   Time         Body Accelerometer      <NA> <NA>    X
## 2  WALKING       2   Time         Body Accelerometer      <NA> <NA>    X
## 3  WALKING       3   Time         Body Accelerometer      <NA> <NA>    X
## 4  WALKING       4   Time         Body Accelerometer      <NA> <NA>    X
## 5  WALKING       5   Time         Body Accelerometer      <NA> <NA>    X
## 6  WALKING       6   Time         Body Accelerometer      <NA> <NA>    X
##   function.     value
## 1      mean 0.2773308
## 2      mean 0.2764266
## 3      mean 0.2755675
## 4      mean 0.2785820
## 5      mean 0.2778423
## 6      mean 0.2836589
```


##Summary
```r
summary(final)
```

```
##                activity       subject           Domain      Acceleration  
##  LAYING            :2370   Min.   : 1.0   Frequency:7020   Body   :12780  
##  SITTING           :2370   1st Qu.: 8.0   Time     :7200   Gravity: 1440  
##  STANDING          :2370   Median :15.5                                   
##  WALKING           :2370   Mean   :15.5                                   
##  WALKING DOWNSTAIRS:2370   3rd Qu.:23.0                                   
##  WALKING UPSTAIRS  :2370   Max.   :30.0                                   
##          Instrument       Magnitude       Jerk        Axis     
##  Accelerometer:8640   Magnitude: 3960   Jerk:5580   X   :3420  
##  Gyroscope    :5580   NA's     :10260   NA's:8640   Y   :3420  
##                                                     Z   :3420  
##                                                     NA's:3960  
##                                                                
##                                                                
##  function.       value         
##  mean:8280   Min.   :-0.99767  
##  std :5940   1st Qu.:-0.95242  
##              Median :-0.34232  
##              Mean   :-0.41241  
##              3rd Qu.:-0.03654  
##              Max.   : 0.97451
```


##Detail
```r
str(final)
```

```
## 'data.frame':	14220 obs. of  10 variables:
##  $ activity    : Factor w/ 6 levels "LAYING","SITTING",..: 4 4 4 4 4 4 4 4 4 4 ...
##  $ subject     : int  1 2 3 4 5 6 7 8 9 10 ...
##  $ Domain      : Factor w/ 2 levels "Frequency","Time": 2 2 2 2 2 2 2 2 2 2 ...
##  $ Acceleration: Factor w/ 2 levels "Body","Gravity": 1 1 1 1 1 1 1 1 1 1 ...
##  $ Instrument  : Factor w/ 2 levels "Accelerometer",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ Magnitude   : Factor w/ 1 level "Magnitude": NA NA NA NA NA NA NA NA NA NA ...
##  $ Jerk        : Factor w/ 1 level "Jerk": NA NA NA NA NA NA NA NA NA NA ...
##  $ Axis        : Factor w/ 3 levels "X","Y","Z": 1 1 1 1 1 1 1 1 1 1 ...
##  $ function.   : Factor w/ 2 levels "mean","std": 1 1 1 1 1 1 1 1 1 1 ...
##  $ value       : num  0.277 0.276 0.276 0.279 0.278 ...
```


##Output file

```r
###write.table(final, "averages by subject and activity.txt",row.names=FALSE)
```
