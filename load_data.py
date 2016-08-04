# -*- coding:utf-8 -*-
# carete by steve at  2016 / 08 / 02　21:49


import scipy.io as sio

import numpy as np

import matplotlib.pyplot as plt

class DataManage():
    def __init__(self,X_file="outX",Y_file="outY.txt"):
        self.X = np.loadtxt('outX.txt')
        self.Y = np.loadtxt('outY.txt')



    def normalized(self):
        self.X_log = np.zeros(self.X.shape)
        np.log(self.X,self.X_log)
        #self.X_log = self.X

        self.X_norm = np.zeros(self.X.shape)

       # print self.X_log

        X_mean =  np.nanmean(self.X_log,0)

        X_std = np.nanstd(self.X_log,0)



        for i in range(1,790):
            self.X_norm[i,:] = (self.X_log[i,:]-X_mean)/X_std

        print self.X_norm

    def display(self):
        plt.figure(1)
        plt.hold(True)

        plt.imshow(self.X_norm)

        plt.show()



if __name__ == '__main__':
    dm = DataManage()



    dm.normalized()

    dm.display()

