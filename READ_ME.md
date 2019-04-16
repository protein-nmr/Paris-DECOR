### Measurement of Very Fast Exchange Rates of Individual Amide Protons in Proteins by NMR Spectroscopy
# R. Dass, E. Corlianò, F. A. A. Mulder, ChemPhysChem 2019, 20, 231.

# requires: MATLAB https://se.mathworks.com/products/matlab.html
# All inputs are entered into input_script.m. All other '.m' files should be in the same folder. 
# Input1: experimentally observed peak intensities for each CPMG block. 
# eg. data=[intensity_cpmg2 intensity_cpmg4 intensity_cpmg8 intensity_cpmg16 intensity_with_decoupling(WALTZ65)] 
# Input2: noise level for each experiment. 
# eg. noise=[noise_cpmg2 noise_cpmg4 noise_cpmg8 noise_cpmg16 noise_with_decoupling(WALTZ65)] 
# Input3: peak labels. 
# eg. label=['A','B','C']
# Other inputs: list of cpmg pulses,  length of cpmg period, coupling constant, length of 90 pulse of the decoupling
# Output:
# rates (k) for each peak (run time: approx. 1 min per peak) 
# uncertainity (k_unc) calculated by a given no. of Monte carlo iterations. (run time: approx.5 min per peak for 100 iterations) 
# plots of fitting for each peak (saved in .svg format)