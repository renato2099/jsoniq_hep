import matplotlib.pyplot as plt
import pandas as pd
import argparse
import json

from importlib import reload 

def load_file(input_file):
    loaded = []
    with open(input_file) as jfile:
        for jline in jfile:
            load_dict = {}
            data = json.loads(jline)
            loaded.append({'x' : data['x'], 'y' : data['y']})
    return pd.DataFrame(loaded)

def plot_histogram(df, out_file="hist.png"):
    plt.hist(x=df.sort_values(by=['x'])['x'], bins=df['x'].size, weights=df.sort_values(by=['x'])['y'])
    plt.savefig(out_file)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--input_file', type=str, help='input file')
    args = parser.parse_args()
    df = load_file(args.input_file)
    plot_histogram(df)
