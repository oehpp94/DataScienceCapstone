Data Science Capstone: Final Project Presentation
========================================================
author: Oscar Hernandez
date: 03-09-2020


Overview
========================================================

The goal of this project was to use what was learned throughout the Data Science Specialization courses to develop an application capable of predicting the next word based on an input phrase. 

Using the resources provided by Coursera and Swiftkey, we were tasked to analyze a data set composed of several texts in the english language taken from blogs, twitter, and news stories. With this, we were to come up with a training set to develop a model that would predict the next potential word similar to what the keyboard apps on our phones do


Algorithm
========================================================

After separating a training set from the rest of the corpus. The data was subsequently divided into trigrams, bigrams, and unigrams. These where each measured on frequency, to discover which n-grams were the most common. 

Based on these, the algorithm takes an input and analyzes it against the trigrams, giving priority to context over potential frequency. If it fails to find a matching trigram, it then looks for a matching bigram. 

If more than one n-gram matches, the algorithm then prioritizes over frequency. I no n-gram matches, then the algorithm suggests the most common word, "the."


Project - Shiny App Instructions
========================================================

Having built this algorithm, the task now is to showcase it through a Shiny App and this presentation. After all, the algorithm needs a data product that implements it in order for it to become useful. 

Thus, the Shiny App consists on a simple website with an input text field on the left, where the user can enter a phrase in english. The app will then immediately predict the potential next word and display on the screen's main panel.

Reference Material
========================================================
 
The following are the links to the project material:

- Shiny App: https://oehpp94.shinyapps.io/DataScienceCapstone-Project/
- Source Code: https://github.com/oehpp94/DataScienceCapstone
- Exploratory Analysis: https://rpubs.com/oehpp94/MilestoneReport


