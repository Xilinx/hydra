wget https://graphchallenge.s3.amazonaws.com/synthetic/sparsechallenge_2019/dnn/neuron1024-l120-categories.tsv 
wget https://graphchallenge.s3.amazonaws.com/synthetic/sparsechallenge_2019/dnn/neuron1024-l480-categories.tsv 
wget https://graphchallenge.s3.amazonaws.com/synthetic/sparsechallenge_2019/dnn/neuron1024-l1920-categories.tsv 

wget https://graphchallenge.s3.amazonaws.com/synthetic/sparsechallenge_2019/dnn/neuron4096-l120-categories.tsv 
wget https://graphchallenge.s3.amazonaws.com/synthetic/sparsechallenge_2019/dnn/neuron4096-l480-categories.tsv 
wget https://graphchallenge.s3.amazonaws.com/synthetic/sparsechallenge_2019/dnn/neuron4096-l1920-categories.tsv 

wget https://graphchallenge.s3.amazonaws.com/synthetic/sparsechallenge_2019/dnn/neuron16384-l120-categories.tsv 
wget https://graphchallenge.s3.amazonaws.com/synthetic/sparsechallenge_2019/dnn/neuron16384-l480-categories.tsv 
wget https://graphchallenge.s3.amazonaws.com/synthetic/sparsechallenge_2019/dnn/neuron16384-l1920-categories.tsv 

wget https://graphchallenge.s3.amazonaws.com/synthetic/sparsechallenge_2019/dnn/neuron65536-l120-categories.tsv 
wget https://graphchallenge.s3.amazonaws.com/synthetic/sparsechallenge_2019/dnn/neuron65536-l480-categories.tsv 
wget https://graphchallenge.s3.amazonaws.com/synthetic/sparsechallenge_2019/dnn/neuron65536-l1920-categories.tsv 



wget https://graphchallenge.s3.amazonaws.com/synthetic/sparsechallenge_2019/mnist/sparse-images-1024.tsv.gz
wget https://graphchallenge.s3.amazonaws.com/synthetic/sparsechallenge_2019/mnist/sparse-images-4096.tsv.gz
wget https://graphchallenge.s3.amazonaws.com/synthetic/sparsechallenge_2019/mnist/sparse-images-16384.tsv.gz
wget https://graphchallenge.s3.amazonaws.com/synthetic/sparsechallenge_2019/mnist/sparse-images-65536.tsv.gz


wget https://graphchallenge.s3.amazonaws.com/synthetic/sparsechallenge_2019/dnn/neuron1024.tar.gz
wget https://graphchallenge.s3.amazonaws.com/synthetic/sparsechallenge_2019/dnn/neuron4096.tar.gz
wget https://graphchallenge.s3.amazonaws.com/synthetic/sparsechallenge_2019/dnn/neuron16384.tar.gz
wget https://graphchallenge.s3.amazonaws.com/synthetic/sparsechallenge_2019/dnn/neuron65536.tar.gz


gzip -d sparse-images-1024.tsv.gz
gzip -d sparse-images-4096.tsv.gz
gzip -d sparse-images-16384.tsv.gz
gzip -d sparse-images-65536.tsv.gz


tar vxfz neuron1024.tar.gz
tar vxfz neuron4096.tar.gz
tar vxfz neuron16384.tar.gz
tar vxfz neuron65536.tar.gz

