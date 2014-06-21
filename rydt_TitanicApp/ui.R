
shinyUI(
        fluidPage(
                
                
                theme = "bootstrap.css",
              
                
                fluidRow(headerPanel("TITANIC DISASTER Decision Tree")),
                fluidRow(column(1,h6("by rydt"))),
                column(12, hr()),
                
                fluidRow(
               column(12,
                                h1("      Instructions"),
                                 h4("     1.   Please select the features you want to analyze with the decision tree algorithm and click on submit!!"),
                                  
                                  h4("    2.  The different tabs show the results (data set, Tree, summary, error and performance of the prediction)"),
                                  
                                  h4("    3.  Start again, change features and see the changes!!")
                  
                                ),
                                   
                         br(),
                         br()
                ), 
               column(12, hr()),
               column(12, 
               fluidRow( 
               sidebarLayout(
                                    
                        
                        sidebarPanel(
                          
                                
                               
                                
                             
                                        column(12,
                                               checkboxGroupInput("checkGroup", label = h2("Choose features"), 
                                                                  choices = list("Passenger class" = "Pclass",
                                                                                 "Sex" = "Sex",
                                                                                 "Age" = "Age",
                                                                                 "Fare" = "Fare",
                                                                                  "Number of Siblings/Spouses Aboard" = "SibSp",
                                                                                  "Number of Parents/Children Aboard" = "Parch",
                                                                                 "cabin" = "Cabin",
                                                                                  "Port of Embarkation" = "Embarked"
                                                                                         
                                                                                 
                                                                                 )
                                                                                ,
                                                                                
                                                                  
                                                                  selected = 0),
                                               
                                               
                                               
                                               verbatimTextOutput("checklist"),
                                               verbatimTextOutput("checkVect")
                                        ),
                                       
                                        column(3,
                                                                                              br(),
                                                br(), 
                                                submitButton("Submit")
                                        )
                                        
                                        
                                        
                                
                                
                                
                        )       
                                
                        ,
                        
                        
                        mainPanel( 
                               
                                tabsetPanel(
                                        tabPanel("Train file",
                                                 column(12,
                                                 tableOutput("table"),
                                                 verbatimTextOutput("summarytrain")
                                                 )
                                                 ),
                                        tabPanel("Tree", plotOutput("plotTree")), 
                                        tabPanel("Summary", verbatimTextOutput("summaryfit")),
                                        tabPanel("CP", plotOutput("plotfit")),
                                        tabPanel("prediction",
                                                 column(6,
                                                 verbatimTextOutput("CM"),
                                                 verbatimTextOutput("precision"),
                                                 verbatimTextOutput("recall"),
                                                 verbatimTextOutput("accuracy"),
                                                 verbatimTextOutput("f1")
                                                 )
                                        )
                                        
                                        
                                )
                        )
                )   
                ))
                
                
        )               
)



