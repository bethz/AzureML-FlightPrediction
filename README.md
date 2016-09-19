# AzureML-FlightPrediction
This is detailed documentation for the Azure Machine Learning, ML, tutorial/workshop on flight prediction.

# Azure Machine Learning Challenge for Flight Prediction

This Learning Challenge uses Flight data to predict when a flight will be late. We begin by accessing Azure ML. Here is an overview of what we will do:

1. Access Azure ML
2. Create an Experiment
3. Import, Review and Clean Data
4. Specify Columns to Use
5. Split The Data Into A Training And Test Set
6. Train the model
7. Select Algorithm
8. Score the Model
9. Evaluate Model
10. Run Experiment!
 
## 1. Access Azure ML

This Azure Machine Learning Challenge can be completed with:
* **Guest Access** - This does not require an Azure subscription or a credit card. It is anonymous access.
* **Your Own Account** - Sign in and use a work, school or Microsoft account. Please do not take a tour now, explore the tour later.

## If you are using Guest Access:

Go [here](http://studio.azureml.net/home/anonymous) to access Azure ML.

If you are using Your Own Account, please sign in now.  If you create your own account, please do not take a tour now as you can explore the tour later. Please select **Not Now** when prompted to take a tour.

**Add info and url to create a brand new account here **

## 2. Create an Experiment

### A. Make a new experiment
Select + New in the lower left corner.

![Make a  new experiment](https://cloud.githubusercontent.com/assets/6098674/18647709/4a9568da-7e85-11e6-8dd6-6291d6dab47d.png)
![]()

### B. Create a blank experiment
On the left panel, Experiment should be highlighted in grey and you will see a tile with a plus sign and the words Blank Experiment.  Please select Experiment if it is not selected.

### C. Select + Blank Experiment

### D. Give the experiment a title
By default a title is created with a name like "**_Experiment created on 9/24/2016_**". 
Change the title to "My first Azure ML experiment" by editing the provided title.
 
## 3. Import, Review and Clean Data
 
 ### A. Import data
 Type “flight” into the search bar and drag the Flight on-time performance Dataset to the workspace as show in the image. This is one of many sample datasets built into Azure Machine Learning Studio designed to help you learn and explore the tool.
 
 ### B. Review Data
 Right click on the dataset on your worksheet and select **dataset | visualize** from the pop-up menu. Notice the graphs or charts at the top of each data column. Explore the dataset by clicking on different columns. It’s essential in Machine Learning to be familiar with your data and visualizing your dataset is a great first step.  This dataset provides a great deal of information about flights and whether or not they arrived on time. We are going to use Machine Learning to use this data to create a model that predicts whether a given flight will be late. 
 
 Note: In a typical data science experiement, it is likely going to be necessary to **Data Wrangle** or clean dirty data. For this example, the data set is clean.
 
 ### C. Close the data visualization window
 Click on the X in the top right corner to close the data visualizatio window..
 
## 4. Specify Columns to Use
You need to look at the data in the dataset and decide which columns represent data that you think will affect whether or not a flight is delayed.  You also need to select the column that you want to predict.  In this case, we are going to predict the value of ArrDel15.  This is a binary state, 0/1, that indicates whether a flight arrival was delayed by more than 15 minutes.
     
### A. Add Manipulation to Select Columns in Dataset
First, type**project** into the search bar and drag the **Select Columns in Dataset" Manipulation to the workspace.
This manipulation enables you to specify which columns in the data set you think are significant to the prediction.  

### B. Launch Column Selector
On the far right, select *Launch column selector*

### C. Select Columns
Select the columns you think affect whether or not a flight is delayed as well as the column we want to predict ArrDel15. In the following screenshot, I selected Month, Carrier (airline), OriginAirportID, DestAirportID, and ArrDel15. You might select more or less columns.  You can also add or remove columns later.

### D. Complete Column Selection
Select the checkbox in the lower right of the Select Columns Window.

### E. Connect Flight on-time performance task to Select Columns in Dataset task
Select the output of the Flight on-time performance task by clicking on the lower center dot and dragging to the input, top center dot, of the Select Columns in Dataset task.

## 5. Split The Data Into A Training And Test Set

### A. Split Data Task
Type “split” into the search bar and drag the Split Data task to the workspace. Connect the output of Project Columns task to the input of the Split Data task.

### B. Split our input data
The Split Data task allows us to divide up our data, we need some of the data to try and find patterns so we can make predictions. We need to save some of the data to test if the model we create successfully makes predictions. Traditionally, you will split the data 80/20 or 70/30. For today’s challenge everyone will use an 80/20 split. That means 80% of the data will be used to train the model and 20% will be used to test the accuracy of the model we develop. Click on the Split Data task to bring up the properties and specify .8 as the Fraction of rows in the first output 

## 6. Train the model

### A. Connect Data
Type “train model” into the search bar. Drag the train model task to the workspace. Hovering over the input and output dots will reveal what each input/output represents. Connect the first output, Results Dataset1, (the one on the left) of the Split Data task to the rightmost input of the Train model task. This will take 80 % of our data and use it to train/teach our model to make predictions.

### B. Identify Predicted Value
Next,we identify which data is to be predicted. In our case, we are predicting the value of the column ArrDel15 which indicates if a flight arrival time was delayed by more than 15 minutes. Click on the Train Model task. In the properties window select Launch Column Selector. Select the column ArrDel15. Click the checkbox in the lower right corner to complete the operation.


## 7. Select Algorithm
If you are a data scientist who creates their own algorithms, you could now import your own R code to analyze the patterns. But, Azure ML provides a number of standard algorithms which are available for use. We are going to use a standard algorithm call two-class Neural Network.  
### A. Connect algorithm
Type “two-class” into the search bar. You will see a number of different classification algorithms listed and each has its own advantages and disadvantages. Each of the two-class algorithms is designed to predict a binary outcome. Select Two-Class Neural Network and drag it to the workspace. Connect the output of the Two-Class Neural Network task to the leftmost input of the Train Model task.

## 8. Score the Model
After the model is trained, it is evaluated to determine how well it predicts delayed flights, so the model is scored by testing it against the Test Data which is remaining 20% of the data we split to the second output of the Split Data task.

### A. Connect test data
Type “score” into the search bar and drag the Score Model task to the workspace. Connect the output of Train Model to the left input of the Score model task, the Trained Model input. Connect the Test Data, the right output of the Split Data task to the Dataset input or the right input of the Score Model task as shown in the following screenshot.  The output of this task is a Scored dataset.

## 9. Evaluate Model
Next, the model is evaluated to determine its accuracy.

### A.Type “evaluate” into the search bar and drag the Evaluate Model task to the bottom of the workspace. Connect the Scored dataset output of the Score model task to the left input of the Evaluate Model task.  The other input and output of the Evaluate Model task are not connected at this time.

You are now ready to run your experiment!

## 10. Run Experiment

### A. Select Run
Select Run on the bottom toolbar. You will see green checkmarks appear on each task as it completes. 

## 11. Evaluate Model

It is usually necessary to evaluate the model, improve it, re-run it and repeat.  

### A. Evaluate the model
When the entire experiment is completed,  right click on the Evaluate Model task and select “ Evaluation results | Visualize” to see how well the model predicted delayed flights.  

## 12. Interpreting Results
The first run of a model is a baseline and is considered a first step.
One useful piece of the evaluation results are the True Positive versus False Positive Rate.  A 45 degree flat line on this chart indicates guessing randomly. A slightly more accurate model than random guessing looks like this image, our model.

If you scroll down you can see the accuracy – Higher accuracy is good!
You can also see the number of false and true positive and negative predictions.
•	True positives are how often your model correctly predicted a flight would be late
•	False positives are how often your model predicted a flight would be late, when the flight was actually on time (your model predicted incorrectly)
•	True negatives indicate how often your model correctly predicted a flight would be on time (arrDel15 is false)
•	False negatives indicate how often your model predicted a flight would be on time, when in fact it was delayed (your model predicted incorrectly)
You want higher values for True positives and True negatives, you want low values for False Positives and False negatives.

From the model, there were no False Positives which is good. 
But, you can see from the results above my model predicted every single flight would be on time, not very helpful! I think we need to try something else…
Your challenge is to improve the model and try different experiments. Change the algorithm, change algorithm parameters, change project columns to get the best possible accuracy/true/false positive/negative results! Good Luck! 



