import pandas as pd
from sqlalchemy import create_engine
from dotenv import load_dotenv
import os

load_dotenv()
url = os.getenv('POSTGRES')
print(url)

path = './Data/cleaned.xlsx'
df = pd.read_excel(path)

df.columns = df.columns.str.strip().str.lower().str.replace(' ','_').str.replace('[^a-zA-Z0-9_]','',regex=True) 

engine = create_engine(url)

df.to_sql('sales_data',engine,index=False,if_exists='replace')

print('Upload Successfull')