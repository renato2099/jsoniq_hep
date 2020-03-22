import matplotlib.pyplot as plt
import pandas as pd
import json

from importlib import reload 

def load_file(input_file):
    loaded = []
    with open(input_file) as jfile:
        for jline in jfile:
            load_dict = {}
            data = json.loads(jline)
            loaded.append({'group' : data['group'], 'count' : data['count']})
    return pd.DataFrame(loaded)

def plot_histogram(df, out_file="hist.png"):
    plt.hist(x=df['count'])
    plt.savefig(out_file)
