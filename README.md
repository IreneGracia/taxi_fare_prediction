# taxi_fare_prediction

This project implements a comprehensive pipeline for taxi fare prediction, utilising Google Cloud Platform (GCP), MLflow for model version control, and FastAPI for real-time predictions.

The workflow begins by retrieving data, either from BigQuery or local storage if it has been previously queried. It then cleans the data by removing duplicates, handling missing values (NaNs), and filtering out invalid entries, such as incorrect passenger counts, fare amounts, and latitude/longitude values, as well as pickup and dropoff locations outside the designated boundaries.

Next, the raw data undergoes preprocessing, where relevant features such as time-based variables (day of the week, hour) and distance measures (Haversine and Manhattan distances) are extracted. Location data is encoded using geohashing, and various features are scaled or encoded as necessary. These preprocessing steps are combined into a unified pipeline.

The pipeline also defines, compiles, trains, and evaluates a neural network model. The model includes dense layers, batch normalisation, dropout, and L1/L2 regularisation, and is optimised using the Adam optimiser. Training incorporates early stopping to prevent overfitting. The data downloads and uploads from and to BigQuery, data preprocessing, model training, and model evaluation are all carried out using GCP Virtual Machines, with model versioning managed through MLflow.

Finally, a FastAPI application is deployed to provide real-time taxi fare predictions. Upon receiving ride details (pickup and dropoff locations, time, and passenger count), the API preprocesses the input and uses the latest trained model to generate fare predictions. The FastAPI application is configured with CORS middleware, making it accessible from any origin.
