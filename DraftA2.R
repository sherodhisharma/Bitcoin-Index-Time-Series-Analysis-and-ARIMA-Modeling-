# Load necessary libraries
library(tseries)
library(forecast)
library(ggplot2)
library(lmtest)
library(TSA)

# Import the data
bitcoin_data <- read.csv("C:/Users/Sherodhi/Downloads/assignment2Data2025.csv")

# Convert to time series object
bitcoin_ts <- ts(bitcoin_data$Bitcoin, start=c(2011, 8), frequency=12)

# Summary statistics
summary(bitcoin_ts)

# Time series plot
plot(bitcoin_ts, main="Bitcoin Index (USD) from August 2011 to January 2025", 
     ylab="Index Value (USD)", xlab="Year", col="blue", lwd=1.5)

# Applying first lag 
y= bitcoin_ts
x = zlag(bitcoin_ts)
index =2:length(x)
cor(y[index],x[index])

#Applying the secong lag

index2 =3:length(x)
cor(y[index2],x[index2])

# ACF and PACF of the original series
par(mfrow=c(1,2))
acf(bitcoin_ts, main="ACF of Original Bitcoin Index Series")
pacf(bitcoin_ts, main="PACF of Original Bitcoin Index Series")

# Augmented Dickey-Fuller Test
adf_test <- adf.test(bitcoin_ts)
print(adf_test)

# Generating the qq plot
qqnorm(bitcoin_ts, main="Normal Q-Q Plot")
qqline(bitcoin_ts, col="red")

# Applying the Shapiro Wilk Test
shapiro.test(bitcoin_ts)


# Plot log-transformed series
plot(x[index],y[index], main="Original Bitcoin Price v/s Lagged Bitcoin Price", 
     ylab="Price(t)", xlab="Price(t-1)", col="blue", lwd=1.5)

# Apply log transformation
log_bitcoin_ts <- log(bitcoin_ts)

# Plot log-transformed series
plot(log_bitcoin_ts, main="Log-Transformed Bitcoin Index", 
     ylab="Log(Index Value)", xlab="Year", col="blue", lwd=1.5)

# qq plot for the log transformed data
qqnorm(log_bitcoin_ts, main="Normal Q-Q Plot of the Log Transformed Bitcoin Data")
qqline(log_bitcoin_ts, col="red")
shapiro.test(log_bitcoin_ts)

# Checking stationarity of log-transformed series
adf_test_log <- adf.test(log_bitcoin_ts)
print(adf_test_log)

# First differencing of log-transformed series
diff_log_bitcoin_ts <- diff(log_bitcoin_ts, differences=1)

# Plot differenced log-transformed series
plot(diff_log_bitcoin_ts, main="First Difference of Log-Transformed Bitcoin Index", 
     ylab="Diff(Log(Index Value))", xlab="Year", col="blue", lwd=1.5)

# Check stationarity of differenced log-transformed series
adf_test_diff_log <- adf.test(diff_log_bitcoin_ts)
print(adf_test_diff_log)

# PP Test
pp.test(diff_log_bitcoin_ts)

# Summary statistics of differenced log-transformed series
summary(diff_log_bitcoin_ts)

# ACF and PACF of the differenced log-transformed series
par(mfrow=c(1,2))
acf(diff_log_bitcoin_ts, main="ACF of Differenced Log-Transformed Series")
pacf(diff_log_bitcoin_ts, main="PACF of Differenced Log-Transformed Series")

# Calculate EACF
eacf_result <- eacf(diff_log_bitcoin_ts, ar.max=10, ma.max=15)

# Creating BIC Table 
  options(warn=-1)
  res = armasubsets(y=diff_log_bitcoin_ts,nar=5,nma=5,y.name='p',ar.method='ols')
  plot(res)

# ARIMA(1,1,0)
  model_110 <- arima(bitcoin_ts, order=c(1,1,0), method="ML")
  coeftest(model_110)
  model_110_css <- arima(bitcoin_ts, order=c(1,1,0), method="CSS")
  coeftest(model_110_css)

# ARIMA (1,1,4)
  model_114 <- arima(bitcoin_ts, order=c(1,1,4), method="ML")
  coeftest(model_114)
  model_114_css <- arima(bitcoin_ts, order=c(1,1,4), method="CSS")
  coeftest(model_114_css)

# ARIMA(5,1,4)
  model_514 <- arima(bitcoin_ts, order=c(5,1,4), method="ML")
  coeftest(model_514)
  model_514_css <- arima(bitcoin_ts, order=c(5,1,4), method="CSS")
  coeftest(model_514_css)
  
