import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler
import os

def load_data(file_path):
    print(f"Loading SAP Data Export from: {file_path}...")
    try:
        df = pd.read_csv(file_path)
        df['CreationDate'] = pd.to_datetime(df['CreationDate'])
        return df
    except FileNotFoundError:
        print(f"Error: Could not find {file_path}. Make sure the dataset is in the same directory.")
        exit(1)

def apply_machine_learning(df):
    print("Applying Machine Learning (Customer Segmentation via K-Means)...")
    # Group data by customer to see purchasing behavior
    cust_behavior = df.groupby(['CustomerName']).agg({
        'NetValue': 'sum',
        'OrderQuantity': 'sum'
    }).reset_index()

    # Preprocessing
    scaler = StandardScaler()
    scaled_data = scaler.fit_transform(cust_behavior[['NetValue', 'OrderQuantity']])

    # KMeans Clustering (Segmentation into 3 tiers: e.g., Platinum, Gold, Silver)
    # Using small dataset so n_clusters=3
    kmeans = KMeans(n_clusters=3, random_state=42, n_init=10)
    cust_behavior['Segment'] = kmeans.fit_predict(scaled_data)
    
    # Map segment clusters to meaningful labels based on value
    cluster_centers = cust_behavior.groupby('Segment')['NetValue'].mean()
    sorted_clusters = cluster_centers.sort_values().index
    label_map = {sorted_clusters[0]: 'Silver/Low', sorted_clusters[1]: 'Gold/Medium', sorted_clusters[2]: 'Platinum/High'}
    cust_behavior['SegmentLabel'] = cust_behavior['Segment'].map(label_map)
    
    return cust_behavior

def generate_dashboard(df, ml_df):
    print("Generating Analytics Dashboard...")
    
    # Set the style
    sns.set_theme(style="whitegrid")
    
    # Create a figure with a 2x3 grid (now taking more space)
    fig = plt.figure(figsize=(20, 14))
    fig.suptitle('SAP Data Analytics & Machine Learning Pipeline Dashboard', fontsize=22, fontweight='bold', y=0.98)
    
    # 1. Sales Trend Over Time (Spans two columns)
    ax1 = plt.subplot(2, 3, (1, 2))
    trend_df = df.groupby('CreationDate')['NetValue'].sum().reset_index()
    sns.lineplot(data=trend_df, x='CreationDate', y='NetValue', marker='o', color='royalblue', linewidth=2.5, ax=ax1)
    ax1.set_title('Sales Revenue Trend (Global Timeline)', fontsize=14)
    ax1.set_ylabel('Total Net Value (USD)')
    ax1.set_xlabel('Order Creation Date')
    ax1.fill_between(trend_df['CreationDate'], trend_df['NetValue'], alpha=0.1, color='royalblue')
    
    # 2. Product Performance
    ax2 = plt.subplot(2, 3, 3)
    prod_df = df.groupby('MaterialDescription')[['NetValue', 'OrderQuantity']].sum().reset_index()
    sns.scatterplot(data=prod_df, x='OrderQuantity', y='NetValue', hue='MaterialDescription', s=300, alpha=0.8, palette='Set2', ax=ax2)
    ax2.set_title('Product Analysis: Quantity vs. Revenue', fontsize=14)
    ax2.set_xlabel('Total Units Sold')
    ax2.set_ylabel('Total Revenue (USD)')
    
    # 3. Top Customers by Revenue
    ax3 = plt.subplot(2, 3, 4)
    cust_df = df.groupby('CustomerName')['NetValue'].sum().sort_values(ascending=False).reset_index()
    sns.barplot(data=cust_df, x='NetValue', y='CustomerName', palette='viridis', ax=ax3, hue='CustomerName', legend=False)
    ax3.set_title('Top Customers by Historical Revenue', fontsize=14)
    ax3.set_xlabel('Total Net Value (USD)')
    ax3.set_ylabel('')
    
    # 4. Order Value Distribution (KDE)
    ax4 = plt.subplot(2, 3, 5)
    sns.histplot(data=df, x='NetValue', bins=10, kde=True, color='mediumseagreen', ax=ax4)
    ax4.set_title('Distribution of Sales Order Values', fontsize=14)
    ax4.set_xlabel('Net Value (USD)')
    ax4.set_ylabel('Frequency')

    # 5. ML Customer Segmentation Map
    ax5 = plt.subplot(2, 3, 6)
    sns.scatterplot(data=ml_df, x='OrderQuantity', y='NetValue', hue='SegmentLabel', style='SegmentLabel', s=400, palette=['red', 'orange', 'green'], ax=ax5)
    ax5.set_title('[Machine Learning] Customer Tiers (K-Means)', fontsize=14)
    ax5.set_xlabel('Total Order Quantity')
    ax5.set_ylabel('Total Gross Revenue (USD)')
    
    # Annotate the ML scatter plot with customer names
    for i in range(ml_df.shape[0]):
        ax5.text(ml_df['OrderQuantity'][i]+2, ml_df['NetValue'][i], ml_df['CustomerName'][i], 
                 horizontalalignment='left', size='small', color='black', weight='semibold')

    # Adjust layout
    plt.tight_layout()
    fig.subplots_adjust(top=0.92)
    
    # Save the dashboard 
    output_img = 'sap_ml_dashboard_output.png'
    plt.savefig(output_img, dpi=300)
    print(f"Dashboard successfully generated and saved as '{output_img}'.")
    
    plt.show()

if __name__ == "__main__":
    current_dir = os.path.dirname(os.path.abspath(__file__))
    data_file = os.path.join(current_dir, 'sap_export_data.csv')
    
    sap_dataframe = load_data(data_file)
    ml_dataframe = apply_machine_learning(sap_dataframe)
    generate_dashboard(sap_dataframe, ml_dataframe)
