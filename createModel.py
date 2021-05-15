import logging
import os
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from pandas_datareader import data as pdr
import yfinance as yf

print("Starting Data Retrieval")

yf.pdr_override()

START_DATE = "2003-08-01"
END_DATE = "2021-05-15"

def build_stock_dataset(start=START_DATE, end=END_DATE):

    statspath = "intraQuarter/"
    ticker_list = os.listdir(statspath)
    print(ticker_list)

    # Get all Adjusted Close prices for all the tickers in our list,
    # between START_DATE and END_DATE
    all_data = pdr.get_data_yahoo(ticker_list, start, end)
    stock_data = all_data["Adj Close"]
    print(all_data)
    print(stock_data)

    # Remove any columns that hold no data, and print their tickers.
    #stock_data.dropna(how="all", axis='columns', inplace=True)
    #missing_tickers = [
    #    ticker for ticker in ticker_list if ticker.upper() not in stock_data.columns
    #]
    #print(f"{len(missing_tickers)} tickers are missing: \n {missing_tickers} ")
    # If there are only some missing datapoints, forward fill.
  
    stock_data.ffill(inplace=True)
    stock_data.to_csv("stock.csv")


def build_sp500_dataset(start=START_DATE, end=END_DATE):
    index_data = pdr.get_data_yahoo("SPY", start=START_DATE, end=END_DATE)
    index_data.to_csv("SPY_index.csv")


def build_dataset_iteratively(
    idx_start, idx_end, date_start=START_DATE, date_end=END_DATE):
    
    statspath = "intraQuarter/"
    ticker_list = os.listdir(statspath)

    df = pd.DataFrame()

    for ticker in ticker_list:
        ticker = ticker.upper()
        print(ticker)

        stock_ohlc = pdr.get_data_yahoo(ticker, start=date_start, end=date_end)
        if stock_ohlc.empty:
            print(f"No data for {ticker}")
            continue
        adj_close = stock_ohlc["Adj Close"].rename(ticker)
        df = pd.concat([df, adj_close], axis=1)
    df.to_csv("stock.csv")


if __name__ == "__main__":
    build_stock_dataset()
    build_sp500_dataset()