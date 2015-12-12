import numpy as np
import pandas as pd

output = open("vec.emb").read()
output = output.split("\n")
del output[0]
output.pop()

output = map(str.split, output)

output = pd.DataFrame(data=output)
output.set_index(0, axis=1)


