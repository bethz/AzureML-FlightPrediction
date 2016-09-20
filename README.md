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
* [Guest Access](http://studio.azureml.net/home/anonymous) - This does not require an Azure subscription or a credit card. It is anonymous access.  After 8 hours the workspace gets reset.  This is a great option for evaluation and this Challenge.
* [Your Own Account](https://studio.azureml.net/Home) - Sign in and use a work, school or Microsoft account. Please do not take a tour now, explore the tour later.  There are two types:
    * Free Account ([Microsoft Account](https://signup.live.com/signup) required) - 10 GB of Storage, R and Python Scripts and Web Service access
    * Enterprise Grade ([Azure Subscription](https://azure.microsoft.com/en-us/free/) required) - Full SLA, Bring your own Azure Storage, parallel graph execution, Elastic Web Service Endpoints

## 2. Create an Experiment

Let's get started by making a new experiment.

### A. Make a new experiment
Select "**+New**" in the lower left corner.

<img src="https://github.com/bethz/AzureML-FlightPrediction/blob/master/2ANewExperiment.png" width="600">

### B. Select Blank Experiment

To the right of Experiment, you will see a tile with a plus sign and the words Blank Experiment.
Select ```+ Blank Experiment```.

<img src="https://github.com/bethz/AzureML-FlightPrediction/blob/master/2bBlankExperiment.png" width="600">

### C. Give the experiment a title
By default, a title is created with a name like "**_Experiment created on 9/24/2016_**". 
Change the title to "My first Azure ML experiment" by editing the provided title.

<img src="https://cloud.githubusercontent.com/assets/6098674/18649061/7e817444-7e8b-11e6-815d-2a7dd7b154ac.png" width="600">

## 3. Import, Review and Clean Data
 
### A. Search for flight data
Type “flight” into the search bar.

<img src="https://github.com/bethz/AzureML-FlightPrediction/blob/master/3A.png" width="600">

### B. Import data

Drag the ```Flight on-time performance Dataset``` to the workspace as show in the image. This is one of many sample datasets built into Azure Machine Learning Studio designed to help you learn and explore the tool.

<img src="https://github.com/bethz/AzureML-FlightPrediction/blob/master/3b.png" width="600">

### C. Review Data
Right click on the dataset on your worksheet and select **dataset | visualize** from the pop-up menu. 

<img src="https://github.com/bethz/AzureML-FlightPrediction/blob/master/3cvis.png" width="600">

Notice the graphs or charts at the top of each data column. Explore the dataset by clicking on different columns. It’s essential in Machine Learning to be familiar with your data and visualizing your dataset is a great first step.  This dataset provides a great deal of information about flights and whether or not they arrived on time. We are going to use Machine Learning to use this data to create a model that predicts whether a given flight will be late. 

<img src="https://github.com/bethz/AzureML-FlightPrediction/blob/master/3cdataset.png" width="600"> 

 Note: In an actual data science experiment, it is likely going to be necessary to [Data Wrangle](https://en.wikipedia.org/wiki/Data_wrangling) or clean dirty data. For this example, the data set is clean.

 You can find the column definitions for this data on the [US Department of Transportation site](http://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236&DB_Short_Name=On-Time).
 
### D. Close the data visualization window
Click on the X in the top right corner of the window to close the data visualization window..
 
## 4. Specify Columns to Use
You need to review the data in the dataset and decide which columns represent data that you think will affect whether or not a flight is delayed.  You also need to select the column that you want to predict.  In this case, we are going to predict the value of ```ArrDel15```.  This is a binary state, 0/1, that indicates whether a flight arrival was delayed by more than 15 minutes.

### A. Add Manipulation to Select Columns in Dataset
First, type "**project**" into the search bar and drag the ```Select Columns in Dataset``` manipulation to the workspace.
This manipulation enables you to specify which columns in the data set you think are significant to the prediction.  

<img src="https://github.com/bethz/AzureML-FlightPrediction/blob/master/4a.png" width="600">

### B. Connect Flight on-time performance task to Select Columns in Dataset task
Connect the output of ```Flight on-time performance``` dataset to the input of the ```Select Columns in Dataset``` by clicking on the lower center dot and dragging to the input, top center dot, of the ```Select Columns in Dataset``` task.

<img src="https://github.com/bethz/AzureML-FlightPrediction/blob/master/4b.png" width="600">

### C. Launch Column Selector
Click on the ```Select Columns in Dataset``` module, then on the far right, select **Launch column selector**.

<img src="https://github.com/bethz/AzureML-FlightPrediction/blob/master/4c.png" width="600">

### D. Select Columns
Select the columns you think affect whether or not a flight is delayed as well as the column we want to predict ```ArrDel15```. In the following screenshot, I selected ```Month```, ```Carrier (airline)```, ```OriginAirportID```, ```DestAirportID```, and ```ArrDel15```. You might select more or less columns.  You can also add or remove columns later.

<img src="https://github.com/bethz/AzureML-FlightPrediction/blob/master/new4d.png" width="600">

### E. Complete Column Selection

Select the checkbox in the lower right of the **Select columns** window.

## 5. Split The Data Into A Training And Test Set

The ```Split Data``` task allows us to divide up our data, we need some of the data to try and find patterns so we can make predictions. We need to save some of the data to test if the model we create successfully makes predictions. 

Traditionally, you will split the data 80/20 or 70/30. For today’s challenge everyone will use an 80/20 split. That means 80% of the data will be used to train the model and 20% will be used to test the accuracy of the model we develop.

### A. Split Data Task

Type “**split**” into the search bar and drag the ```Split Data``` task to the workspace. Connect the output of ```Select Columns in Dataset``` task to the input of the ```Split Data``` task (same way we connected the Flight Data to the Select Columns modules).

<img src="https://github.com/bethz/AzureML-FlightPrediction/blob/master/5a.png" width="600">

### B. Split our input data

Click on the ```Split Data``` task to bring up the Properties Pane and specify ```.8``` as the Fraction of rows. 

<img src="https://github.com/bethz/AzureML-FlightPrediction/blob/master/5b.png" width="600">

## 6. Train The Model

Next, we identify which data is to be predicted. In our case, we are predicting the value of the column ```ArrDel15``` which indicates if a flight arrival time was delayed by more than 15 minutes.

### A. Connect Data

Type “**train model**” into the search bar. Drag the ```Train Model``` task to the workspace. 

Hovering over the input and output dots will reveal what each input/output represents. Connect the first output, ```Results Dataset1```, (the circle on the left) of the ```Split Data``` task to the **rightmost** input of the ```Train Model``` task. This will take 80 % of our data and use it to train/teach our model to make predictions.

[UPDATE PHOTO TO SHOW CONNECTION]
<img src="https://github.com/bethz/AzureML-FlightPrediction/blob/master/6a.png" width="600">

### B. Identify Predicted Value
Click on the ```Train Model``` task. In the **Properties** window, select Launch Column Selector. Select the column ```ArrDel15``` by typing "arrdel15" in to the text box (a smart filter of columns will appear). Click the checkbox in the lower right corner to complete the operation.

<img src="https://github.com/bethz/AzureML-FlightPrediction/blob/master/6b.png" width="600">

## 7. Select Algorithm
If you are a data scientist who creates their own algorithms, you could now import your own R code to analyze the patterns. But, Azure ML provides a number of standard algorithms which are available for use. 

Selecting an algorithm can be overwhelming,  to help narrow the process a [Azure ML Cheat Sheet](https://aka.ms/azuremlcheatsheet) has been created.  By narrowing the type of problem you are solving can find the algorithms that will be most likely to generate a good model. 

Today we are doing binary classification also known as Two-Class Classification.  Using the cheat sheet we can narrow our selection to a standard algorithm called ```Two-Class Neural Network```.  

As you can see there are many Two-Class algorithms that we can choose from so we may want to try different ones out as we refine our model.  Swapping out or even comparing two algorithms is made easy with Azure Machine learning as you will see.

### A. Connect algorithm
Type “**two-class**” into the search bar. You will see a number of different classification algorithms listed and each has its own advantages and disadvantages. Each of the two-class algorithms is designed to predict a binary outcome. 

Select ```Two-Class Neural Network``` and drag it to the workspace. Connect the output of the ```Two-Class Neural Network``` task to the **leftmost** input of the ```Train Model``` task.

<img src="https://github.com/bethz/AzureML-FlightPrediction/blob/master/7a.png" width="600">

[NEED IMAGE]

## 8. Score the Model
After the model is trained, it is evaluated to determine how well it predicts delayed flights, so the model is scored by testing it against the Test Data which is the remaining 20% of the data we split to the second output of the ```Split Data``` task.

### A. Connect test data
Type “**score**” into the search bar and drag the ```Score Model``` task to the workspace. 

Connect the output of ```Train Model``` to the **left input** of the ```Score Model``` task. Connect the Test Data, the **right output** of the ```Split Data``` task to the **right input** of the ```Score Model``` task as shown in the following screenshot.  The output of this task is a scored dataset.

<img src="https://github.com/bethz/AzureML-FlightPrediction/blob/master/8a.png" width="600">

## 9. Evaluate Model
Next, the model is evaluated to determine its accuracy.  This is done by evaluating the trained model by using the test data.

### A. Determine accuracy of model
Type “**evaluate**” into the search bar and drag the ```Evaluate Model``` task to the bottom of the workspace. 

Connect the output of the ```Score model``` task to the **left input** of the ```Evaluate Model``` task.  The other input and output of the Evaluate Model task are not connected at this time.

You are now ready to run your experiment!

<img src="https://github.com/bethz/AzureML-FlightPrediction/blob/master/9a.png" width="600">

## 10. Run Experiment

### A. Select Run
Select Run on the bottom toolbar. You will see green check marks appear on each task as it completes.  The data is flowing through your Machine Learning Workflow, starting with data selection, being trained against the model, and finally being evaluated.

This process can take several minutes.  When there is a green check mark on the ```Evaluate Model``` task the process is complete.

[NEED SCREEN SHOT]

## 11. Post Run: Evaluate Model

It is usually necessary to evaluate the model, improve it, re-run it and repeat.  

### A. Evaluate The Model

When the entire experiment is completed,  right click on the ```Evaluate Model``` task and select “**Evaluation results | Visualize**” to see how well the model predicted delayed flights.  

[UPDATE SCREENSHOT TO highlight clicks]
<img src="https://github.com/bethz/AzureML-FlightPrediction/blob/master/11a.png" width="600">

## 12. Interpreting Results

The first run of a model is a baseline and is considered a first step.

One useful piece of the evaluation results is the first graph the **True Positive Rate versus False Positive Rate**. This graph is a representation of the Area Under the Curve. A 45 degree flat line on this chart indicates guessing randomly. A slightly more accurate model than random guessing looks like the image below, our current model.

<img src="https://github.com/bethz/AzureML-FlightPrediction/blob/master/12graph.png" width="600">

If you scroll down you can see the accuracy – Higher accuracy is good!
You can also see the number of false and true positive and negative predictions.
- **True positives** are how often your model correctly predicted a flight would be late
- **False positives** are how often your model predicted a flight would be late, when the flight was actually on time (your model predicted incorrectly)
- **True negatives** indicate how often your model correctly predicted a flight would be on time (```arrDel15``` is false)
- **False negatives** indicate how often your model predicted a flight would be on time, when in fact it was delayed (your model predicted incorrectly)

You want higher values for True positives and True negatives, you want low values for False Positives and False negatives.

<img src="https://github.com/bethz/AzureML-FlightPrediction/blob/master/12truepos.png" width="50">

From the model, there were no False Positives which is good. 
But, you can see from the results above my model predicted every single flight would be on time, not very helpful! I think we need to try something else…

Your challenge is to improve the model and try different experiments. Change the algorithm, change algorithm parameters, change project columns to get the best possible accuracy/true/false positive/negative results! 

Note: As you make changes you will need to re-run the Experiment.

Good Luck! 




