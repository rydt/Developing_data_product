
library(rpart)
library(shiny)
library(knitr)
# install.packages("tree")
library("tree")
# install.packages('cvTools')
library(cvTools)
# install.packages('ROCR')
library(cvTools)
traindf<-read.csv("../data/train.csv")
testdf<-read.csv("../data/test.csv")

train <- traindf[c(1:691),]
test <-  traindf[c(692:891),]

test$Survived<-NA


shinyServer(function(input, output) {
        
        
        
        output$checklist <- renderPrint({ input$checkGroup })
      
        
        traintoFit <-  reactive({
                                train[c("Survived",input$checkGroup)]
                         
                         })
        Survived <- train$Survived
        
       fit<-reactive({
                        rpart(Survived ~ ., data = traintoFit(),method="class")
                        
       })
     
      output$plotTree <- renderPlot({ 
              par(oma=c(1,1,1,1))
                plot(fit(), uniform=TRUE,
                         main="Classification Tree for Titanic disaster")
                text(fit(), use.n=TRUE, all=TRUE, cex=.8)
                
        })

   
        output$plotfit<- renderPlot({ 
                 plotcp(fit()) # display the results
         })
        
        output$summaryfit <- renderPrint({
                summary(fit()) # detailed summary of splits
                
        })

        output$table <- renderTable({
                head(traintoFit())
        })
      
       output$summarytrain <- renderPrint({
           summary(traintoFit()) # detailed summary of splits
        
      })
        
        prediction <- reactive({
                predict(fit(),train, type="class")
        })

        output$CM <- renderPrint({
                table(train$Survived,prediction())
        })


        output$precision <- renderPrint({
          TN <- table(train$Survived,prediction())[1]
          FN <- table(train$Survived,prediction())[2]
          FP <- table(train$Survived,prediction())[3]
          TP <- table(train$Survived,prediction())[4]
          precision <- TP/(TP+FP)
          paste('The model has a precision of', round(precision,2) )
        })

        output$recall <- renderPrint({
          TN <- table(train$Survived,prediction())[1]
          FN <- table(train$Survived,prediction())[2]
          FP <- table(train$Survived,prediction())[3]
          TP <- table(train$Survived,prediction())[4]
          recall <- TP/(TP+FN)
          paste('The model has a recall of', round(recall,2) )
        })

        output$accuracy <- renderPrint({
          TN <- table(train$Survived,prediction())[1]
          FN <- table(train$Survived,prediction())[2]
          FP <- table(train$Survived,prediction())[3]
          TP <- table(train$Survived,prediction())[4]
          accuracy <- (TP+TN)/(TP+TN+FP+FN)
          paste('The model has an accuracy of', round(accuracy,2) )
        })
      
      output$f1 <- renderPrint({
        TN <- table(train$Survived,prediction())[1]
        FN <- table(train$Survived,prediction())[2]
        FP <- table(train$Survived,prediction())[3]
        TP <- table(train$Survived,prediction())[4]
        precision <- TP/(TP+FP)
        recall <- TP/(TP+FN)
        f1 <- (2*precision*recall)/(precision+recall)
        paste('The model has an f1 score of', round(f1,2) )
      })

      

#         output$plot_pred <- renderPrint({
#                 plot(table(train$Survived,prediction()))
#         })
        

        
        
})