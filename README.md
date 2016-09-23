# AzureML-FlightPrediction Possible Model Improvements
This branch list out some possible improvements we could make to improve the model.  Please switch the ```master``` branch if you are looking for detailed walk through of the Challenge.

If you have improvement that is not listed below create a Pull Request and we will add it!

## Possible Model Improvements

* In ```Select Columns in Dataset``` module add different combinations of Columns:
   * ```DepDelay``` 
   * ```DayOfWeek```
   * ```CRSDepTime```
   * ```DayofMonth```
   * ```Diverted```
   * ```Cancelled```

* Get more data from the multiple years and months from http://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236&DB_Short_Name=On-Time (all the rows in the data set are from one month of one year)

* Bring in weather Dataset

* Use a different algorithm

* Calculate flight duration and use it as a field

* Change the parameters for the two-class neural network (or use sweep module)