# ARIMA(0,1,1)
  model_011 <- arima(bitcoin_ts, order=c(0,1,1), method="ML")
  coeftest(model_011)
  model_011_css <- arima(bitcoin_ts, order=c(0,1,1), method="CSS")
  coeftest(model_011_css)

# ARIMA(0,1,2)
  model_012 <- arima(bitcoin_ts, order=c(0,1,2), method="ML")
  coeftest(model_012)
  model_012_css <- arima(bitcoin_ts, order=c(0,1,2), method="CSS")
  coeftest(model_012_css)
  
  
# ARIMA(1,1,2)
  model_112 <- arima(bitcoin_ts, order=c(1,1,2), method="ML")
  coeftest(model_112)
  model_112_css <- arima(bitcoin_ts, order=c(1,1,2), method="CSS")
  coeftest(model_112_css)
  
# ARIMA(1,1,1)
  model_111 <- arima(bitcoin_ts, order=c(1,1,1), method="ML")
  coeftest(model_111)
  model_111_css <- arima(bitcoin_ts, order=c(1,1,1), method="CSS")
  coeftest(model_111_css)
  
# ARIMA(2,1,2)
  model_212 <- arima(bitcoin_ts, order=c(2,1,2), method="ML")
  coeftest(model_212)
  model_212_css <- arima(bitcoin_ts, order=c(2,1,2), method="CSS")
  coeftest(model_212_css)
  
# ARIMA(3,1,2)
  model_312 <- arima(bitcoin_ts, order=c(3,1,2), method="ML")
  coeftest(model_312)
  model_312_css <- arima(bitcoin_ts, order=c(3,1,2), method="CSS")
  coeftest(model_312_css)
  
#Sorting the score
   sort.score <- function(x, score = c("bic", "aic")){
    if (score == "aic"){
      x[with(x, order(AIC)),]
    } else if (score == "bic") {
      x[with(x, order(BIC)),]
    } else {
      warning('score = "x" only accepts valid arguments ("aic","bic")')
    }
   }
   
   sort.score(AIC(model_011, model_110, model_012, model_111, 
                  model_112, model_212, model_114, model_312, model_514),
              score = "aic")
   sort.score(BIC(model_011, model_110, model_012, model_111, 
                  model_112, model_212, model_114, model_312, model_514),
              score = "bic")
   
 # Fit ARIMA models
   model_011AR <- Arima(bitcoin_ts, order=c(0,1,1), method='ML')
   model_110AR <- Arima(bitcoin_ts, order=c(1,1,0), method='ML')
   model_012AR <- Arima(bitcoin_ts, order=c(0,1,2), method='ML')
   model_111AR <- Arima(bitcoin_ts, order=c(1,1,1), method='ML')
   model_112AR <- Arima(bitcoin_ts, order=c(1,1,2), method='ML')
   model_212AR <- Arima(bitcoin_ts, order=c(2,1,2), method='ML')
   model_114AR <- Arima(bitcoin_ts, order=c(1,1,4), method='ML')
   model_312AR <- Arima(bitcoin_ts, order=c(3,1,2), method='ML')
   model_514AR <- Arima(bitcoin_ts, order=c(5,1,4), method='ML')

   Smodel_011AR <- accuracy(model_011AR)[1:7]
   Smodel_110AR <- accuracy(model_110AR)[1:7]
   Smodel_012AR <- accuracy(model_012AR)[1:7]
   Smodel_111AR <- accuracy(model_111AR)[1:7]
   Smodel_112AR <- accuracy(model_112AR)[1:7]
   Smodel_212AR <- accuracy(model_212AR)[1:7]
   Smodel_114AR <- accuracy(model_114AR)[1:7]
   Smodel_312AR <- accuracy(model_312AR)[1:7]
   Smodel_514AR <- accuracy(model_514AR)[1:7]
   
   Smodels <- data.frame(
     rbind(Smodel_011AR, Smodel_110AR, Smodel_012AR,
           Smodel_111AR, Smodel_112AR, Smodel_212AR,
           Smodel_114AR, Smodel_312AR, Smodel_514AR)
   )
   colnames(Smodels) <- c("ME", "RMSE", "MAE", "MPE", "MAPE", "MASE", "ACF1")
   rownames(Smodels) <- c("ARIMA(0,1,1)", "ARIMA(1,1,0)", "ARIMA(0,1,2)",
                             "ARIMA(1,1,1)", "ARIMA(1,1,2)", "ARIMA(2,1,2)",
                             "ARIMA(1,1,4)", "ARIMA(3,1,2)","ARIMA(5,1,4)")
   print(Smodels)
   