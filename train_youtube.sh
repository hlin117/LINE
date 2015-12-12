#!/bin/sh

g++ -lm -pthread -march=native -Wall -funroll-loops -ffast-math -Wno-unused-result -g line.cpp -o line -I/usr/local/include/ -L /usr/local/lib/ -lgsl -lgslcblas
g++ -lm -pthread -march=native -Wall -funroll-loops -ffast-math -Wno-unused-result -g reconstruct.cpp -o reconstruct
g++ -lm -pthread -march=native -Wall -funroll-loops -ffast-math -Wno-unused-result -g normalize.cpp -o normalize
g++ -lm -pthread -march=native -Wall -funroll-loops -ffast-math -Wno-unused-result -g concatenate.cpp -o concatenate

./reconstruct -train ppi_v10_all7.txt -output net_youtube_dense.txt -depth 2 -k-max 1000
./line -train net_youtube_dense.txt -output vec_1st_wo_norm.txt -binary 1 -size 128 -order 1 -negative 5 -samples 10000 -threads 4
./line -train net_youtube_dense.txt -output vec_2nd_wo_norm.txt -binary 1 -size 128 -order 2 -negative 5 -samples 10000 -threads 4
./normalize -input vec_1st_wo_norm.txt -output vec_1st.txt -binary 1
./normalize -input vec_2nd_wo_norm.txt -output vec_2nd.txt -binary 1
./concatenate -input1 vec_1st.txt -input2 vec_2nd.txt -output vec_all.txt -binary 1

