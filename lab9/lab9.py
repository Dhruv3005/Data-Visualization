import dash
from dash import dcc
from dash import html
import yfinance as yf
from dash.dependencies import Input, Output
import pandas as pd


# Define the list of stocks to display
stocks = ['AAPL', 'GOOG']

# Define a function to retrieve the latest stock prices from the Yahoo Finance API
def get_stock_prices():
    prices = {}
    for stock in stocks:
        ticker = yf.Ticker(stock)
        df = ticker.history(period='1d')
        prices[stock] = df
    return prices

# Create the Dash app
app = dash.Dash(__name__)

# Define the app layout
app.layout = html.Div(children=[
    html.H1(children='Stock Prices'),
    dcc.Interval(id='interval', interval=5*1000, n_intervals=0),
    html.Div(id='subsections'),
])

# Define the callback function to update the subsections with the latest stock prices and graphs
@app.callback(
    dash.dependencies.Output('subsections', 'children'),
    [dash.dependencies.Input('interval', 'n_intervals')])
def update_subsections(n_intervals):
    prices = get_stock_prices()
    
    return prices

if __name__ == '__main__':
    app.run_server(debug=True)
