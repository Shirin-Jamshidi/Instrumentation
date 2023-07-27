n_Trainset=[1 2 4 6 7 9 10 12 14 15 17 18 20 21 22 24 25 26];
n_Testset=[3 5 8 11 13 16 19 23];
J_Trainset=[99.6 99.33 98.4 97.6 97.31 96.76 96.4 95.2 94.71 93.92 93.18 93 92.64 91.62 91.49 90.84 90.6 90.4 ];
J_Testset=[103.25 100.61 97.49 98.4 100 101.5 103 106.1];
plot(n_Testset, J_Testset)
hold on
plot(n_Trainset,J_Trainset)