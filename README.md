## 1. Title  
### Bitcoin Price Forecasting Using ARIMA (R)  
*A complete time-series modelling project using real-world cryptocurrency data (2011–2025).*

---

## 2. Executive Summary  
This project analyses monthly Bitcoin prices from 2011 to 2025 to understand long-term trends, volatility, and forecasting potential. Using time series techniques in R, the data is transformed to achieve stationarity and multiple ARIMA models are evaluated.

After comparing nine candidate models using statistical significance, information criteria (AIC/BIC), and forecasting accuracy (RMSE, MAE, MAPE, MASE), **ARIMA(2,1,2)** is selected as the most balanced and reliable model.

The project demonstrates an end-to-end analytical workflow—from raw data exploration to model selection and business interpretation—mirroring how forecasting is performed in real analytical roles.

---

## 3. Business Problem  
Cryptocurrency prices are highly volatile and non-stationary, making them difficult to interpret and forecast. For organisations involved in:

- Financial analysis  
- Risk management  
- Trading platforms  
- Investment research  

understanding *patterns in price movement* and *short-term dynamics* is critical for decision-making.

**Business Question:**  
> How can we model and forecast Bitcoin price movements in a statistically robust way, while accounting for its volatility and non-stationary nature?

---

## 4. Methodology  

1. **Data Preparation**  
   - Monthly Bitcoin prices converted into a time series object.

2. **Exploratory Data Analysis**  
   - Summary statistics  
   - Time series plots  
   - Lag correlation analysis  
   - Q-Q plots  

3. **Stationarity & Transformation**  
   - Augmented Dickey-Fuller (ADF) test  
   - Log transformation  
   - First differencing  
   - Phillips-Perron test  

4. **Model Identification**  
   - ACF & PACF analysis  
   - Extended ACF (EACF)  
   - BIC heatmap  

5. **Model Estimation & Evaluation**  
   - Nine ARIMA models fitted  
   - ML vs CSS estimation compared  
   - Parameter significance tested  
   - Models compared using AIC, BIC, RMSE, MAE, MAPE, MASE  

6. **Model Selection**  
   - ARIMA(2,1,2) selected based on accuracy, statistical validity, and parsimony.

---

## 5. Skills Demonstrated  

- Time series analysis  
- Statistical testing (ADF, PP, Shapiro-Wilk)  
- Data transformation & stationarity handling  
- ARIMA model identification & fitting  
- Model evaluation using multiple performance metrics  
- R programming  
- Analytical reasoning & interpretation  
- Business-focused communication  

---

## 6. Results and Business Recommendation  

- Bitcoin prices are strongly non-stationary and highly volatile.  
- Log transformation and first differencing are required to stabilise the series.  
- Among nine candidate models, **ARIMA(2,1,2)** provides the best balance between:  
  - Forecast accuracy  
  - Model simplicity  
  - Statistical reliability  
  - Residual behaviour  

**Business Recommendation:**  
ARIMA(2,1,2) can be used as a baseline model for short-term forecasting and trend monitoring. It supports:

- Risk monitoring  
- Market trend analysis  
- Scenario planning  
- Data-driven trading insights  

Forecasts should be used alongside market intelligence, as cryptocurrency prices are heavily influenced by external events.

---

## 7. Next Steps  

- Incorporate **exogenous variables** (e.g. trading volume, interest rates, market sentiment).  
- Compare performance with **machine learning models** (e.g. LSTM, XGBoost).  
- Implement **rolling forecasts** to simulate real-world deployment.  
- Build a **dashboard** to visualise forecasts and confidence intervals.  
- Extend the framework to other financial assets for portfolio-level forecasting.  

