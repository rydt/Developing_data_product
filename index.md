---
title       : Titanic disaster 
subtitle    : Decision tree application 
author      : rydt
job         : data scientist
framework   : io2012       # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---

## My application
This application allows to perform predictions on the survival of a person in the Titanic. The problem is taken from the kaggle competition in the knowlegde section called: *Titanic: Machine Learning from Disaster* https://www.kaggle.com/c/titanic-gettingStarted

The prediciton is made using a **decision tree** and the **rpart** library

It's easy to use:

- On the left panel, select the features to predict the survived variable 
- Click on submit
- On the right, choose a panel to get a specific view of the results (Tree, summary, CP, confusion matrix)
- Change features, click on submit and see the changes

--- .class #id 

## An example
For the features:
- Pclass (passenger class)
- Sex
- Age
- Fare (price of the ticket)




```r
fitTree <- rpart(Survived ~ Pclass + Sex + Age + Fare, data = train, method = "class")
prediction <- predict(fitTree, test, type = "class")
```


--- .class #id 


## Tree and Error
![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


--- .class #id 
## How well did you predict the end!!

```r
table(test$Survived, prediction)
```

```
##    prediction
##       0   1
##   0 117   9
##   1  31  43
```






```r
precision <- TP/(TP + FP)
recall <- TP/(TP + FN)
accuracy <- (TP + TN)/(TP + TN + FP + FN)
F1 <- (2 * precision * recall)/(precision + recall)
```



```
## [1] "The model has a precision of 0.83 , a recall of 0.58"
```

```
## [1] "an accuracy of 0.8 and an F1 score of 0.68"
```


*Your turn just have fun!!!*

--- .class #id 

