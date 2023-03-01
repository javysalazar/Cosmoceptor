# -*- coding: utf-8 -*-
"""
Created on Thu Apr  8 19:58:47 2021

@author: Javy
"""

def main():
    import pandas as pd
    import numpy as np 
    import matplotlib.pyplot as plt
    import random
    from math import sqrt
    
    col = ["Scn", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "A10", "Class"]
    filepath = input('Please enter the file name: ')
    df = pd.read_csv(filepath,
                     na_values='?', names = col)
    
    #filter unneccessary data
    df = df[1:]
    
    #find NAs
    Nas = df[df['A7'].isna()]
    nas_index = list(np.array(Nas.index) - 1)
    
    #calculate a7 mean
    a7 = df.A7
    a7 = np.array(a7)
    a7 = a7.astype(np.float)
    a7_mean = np.nanmean(a7)
    
    #replace nans with mean
    df = df.fillna(a7_mean)
    
    #Change data to int
    df = df.astype(int)
    
    
    #convert data to arrays because im better with numpy x(
    npdf = np.array(df)
    attributes = col[1:-1]
    
    
    for i in attributes:
        print('Attribute ' + i + " ----------------")
        print('\tMean' ,'            \t', round(df[i].mean(),1))
        print('\tMedian' ,'          \t', round(df[i].median(),1))
        print('\tVariance' ,'        \t', round(df[i].var(),1))
        print('\tStandard Deviation: ' , round(df[i].std(),1))
        print()
        
        
    
    
    #Histograms 
    
    for i in attributes:
            
        fig = plt.figure()
        
        sp = fig.add_subplot(1,1,1)
        sp.set_xlabel('Value of the attribute')
        sp.set_ylabel('Number of Data Points')
        sp.set_title('Histogram of attribute ' + str(i))
        sp.hist(df[i], bins = 10, color = 'blue', alpha = .5)
  

    #################
    #### INITIAL ####
    #################
    
    #Get two random numbers
    u2_int = random.randrange(0,df.shape[0]) 
    u4_int = random.randrange(0,df.shape[0])  
    
    u2 = pd.Series(df.iloc[u2_int,1:-1])
    u4 = pd.Series(df.iloc[u4_int, 1:-1])
    
    print('Randomly selected row '+ str(u2_int) + ' for centroid mu_2. '+ 
          '\nInitial centroid for mu_2:' + '\n' + str(u2))
    
    
    print('\nRandomly selected row '+ str(u4_int) + ' for centroid mu_4. '+ 
          '\nInitial centroid for mu_4:' + '\n' + str(u4))
    
    
    
    
    #################
    ### Recompute ###
    #################
    
    u2_prev = pd.Series([1,2])
    u4_prev = pd.Series([1])
    counter = 0
    
    while True:
        if counter == 50:
            break
        elif list(u2_prev) == list(u2) and list(u4_prev) == list(u4):
            break
        else:
            
            counter += 1 
            u2_prev = u2 
            u4_prev = u4
        
            #################
            #### ASSIGN  ####
            #################
        
            #Compute euclidian distance from the two centroids for all 699 data point
            
            d2series = pd.Series(np.sqrt(((npdf[:,1:-1] - np.array(u2))**2).sum(axis=1)), index = range(1,700))
            d4series = pd.Series(np.sqrt(((npdf[:,1:-1] - np.array(u4))**2).sum(axis=1)), index = range(1,700))
           
            
            df['Dist u2'] = d2series
            df['Dist u4'] = d4series
            df.loc[ df['Dist u2'] < df['Dist u4'] , 'Predicted Class'] = 2
            df.loc[ df['Dist u2'] > df['Dist u4'] , 'Predicted Class'] = 4
  
                
            class2 = df[df['Predicted Class'] == 2]
            u2 = pd.Series(class2.loc[:,'A2':'A10'].mean(0))  
            class4 = df[df['Predicted Class'] == 4]
            u4 = pd.Series(class4.loc[:,'A2':'A10'].mean(0))
        
            
        
    print('\nProgram ended after ' + str(counter) + ' iterations.' + '\n\n' + 
          'Final centroid for mu_2:\n' + str(u2) +  '\n\n' + 
          'Final centroid for mu_4:\n' + str(u4), end = '\n\n')
    
    
    top20 = df.loc[:20,['Scn', 'Class', 'Predicted Class']]
    print('Top 20 results\n:', top20)
    
    
    #################
    #### Phase 3 ####
    #################
    
    
    
    
    classes = df.loc[:,['Scn', 'Class', 'Predicted Class']]
    
    
    error_all = classes[ df['Class'] != df['Predicted Class']]
    class_all = len(classes)
    error_T = round(len(error_all) / class_all * 100, 1)

    
    print('\n\nTotal Errors:\t\t\t\t\t  ' + str(error_T) + "%")    
    if error_T > 50:
        print('Clusters are swapped! \nSwapping Predicted Class\n')
        classes.loc[(df['Predicted Class'] == 2),'Predicted Class'] = 4
        classes.loc[(df['Predicted Class'] == 4),'Predicted Class'] = 2
        error_all = classes[ classes['Class'] != classes['Predicted Class']]
        class_all = len(classes)
        error_T = round(len(error_all) / class_all * 100, 1)
        
    
    
    error_24 = classes[( classes["Predicted Class"] == 2) & (classes['Class'] == 4)]
    error_42 = classes[(classes['Predicted Class'] == 4) & (classes['Class'] == 2)]
    pclass_2 = len(classes[ classes['Predicted Class'] == 2])
    pclass_4 = len(classes[ classes['Predicted Class'] == 4])
    
    
    error_B = round((len(error_24) / pclass_2) * 100,1)
    error_M = round((len(error_42) / pclass_4) * 100,1)
    
    
    print("Data points in Predicted Class 2: " + str(pclass_2))
    print('Data points in Predicted Class 4: ' + str(pclass_4))
    
    print("\nError data points, Predicted Class 2:\n", error_24)
    
    print("\nError data point, Predicted Class 4:\n", error_42)
    
    print('\nNumber of all data points:\t\t  ' + str(class_all))
    print('\nNumber of error data points        ' + str(len(error_all)))
    
    print('\nError rate for class 2:           ' + str(error_B))
    print('Error rate for class 4:           ' + str(error_M))
    print('Total error rate:                 ' + str(error_T))
    
    
    
    
    
    
    




main()
