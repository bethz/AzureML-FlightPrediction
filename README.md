# AzureML-FlightPrediction
This is detailed documentation for the Azure Machine Learning, ML, tutorial/workshop on flight prediction.

# Azure Machine Learning Challenge for Flight Prediction

This Learning Challenge uses Flight data to predict when a flight will be late. We begin by accessing Azure ML. Here is an overview of what we will do:
1. Access Azure ML
2. Create Experiment
3. Import Data
4. Review and Clean Data
5. Split the data into a training and test set
6. Create a model
7. Train the model
8. Evaluate our model
9. Improve the model
 
# 1. Access Azure ML

This Azure Machine Learning Challenge can be completed with:
* **Guest Access** - This does not require an Azure subscription or a credit card. It is anonymous access.
* **Your Own Account** - Sign in and use a work, school or Microsoft account. Please do not take a tour now, explore the tour later.

# If you are using Guest Access:

Go [here](http://studio.azureml.net/home) to access Azure ML.

If you are using Your Own Account, please sign in now.  If you create your own account, please do not take a tour now as you can explore the tour later. Please select **Not Now** when prompted to take a tour.

**??Put url to create account here **

# 2. Create an Experiment

## A. Create a Blank Experiment
On the left panel, Experiment should be highlighted in Grey and you will see a tile with a plus sign and the words Blank Experiment.  Please select Experiment if it is not selected.

## B. Select + Blank Experiment

## C. Give The Experiment A Title
By default a title is created with a name like *Experiment created on 9/24/2016*. 
Change the title to "My first Azure ML experiment" by editing the provided title.
 
# 3. Import, Review and Clean Data
 
 ## A. Import Data
 Type “flight” into the search bar and drag the Flight on-time performance Dataset to the workspace as show in the image. This is one of many sample datasets built into Azure Machine Learning Studio designed to help you learn and explore the tool.
 
 ## B. Review Data
 Right click on the dataset on your worksheet and select **dataset | visualize** from the pop-up menu. Notice the graphs or charts at the top of each data column. Explore the dataset by clicking on different columns. It’s essential in Machine Learning to be familiar with your data and visualizing your dataset is a great first step.  This dataset provides a great deal of information about flights and whether or not they arrived on time. We are going to use Machine Learning to use this data to create a model that predicts whether a given flight will be late. 
 
 Note: In a typical data science experiement, it is likely going to be necessary to **Data Wrangle** or clean dirty data. For this example, the data set is clean.
 
 ## C. Close the data visualization window
 Click on the X in the top right corner to close the data visualizatio window..
 
# 4. Specify Columns to Use
     You need to look at the data in the dataset and decide which columns represent data that you think will affect whether or not a flight is delayed.  You also need to select the column that you want to predict.  In this case, we are going to predict the value of ArrDel15.  This is a binary state, 0/1, that indicates whether a flight arrival was delayed by more than 15 minutes.
     
## A. Add Manipulation to Select Columns in Dataset
First, type**project** into the search bar and drag the **Select Columns in Dataset" Manipulation to the workspace.
This manipulation enables you to specify which columns in the data set you think are significant to the prediction.  

## B. Launch Column Selector
On the far right, select *Launch column selector*

## C. Select Columns
Select the columns you think affect whether or not a flight is delayed as well as the column we want to predict ArrDel15. In the following screenshot, I selected Month, Carrier (airline), OriginAirportID, DestAirportID, and ArrDel15. You might select more or less columns.  You can also add or remove columns later.

## D. Complete Column Selection
Select the checkbox in the lower right of the Select Columns Window.

## E. Connect Flight on-time performance task to Select Columns in Dataset task
Select the output of the Flight on-time performance task by clicking on the lower center dot and dragging to the input, top center dot, of the Select Columns in Dataset task.

# 5. Split The Data Into A Training And Test Set

## A. Split Data Task
Type “split” into the search bar and drag the Split Data task to the workspace. Connect the output of Project Columns task to the input of the Split Data task.

6. Create a model
7. Train the model
8. Evaluate our model
9. Improve the model


