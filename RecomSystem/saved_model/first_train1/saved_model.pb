г
Е
B
AssignVariableOp
resource
value"dtype"
dtypetype
l
BatchMatMulV2
x"T
y"T
output"T"
Ttype:
2		"
adj_xbool( "
adj_ybool( 
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
>
Maximum
x"T
y"T
z"T"
Ttype:
2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
?
Mul
x"T
y"T
z"T"
Ttype:
2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
Ѕ
ResourceGather
resource
indices"Tindices
output"dtype"

batch_dimsint "
validate_indicesbool("
dtypetype"
Tindicestype:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
.
Rsqrt
x"T
y"T"
Ttype:

2
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
3
Square
x"T
y"T"
Ttype:
2
	
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
О
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring 
@
StaticRegexFullMatch	
input

output
"
patternstring
і
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 

Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	

VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 "serve*2.6.02unknown8Г

user_emb/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape
:[2*$
shared_nameuser_emb/embeddings
{
'user_emb/embeddings/Read/ReadVariableOpReadVariableOpuser_emb/embeddings*
_output_shapes

:[2*
dtype0

movie_emb/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape:
е2*%
shared_namemovie_emb/embeddings

(movie_emb/embeddings/Read/ReadVariableOpReadVariableOpmovie_emb/embeddings* 
_output_shapes
:
е2*
dtype0

user_emb1/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape
:[2*%
shared_nameuser_emb1/embeddings
}
(user_emb1/embeddings/Read/ReadVariableOpReadVariableOpuser_emb1/embeddings*
_output_shapes

:[2*
dtype0

movie_emb1/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape:
е2*&
shared_namemovie_emb1/embeddings

)movie_emb1/embeddings/Read/ReadVariableOpReadVariableOpmovie_emb1/embeddings* 
_output_shapes
:
е2*
dtype0
t
y_out/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*
shared_namey_out/kernel
m
 y_out/kernel/Read/ReadVariableOpReadVariableOpy_out/kernel*
_output_shapes

:*
dtype0
l

y_out/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_name
y_out/bias
e
y_out/bias/Read/ReadVariableOpReadVariableOp
y_out/bias*
_output_shapes
:*
dtype0
v
dense0/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:d*
shared_namedense0/kernel
o
!dense0/kernel/Read/ReadVariableOpReadVariableOpdense0/kernel*
_output_shapes

:d*
dtype0
n
dense0/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namedense0/bias
g
dense0/bias/Read/ReadVariableOpReadVariableOpdense0/bias*
_output_shapes
:*
dtype0
v
rating/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*
shared_namerating/kernel
o
!rating/kernel/Read/ReadVariableOpReadVariableOprating/kernel*
_output_shapes

:*
dtype0
n
rating/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namerating/bias
g
rating/bias/Read/ReadVariableOpReadVariableOprating/bias*
_output_shapes
:*
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
b
total_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_1
[
total_1/Read/ReadVariableOpReadVariableOptotal_1*
_output_shapes
: *
dtype0
b
count_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_1
[
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_output_shapes
: *
dtype0

Adam/user_emb/embeddings/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:[2*+
shared_nameAdam/user_emb/embeddings/m

.Adam/user_emb/embeddings/m/Read/ReadVariableOpReadVariableOpAdam/user_emb/embeddings/m*
_output_shapes

:[2*
dtype0

Adam/movie_emb/embeddings/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
е2*,
shared_nameAdam/movie_emb/embeddings/m

/Adam/movie_emb/embeddings/m/Read/ReadVariableOpReadVariableOpAdam/movie_emb/embeddings/m* 
_output_shapes
:
е2*
dtype0

Adam/user_emb1/embeddings/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:[2*,
shared_nameAdam/user_emb1/embeddings/m

/Adam/user_emb1/embeddings/m/Read/ReadVariableOpReadVariableOpAdam/user_emb1/embeddings/m*
_output_shapes

:[2*
dtype0

Adam/movie_emb1/embeddings/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
е2*-
shared_nameAdam/movie_emb1/embeddings/m

0Adam/movie_emb1/embeddings/m/Read/ReadVariableOpReadVariableOpAdam/movie_emb1/embeddings/m* 
_output_shapes
:
е2*
dtype0

Adam/y_out/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*$
shared_nameAdam/y_out/kernel/m
{
'Adam/y_out/kernel/m/Read/ReadVariableOpReadVariableOpAdam/y_out/kernel/m*
_output_shapes

:*
dtype0
z
Adam/y_out/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*"
shared_nameAdam/y_out/bias/m
s
%Adam/y_out/bias/m/Read/ReadVariableOpReadVariableOpAdam/y_out/bias/m*
_output_shapes
:*
dtype0

Adam/dense0/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:d*%
shared_nameAdam/dense0/kernel/m
}
(Adam/dense0/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense0/kernel/m*
_output_shapes

:d*
dtype0
|
Adam/dense0/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*#
shared_nameAdam/dense0/bias/m
u
&Adam/dense0/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense0/bias/m*
_output_shapes
:*
dtype0

Adam/rating/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*%
shared_nameAdam/rating/kernel/m
}
(Adam/rating/kernel/m/Read/ReadVariableOpReadVariableOpAdam/rating/kernel/m*
_output_shapes

:*
dtype0
|
Adam/rating/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*#
shared_nameAdam/rating/bias/m
u
&Adam/rating/bias/m/Read/ReadVariableOpReadVariableOpAdam/rating/bias/m*
_output_shapes
:*
dtype0

Adam/user_emb/embeddings/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:[2*+
shared_nameAdam/user_emb/embeddings/v

.Adam/user_emb/embeddings/v/Read/ReadVariableOpReadVariableOpAdam/user_emb/embeddings/v*
_output_shapes

:[2*
dtype0

Adam/movie_emb/embeddings/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
е2*,
shared_nameAdam/movie_emb/embeddings/v

/Adam/movie_emb/embeddings/v/Read/ReadVariableOpReadVariableOpAdam/movie_emb/embeddings/v* 
_output_shapes
:
е2*
dtype0

Adam/user_emb1/embeddings/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:[2*,
shared_nameAdam/user_emb1/embeddings/v

/Adam/user_emb1/embeddings/v/Read/ReadVariableOpReadVariableOpAdam/user_emb1/embeddings/v*
_output_shapes

:[2*
dtype0

Adam/movie_emb1/embeddings/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
е2*-
shared_nameAdam/movie_emb1/embeddings/v

0Adam/movie_emb1/embeddings/v/Read/ReadVariableOpReadVariableOpAdam/movie_emb1/embeddings/v* 
_output_shapes
:
е2*
dtype0

Adam/y_out/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*$
shared_nameAdam/y_out/kernel/v
{
'Adam/y_out/kernel/v/Read/ReadVariableOpReadVariableOpAdam/y_out/kernel/v*
_output_shapes

:*
dtype0
z
Adam/y_out/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*"
shared_nameAdam/y_out/bias/v
s
%Adam/y_out/bias/v/Read/ReadVariableOpReadVariableOpAdam/y_out/bias/v*
_output_shapes
:*
dtype0

Adam/dense0/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:d*%
shared_nameAdam/dense0/kernel/v
}
(Adam/dense0/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense0/kernel/v*
_output_shapes

:d*
dtype0
|
Adam/dense0/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*#
shared_nameAdam/dense0/bias/v
u
&Adam/dense0/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense0/bias/v*
_output_shapes
:*
dtype0

Adam/rating/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*%
shared_nameAdam/rating/kernel/v
}
(Adam/rating/kernel/v/Read/ReadVariableOpReadVariableOpAdam/rating/kernel/v*
_output_shapes

:*
dtype0
|
Adam/rating/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*#
shared_nameAdam/rating/bias/v
u
&Adam/rating/bias/v/Read/ReadVariableOpReadVariableOpAdam/rating/bias/v*
_output_shapes
:*
dtype0

NoOpNoOp
N
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*ЛM
valueБMBЎM BЇM
§
layer-0
layer-1
layer_with_weights-0
layer-2
layer_with_weights-1
layer-3
layer_with_weights-2
layer-4
layer_with_weights-3
layer-5
layer-6
layer-7
	layer-8

layer-9
layer-10
layer-11
layer_with_weights-4
layer-12
layer_with_weights-5
layer-13
layer-14
layer_with_weights-6
layer-15
	optimizer
regularization_losses
	variables
trainable_variables
	keras_api

signatures
 
 
b

embeddings
regularization_losses
	variables
trainable_variables
	keras_api
b

embeddings
regularization_losses
	variables
trainable_variables
 	keras_api
b
!
embeddings
"regularization_losses
#	variables
$trainable_variables
%	keras_api
b
&
embeddings
'regularization_losses
(	variables
)trainable_variables
*	keras_api
R
+regularization_losses
,	variables
-trainable_variables
.	keras_api
R
/regularization_losses
0	variables
1trainable_variables
2	keras_api
R
3regularization_losses
4	variables
5trainable_variables
6	keras_api
R
7regularization_losses
8	variables
9trainable_variables
:	keras_api
R
;regularization_losses
<	variables
=trainable_variables
>	keras_api
R
?regularization_losses
@	variables
Atrainable_variables
B	keras_api
h

Ckernel
Dbias
Eregularization_losses
F	variables
Gtrainable_variables
H	keras_api
h

Ikernel
Jbias
Kregularization_losses
L	variables
Mtrainable_variables
N	keras_api
R
Oregularization_losses
P	variables
Qtrainable_variables
R	keras_api
h

Skernel
Tbias
Uregularization_losses
V	variables
Wtrainable_variables
X	keras_api

Yiter

Zbeta_1

[beta_2
	\decay
]learning_ratemДmЕ!mЖ&mЗCmИDmЙImКJmЛSmМTmНvОvП!vР&vСCvТDvУIvФJvХSvЦTvЧ
 
F
0
1
!2
&3
C4
D5
I6
J7
S8
T9
F
0
1
!2
&3
C4
D5
I6
J7
S8
T9
­
^layer_regularization_losses
_layer_metrics
regularization_losses

`layers
	variables
ametrics
trainable_variables
bnon_trainable_variables
 
ca
VARIABLE_VALUEuser_emb/embeddings:layer_with_weights-0/embeddings/.ATTRIBUTES/VARIABLE_VALUE
 

0

0
­
clayer_regularization_losses
dlayer_metrics
regularization_losses

elayers
	variables
fmetrics
trainable_variables
gnon_trainable_variables
db
VARIABLE_VALUEmovie_emb/embeddings:layer_with_weights-1/embeddings/.ATTRIBUTES/VARIABLE_VALUE
 

0

0
­
hlayer_regularization_losses
ilayer_metrics
regularization_losses

jlayers
	variables
kmetrics
trainable_variables
lnon_trainable_variables
db
VARIABLE_VALUEuser_emb1/embeddings:layer_with_weights-2/embeddings/.ATTRIBUTES/VARIABLE_VALUE
 

!0

!0
­
mlayer_regularization_losses
nlayer_metrics
"regularization_losses

olayers
#	variables
pmetrics
$trainable_variables
qnon_trainable_variables
ec
VARIABLE_VALUEmovie_emb1/embeddings:layer_with_weights-3/embeddings/.ATTRIBUTES/VARIABLE_VALUE
 

&0

&0
­
rlayer_regularization_losses
slayer_metrics
'regularization_losses

tlayers
(	variables
umetrics
)trainable_variables
vnon_trainable_variables
 
 
 
­
wlayer_regularization_losses
xlayer_metrics
+regularization_losses

ylayers
,	variables
zmetrics
-trainable_variables
{non_trainable_variables
 
 
 
Ў
|layer_regularization_losses
}layer_metrics
/regularization_losses

~layers
0	variables
metrics
1trainable_variables
non_trainable_variables
 
 
 
В
 layer_regularization_losses
layer_metrics
3regularization_losses
layers
4	variables
metrics
5trainable_variables
non_trainable_variables
 
 
 
В
 layer_regularization_losses
layer_metrics
7regularization_losses
layers
8	variables
metrics
9trainable_variables
non_trainable_variables
 
 
 
В
 layer_regularization_losses
layer_metrics
;regularization_losses
layers
<	variables
metrics
=trainable_variables
non_trainable_variables
 
 
 
В
 layer_regularization_losses
layer_metrics
?regularization_losses
layers
@	variables
metrics
Atrainable_variables
non_trainable_variables
XV
VARIABLE_VALUEy_out/kernel6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUE
TR
VARIABLE_VALUE
y_out/bias4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUE
 

C0
D1

C0
D1
В
 layer_regularization_losses
layer_metrics
Eregularization_losses
layers
F	variables
metrics
Gtrainable_variables
non_trainable_variables
YW
VARIABLE_VALUEdense0/kernel6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUE
US
VARIABLE_VALUEdense0/bias4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUE
 

I0
J1

I0
J1
В
 layer_regularization_losses
layer_metrics
Kregularization_losses
layers
L	variables
metrics
Mtrainable_variables
non_trainable_variables
 
 
 
В
 layer_regularization_losses
 layer_metrics
Oregularization_losses
Ёlayers
P	variables
Ђmetrics
Qtrainable_variables
Ѓnon_trainable_variables
YW
VARIABLE_VALUErating/kernel6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUE
US
VARIABLE_VALUErating/bias4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUE
 

S0
T1

S0
T1
В
 Єlayer_regularization_losses
Ѕlayer_metrics
Uregularization_losses
Іlayers
V	variables
Їmetrics
Wtrainable_variables
Јnon_trainable_variables
HF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE
JH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE
ZX
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE
 
 
v
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14
15

Љ0
Њ1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
8

Ћtotal

Ќcount
­	variables
Ў	keras_api
I

Џtotal

Аcount
Б
_fn_kwargs
В	variables
Г	keras_api
OM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE
OM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE

Ћ0
Ќ1

­	variables
QO
VARIABLE_VALUEtotal_14keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE
QO
VARIABLE_VALUEcount_14keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE
 

Џ0
А1

В	variables

VARIABLE_VALUEAdam/user_emb/embeddings/mVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE

VARIABLE_VALUEAdam/movie_emb/embeddings/mVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE

VARIABLE_VALUEAdam/user_emb1/embeddings/mVlayer_with_weights-2/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE

VARIABLE_VALUEAdam/movie_emb1/embeddings/mVlayer_with_weights-3/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
{y
VARIABLE_VALUEAdam/y_out/kernel/mRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
wu
VARIABLE_VALUEAdam/y_out/bias/mPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUEAdam/dense0/kernel/mRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUEAdam/dense0/bias/mPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUEAdam/rating/kernel/mRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUEAdam/rating/bias/mPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE

VARIABLE_VALUEAdam/user_emb/embeddings/vVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE

VARIABLE_VALUEAdam/movie_emb/embeddings/vVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE

VARIABLE_VALUEAdam/user_emb1/embeddings/vVlayer_with_weights-2/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE

VARIABLE_VALUEAdam/movie_emb1/embeddings/vVlayer_with_weights-3/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
{y
VARIABLE_VALUEAdam/y_out/kernel/vRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
wu
VARIABLE_VALUEAdam/y_out/bias/vPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUEAdam/dense0/kernel/vRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUEAdam/dense0/bias/vPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUEAdam/rating/kernel/vRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUEAdam/rating/bias/vPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|
serving_default_movie_inpPlaceholder*'
_output_shapes
:џџџџџџџџџ*
dtype0*
shape:џџџџџџџџџ
{
serving_default_user_inpPlaceholder*'
_output_shapes
:џџџџџџџџџ*
dtype0*
shape:џџџџџџџџџ

StatefulPartitionedCallStatefulPartitionedCallserving_default_movie_inpserving_default_user_inpmovie_emb1/embeddingsuser_emb1/embeddingsmovie_emb/embeddingsuser_emb/embeddingsy_out/kernel
y_out/biasdense0/kerneldense0/biasrating/kernelrating/bias*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8 *,
f'R%
#__inference_signature_wrapper_42133
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
М
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename'user_emb/embeddings/Read/ReadVariableOp(movie_emb/embeddings/Read/ReadVariableOp(user_emb1/embeddings/Read/ReadVariableOp)movie_emb1/embeddings/Read/ReadVariableOp y_out/kernel/Read/ReadVariableOpy_out/bias/Read/ReadVariableOp!dense0/kernel/Read/ReadVariableOpdense0/bias/Read/ReadVariableOp!rating/kernel/Read/ReadVariableOprating/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOp.Adam/user_emb/embeddings/m/Read/ReadVariableOp/Adam/movie_emb/embeddings/m/Read/ReadVariableOp/Adam/user_emb1/embeddings/m/Read/ReadVariableOp0Adam/movie_emb1/embeddings/m/Read/ReadVariableOp'Adam/y_out/kernel/m/Read/ReadVariableOp%Adam/y_out/bias/m/Read/ReadVariableOp(Adam/dense0/kernel/m/Read/ReadVariableOp&Adam/dense0/bias/m/Read/ReadVariableOp(Adam/rating/kernel/m/Read/ReadVariableOp&Adam/rating/bias/m/Read/ReadVariableOp.Adam/user_emb/embeddings/v/Read/ReadVariableOp/Adam/movie_emb/embeddings/v/Read/ReadVariableOp/Adam/user_emb1/embeddings/v/Read/ReadVariableOp0Adam/movie_emb1/embeddings/v/Read/ReadVariableOp'Adam/y_out/kernel/v/Read/ReadVariableOp%Adam/y_out/bias/v/Read/ReadVariableOp(Adam/dense0/kernel/v/Read/ReadVariableOp&Adam/dense0/bias/v/Read/ReadVariableOp(Adam/rating/kernel/v/Read/ReadVariableOp&Adam/rating/bias/v/Read/ReadVariableOpConst*4
Tin-
+2)	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *'
f"R 
__inference__traced_save_42788
Ћ
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameuser_emb/embeddingsmovie_emb/embeddingsuser_emb1/embeddingsmovie_emb1/embeddingsy_out/kernel
y_out/biasdense0/kerneldense0/biasrating/kernelrating/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotalcounttotal_1count_1Adam/user_emb/embeddings/mAdam/movie_emb/embeddings/mAdam/user_emb1/embeddings/mAdam/movie_emb1/embeddings/mAdam/y_out/kernel/mAdam/y_out/bias/mAdam/dense0/kernel/mAdam/dense0/bias/mAdam/rating/kernel/mAdam/rating/bias/mAdam/user_emb/embeddings/vAdam/movie_emb/embeddings/vAdam/user_emb1/embeddings/vAdam/movie_emb1/embeddings/vAdam/y_out/kernel/vAdam/y_out/bias/vAdam/dense0/kernel/vAdam/dense0/bias/vAdam/rating/kernel/vAdam/rating/bias/v*3
Tin,
*2(*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 **
f%R#
!__inference__traced_restore_42915нн

щ

%__inference_y_out_layer_call_fn_42595

inputs
unknown:
	unknown_0:
identityЂStatefulPartitionedCall№
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *I
fDRB
@__inference_y_out_layer_call_and_return_conditional_losses_417252
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџ: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
ы

&__inference_rating_layer_call_fn_42647

inputs
unknown:
	unknown_0:
identityЂStatefulPartitionedCallё
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_rating_layer_call_and_return_conditional_losses_417672
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџ: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Е
O
#__inference_dot_layer_call_fn_42563
inputs_0
inputs_1
identityЩ
PartitionedCallPartitionedCallinputs_0inputs_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *G
fBR@
>__inference_dot_layer_call_and_return_conditional_losses_417132
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:џџџџџџџџџ2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:џџџџџџџџџ2:џџџџџџџџџ2:Q M
'
_output_shapes
:џџџџџџџџџ2
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:џџџџџџџџџ2
"
_user_specified_name
inputs/1
а
}
)__inference_user_emb1_layer_call_fn_42446

inputs
unknown:[2
identityЂStatefulPartitionedCallы
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_user_emb1_layer_call_and_return_conditional_losses_415902
StatefulPartitionedCall
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ22

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:џџџџџџџџџ: 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
ј:

>__inference_NCF_layer_call_and_return_conditional_losses_41972

inputs
inputs_1$
movie_emb1_41937:
е2!
user_emb1_41940:[2#
movie_emb_41943:
е2 
user_emb_41946:[2
y_out_41955:
y_out_41957:
dense0_41960:d
dense0_41962:
rating_41966:
rating_41968:
identityЂdense0/StatefulPartitionedCallЂ!movie_emb/StatefulPartitionedCallЂ"movie_emb1/StatefulPartitionedCallЂrating/StatefulPartitionedCallЂ user_emb/StatefulPartitionedCallЂ!user_emb1/StatefulPartitionedCallЂy_out/StatefulPartitionedCall
"movie_emb1/StatefulPartitionedCallStatefulPartitionedCallinputs_1movie_emb1_41937*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *N
fIRG
E__inference_movie_emb1_layer_call_and_return_conditional_losses_415762$
"movie_emb1/StatefulPartitionedCall
!user_emb1/StatefulPartitionedCallStatefulPartitionedCallinputsuser_emb1_41940*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_user_emb1_layer_call_and_return_conditional_losses_415902#
!user_emb1/StatefulPartitionedCall
!movie_emb/StatefulPartitionedCallStatefulPartitionedCallinputs_1movie_emb_41943*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_movie_emb_layer_call_and_return_conditional_losses_416042#
!movie_emb/StatefulPartitionedCall
 user_emb/StatefulPartitionedCallStatefulPartitionedCallinputsuser_emb_41946*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_user_emb_layer_call_and_return_conditional_losses_416182"
 user_emb/StatefulPartitionedCall
reshape_usr1/PartitionedCallPartitionedCall*user_emb1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_reshape_usr1_layer_call_and_return_conditional_losses_416342
reshape_usr1/PartitionedCall
reshape_movie1/PartitionedCallPartitionedCall+movie_emb1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *R
fMRK
I__inference_reshape_movie1_layer_call_and_return_conditional_losses_416482 
reshape_movie1/PartitionedCallџ
reshape_usr/PartitionedCallPartitionedCall)user_emb/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_reshape_usr_layer_call_and_return_conditional_losses_416622
reshape_usr/PartitionedCall
reshape_movie/PartitionedCallPartitionedCall*movie_emb/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_reshape_movie_layer_call_and_return_conditional_losses_416762
reshape_movie/PartitionedCall
concat/PartitionedCallPartitionedCall%reshape_usr1/PartitionedCall:output:0'reshape_movie1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџd* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_concat_layer_call_and_return_conditional_losses_416852
concat/PartitionedCall
dot/PartitionedCallPartitionedCall$reshape_usr/PartitionedCall:output:0&reshape_movie/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *G
fBR@
>__inference_dot_layer_call_and_return_conditional_losses_417132
dot/PartitionedCall
y_out/StatefulPartitionedCallStatefulPartitionedCalldot/PartitionedCall:output:0y_out_41955y_out_41957*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *I
fDRB
@__inference_y_out_layer_call_and_return_conditional_losses_417252
y_out/StatefulPartitionedCall 
dense0/StatefulPartitionedCallStatefulPartitionedCallconcat/PartitionedCall:output:0dense0_41960dense0_41962*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense0_layer_call_and_return_conditional_losses_417422 
dense0/StatefulPartitionedCall
concat2/PartitionedCallPartitionedCall&y_out/StatefulPartitionedCall:output:0'dense0/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_concat2_layer_call_and_return_conditional_losses_417552
concat2/PartitionedCallЁ
rating/StatefulPartitionedCallStatefulPartitionedCall concat2/PartitionedCall:output:0rating_41966rating_41968*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_rating_layer_call_and_return_conditional_losses_417672 
rating/StatefulPartitionedCall
IdentityIdentity'rating/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ2

IdentityР
NoOpNoOp^dense0/StatefulPartitionedCall"^movie_emb/StatefulPartitionedCall#^movie_emb1/StatefulPartitionedCall^rating/StatefulPartitionedCall!^user_emb/StatefulPartitionedCall"^user_emb1/StatefulPartitionedCall^y_out/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::џџџџџџџџџ:џџџџџџџџџ: : : : : : : : : : 2@
dense0/StatefulPartitionedCalldense0/StatefulPartitionedCall2F
!movie_emb/StatefulPartitionedCall!movie_emb/StatefulPartitionedCall2H
"movie_emb1/StatefulPartitionedCall"movie_emb1/StatefulPartitionedCall2@
rating/StatefulPartitionedCallrating/StatefulPartitionedCall2D
 user_emb/StatefulPartitionedCall user_emb/StatefulPartitionedCall2F
!user_emb1/StatefulPartitionedCall!user_emb1/StatefulPartitionedCall2>
y_out/StatefulPartitionedCally_out/StatefulPartitionedCall:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs:OK
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
ј:

>__inference_NCF_layer_call_and_return_conditional_losses_41774

inputs
inputs_1$
movie_emb1_41577:
е2!
user_emb1_41591:[2#
movie_emb_41605:
е2 
user_emb_41619:[2
y_out_41726:
y_out_41728:
dense0_41743:d
dense0_41745:
rating_41768:
rating_41770:
identityЂdense0/StatefulPartitionedCallЂ!movie_emb/StatefulPartitionedCallЂ"movie_emb1/StatefulPartitionedCallЂrating/StatefulPartitionedCallЂ user_emb/StatefulPartitionedCallЂ!user_emb1/StatefulPartitionedCallЂy_out/StatefulPartitionedCall
"movie_emb1/StatefulPartitionedCallStatefulPartitionedCallinputs_1movie_emb1_41577*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *N
fIRG
E__inference_movie_emb1_layer_call_and_return_conditional_losses_415762$
"movie_emb1/StatefulPartitionedCall
!user_emb1/StatefulPartitionedCallStatefulPartitionedCallinputsuser_emb1_41591*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_user_emb1_layer_call_and_return_conditional_losses_415902#
!user_emb1/StatefulPartitionedCall
!movie_emb/StatefulPartitionedCallStatefulPartitionedCallinputs_1movie_emb_41605*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_movie_emb_layer_call_and_return_conditional_losses_416042#
!movie_emb/StatefulPartitionedCall
 user_emb/StatefulPartitionedCallStatefulPartitionedCallinputsuser_emb_41619*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_user_emb_layer_call_and_return_conditional_losses_416182"
 user_emb/StatefulPartitionedCall
reshape_usr1/PartitionedCallPartitionedCall*user_emb1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_reshape_usr1_layer_call_and_return_conditional_losses_416342
reshape_usr1/PartitionedCall
reshape_movie1/PartitionedCallPartitionedCall+movie_emb1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *R
fMRK
I__inference_reshape_movie1_layer_call_and_return_conditional_losses_416482 
reshape_movie1/PartitionedCallџ
reshape_usr/PartitionedCallPartitionedCall)user_emb/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_reshape_usr_layer_call_and_return_conditional_losses_416622
reshape_usr/PartitionedCall
reshape_movie/PartitionedCallPartitionedCall*movie_emb/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_reshape_movie_layer_call_and_return_conditional_losses_416762
reshape_movie/PartitionedCall
concat/PartitionedCallPartitionedCall%reshape_usr1/PartitionedCall:output:0'reshape_movie1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџd* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_concat_layer_call_and_return_conditional_losses_416852
concat/PartitionedCall
dot/PartitionedCallPartitionedCall$reshape_usr/PartitionedCall:output:0&reshape_movie/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *G
fBR@
>__inference_dot_layer_call_and_return_conditional_losses_417132
dot/PartitionedCall
y_out/StatefulPartitionedCallStatefulPartitionedCalldot/PartitionedCall:output:0y_out_41726y_out_41728*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *I
fDRB
@__inference_y_out_layer_call_and_return_conditional_losses_417252
y_out/StatefulPartitionedCall 
dense0/StatefulPartitionedCallStatefulPartitionedCallconcat/PartitionedCall:output:0dense0_41743dense0_41745*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense0_layer_call_and_return_conditional_losses_417422 
dense0/StatefulPartitionedCall
concat2/PartitionedCallPartitionedCall&y_out/StatefulPartitionedCall:output:0'dense0/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_concat2_layer_call_and_return_conditional_losses_417552
concat2/PartitionedCallЁ
rating/StatefulPartitionedCallStatefulPartitionedCall concat2/PartitionedCall:output:0rating_41768rating_41770*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_rating_layer_call_and_return_conditional_losses_417672 
rating/StatefulPartitionedCall
IdentityIdentity'rating/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ2

IdentityР
NoOpNoOp^dense0/StatefulPartitionedCall"^movie_emb/StatefulPartitionedCall#^movie_emb1/StatefulPartitionedCall^rating/StatefulPartitionedCall!^user_emb/StatefulPartitionedCall"^user_emb1/StatefulPartitionedCall^y_out/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::џџџџџџџџџ:џџџџџџџџџ: : : : : : : : : : 2@
dense0/StatefulPartitionedCalldense0/StatefulPartitionedCall2F
!movie_emb/StatefulPartitionedCall!movie_emb/StatefulPartitionedCall2H
"movie_emb1/StatefulPartitionedCall"movie_emb1/StatefulPartitionedCall2@
rating/StatefulPartitionedCallrating/StatefulPartitionedCall2D
 user_emb/StatefulPartitionedCall user_emb/StatefulPartitionedCall2F
!user_emb1/StatefulPartitionedCall!user_emb1/StatefulPartitionedCall2>
y_out/StatefulPartitionedCally_out/StatefulPartitionedCall:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs:OK
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
е

*__inference_movie_emb1_layer_call_fn_42463

inputs
unknown:
е2
identityЂStatefulPartitionedCallь
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *N
fIRG
E__inference_movie_emb1_layer_call_and_return_conditional_losses_415762
StatefulPartitionedCall
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ22

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:џџџџџџџџџ: 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
и
l
B__inference_concat2_layer_call_and_return_conditional_losses_41755

inputs
inputs_1
identity\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis
concatConcatV2inputsinputs_1concat/axis:output:0*
N*
T0*'
_output_shapes
:џџџџџџџџџ2
concatc
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:џџџџџџџџџ2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:џџџџџџџџџ:џџџџџџџџџ:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs:OK
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
в

)__inference_movie_emb_layer_call_fn_42429

inputs
unknown:
е2
identityЂStatefulPartitionedCallы
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_movie_emb_layer_call_and_return_conditional_losses_416042
StatefulPartitionedCall
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ22

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:џџџџџџџџџ: 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Ъ
H
,__inference_reshape_usr1_layer_call_fn_42514

inputs
identityХ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_reshape_usr1_layer_call_and_return_conditional_losses_416342
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџ2:S O
+
_output_shapes
:џџџџџџџџџ2
 
_user_specified_nameinputs

b
F__inference_reshape_usr_layer_call_and_return_conditional_losses_41662

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2т
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
Reshape/shape/1
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapeo
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22	
Reshaped
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџ2:S O
+
_output_shapes
:џџџџџџџџџ2
 
_user_specified_nameinputs
;
Ђ
>__inference_NCF_layer_call_and_return_conditional_losses_42060
user_inp
	movie_inp$
movie_emb1_42025:
е2!
user_emb1_42028:[2#
movie_emb_42031:
е2 
user_emb_42034:[2
y_out_42043:
y_out_42045:
dense0_42048:d
dense0_42050:
rating_42054:
rating_42056:
identityЂdense0/StatefulPartitionedCallЂ!movie_emb/StatefulPartitionedCallЂ"movie_emb1/StatefulPartitionedCallЂrating/StatefulPartitionedCallЂ user_emb/StatefulPartitionedCallЂ!user_emb1/StatefulPartitionedCallЂy_out/StatefulPartitionedCall
"movie_emb1/StatefulPartitionedCallStatefulPartitionedCall	movie_inpmovie_emb1_42025*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *N
fIRG
E__inference_movie_emb1_layer_call_and_return_conditional_losses_415762$
"movie_emb1/StatefulPartitionedCall
!user_emb1/StatefulPartitionedCallStatefulPartitionedCalluser_inpuser_emb1_42028*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_user_emb1_layer_call_and_return_conditional_losses_415902#
!user_emb1/StatefulPartitionedCall
!movie_emb/StatefulPartitionedCallStatefulPartitionedCall	movie_inpmovie_emb_42031*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_movie_emb_layer_call_and_return_conditional_losses_416042#
!movie_emb/StatefulPartitionedCall
 user_emb/StatefulPartitionedCallStatefulPartitionedCalluser_inpuser_emb_42034*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_user_emb_layer_call_and_return_conditional_losses_416182"
 user_emb/StatefulPartitionedCall
reshape_usr1/PartitionedCallPartitionedCall*user_emb1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_reshape_usr1_layer_call_and_return_conditional_losses_416342
reshape_usr1/PartitionedCall
reshape_movie1/PartitionedCallPartitionedCall+movie_emb1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *R
fMRK
I__inference_reshape_movie1_layer_call_and_return_conditional_losses_416482 
reshape_movie1/PartitionedCallџ
reshape_usr/PartitionedCallPartitionedCall)user_emb/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_reshape_usr_layer_call_and_return_conditional_losses_416622
reshape_usr/PartitionedCall
reshape_movie/PartitionedCallPartitionedCall*movie_emb/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_reshape_movie_layer_call_and_return_conditional_losses_416762
reshape_movie/PartitionedCall
concat/PartitionedCallPartitionedCall%reshape_usr1/PartitionedCall:output:0'reshape_movie1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџd* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_concat_layer_call_and_return_conditional_losses_416852
concat/PartitionedCall
dot/PartitionedCallPartitionedCall$reshape_usr/PartitionedCall:output:0&reshape_movie/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *G
fBR@
>__inference_dot_layer_call_and_return_conditional_losses_417132
dot/PartitionedCall
y_out/StatefulPartitionedCallStatefulPartitionedCalldot/PartitionedCall:output:0y_out_42043y_out_42045*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *I
fDRB
@__inference_y_out_layer_call_and_return_conditional_losses_417252
y_out/StatefulPartitionedCall 
dense0/StatefulPartitionedCallStatefulPartitionedCallconcat/PartitionedCall:output:0dense0_42048dense0_42050*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense0_layer_call_and_return_conditional_losses_417422 
dense0/StatefulPartitionedCall
concat2/PartitionedCallPartitionedCall&y_out/StatefulPartitionedCall:output:0'dense0/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_concat2_layer_call_and_return_conditional_losses_417552
concat2/PartitionedCallЁ
rating/StatefulPartitionedCallStatefulPartitionedCall concat2/PartitionedCall:output:0rating_42054rating_42056*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_rating_layer_call_and_return_conditional_losses_417672 
rating/StatefulPartitionedCall
IdentityIdentity'rating/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ2

IdentityР
NoOpNoOp^dense0/StatefulPartitionedCall"^movie_emb/StatefulPartitionedCall#^movie_emb1/StatefulPartitionedCall^rating/StatefulPartitionedCall!^user_emb/StatefulPartitionedCall"^user_emb1/StatefulPartitionedCall^y_out/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::џџџџџџџџџ:џџџџџџџџџ: : : : : : : : : : 2@
dense0/StatefulPartitionedCalldense0/StatefulPartitionedCall2F
!movie_emb/StatefulPartitionedCall!movie_emb/StatefulPartitionedCall2H
"movie_emb1/StatefulPartitionedCall"movie_emb1/StatefulPartitionedCall2@
rating/StatefulPartitionedCallrating/StatefulPartitionedCall2D
 user_emb/StatefulPartitionedCall user_emb/StatefulPartitionedCall2F
!user_emb1/StatefulPartitionedCall!user_emb1/StatefulPartitionedCall2>
y_out/StatefulPartitionedCally_out/StatefulPartitionedCall:Q M
'
_output_shapes
:џџџџџџџџџ
"
_user_specified_name
user_inp:RN
'
_output_shapes
:џџџџџџџџџ
#
_user_specified_name	movie_inp
Ь
I
-__inference_reshape_movie_layer_call_fn_42497

inputs
identityЦ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_reshape_movie_layer_call_and_return_conditional_losses_416762
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџ2:S O
+
_output_shapes
:џџџџџџџџџ2
 
_user_specified_nameinputs
й
Л
>__inference_NCF_layer_call_and_return_conditional_losses_42238
inputs_0
inputs_15
!movie_emb1_embedding_lookup_42138:
е22
 user_emb1_embedding_lookup_42144:[24
 movie_emb_embedding_lookup_42150:
е21
user_emb_embedding_lookup_42156:[26
$y_out_matmul_readvariableop_resource:3
%y_out_biasadd_readvariableop_resource:7
%dense0_matmul_readvariableop_resource:d4
&dense0_biasadd_readvariableop_resource:7
%rating_matmul_readvariableop_resource:4
&rating_biasadd_readvariableop_resource:
identityЂdense0/BiasAdd/ReadVariableOpЂdense0/MatMul/ReadVariableOpЂmovie_emb/embedding_lookupЂmovie_emb1/embedding_lookupЂrating/BiasAdd/ReadVariableOpЂrating/MatMul/ReadVariableOpЂuser_emb/embedding_lookupЂuser_emb1/embedding_lookupЂy_out/BiasAdd/ReadVariableOpЂy_out/MatMul/ReadVariableOpu
movie_emb1/CastCastinputs_1*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ2
movie_emb1/CastВ
movie_emb1/embedding_lookupResourceGather!movie_emb1_embedding_lookup_42138movie_emb1/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*4
_class*
(&loc:@movie_emb1/embedding_lookup/42138*+
_output_shapes
:џџџџџџџџџ2*
dtype02
movie_emb1/embedding_lookup
$movie_emb1/embedding_lookup/IdentityIdentity$movie_emb1/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*4
_class*
(&loc:@movie_emb1/embedding_lookup/42138*+
_output_shapes
:џџџџџџџџџ22&
$movie_emb1/embedding_lookup/IdentityС
&movie_emb1/embedding_lookup/Identity_1Identity-movie_emb1/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22(
&movie_emb1/embedding_lookup/Identity_1s
user_emb1/CastCastinputs_0*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ2
user_emb1/Cast­
user_emb1/embedding_lookupResourceGather user_emb1_embedding_lookup_42144user_emb1/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*3
_class)
'%loc:@user_emb1/embedding_lookup/42144*+
_output_shapes
:џџџџџџџџџ2*
dtype02
user_emb1/embedding_lookup
#user_emb1/embedding_lookup/IdentityIdentity#user_emb1/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*3
_class)
'%loc:@user_emb1/embedding_lookup/42144*+
_output_shapes
:џџџџџџџџџ22%
#user_emb1/embedding_lookup/IdentityО
%user_emb1/embedding_lookup/Identity_1Identity,user_emb1/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22'
%user_emb1/embedding_lookup/Identity_1s
movie_emb/CastCastinputs_1*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ2
movie_emb/Cast­
movie_emb/embedding_lookupResourceGather movie_emb_embedding_lookup_42150movie_emb/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*3
_class)
'%loc:@movie_emb/embedding_lookup/42150*+
_output_shapes
:џџџџџџџџџ2*
dtype02
movie_emb/embedding_lookup
#movie_emb/embedding_lookup/IdentityIdentity#movie_emb/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*3
_class)
'%loc:@movie_emb/embedding_lookup/42150*+
_output_shapes
:џџџџџџџџџ22%
#movie_emb/embedding_lookup/IdentityО
%movie_emb/embedding_lookup/Identity_1Identity,movie_emb/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22'
%movie_emb/embedding_lookup/Identity_1q
user_emb/CastCastinputs_0*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ2
user_emb/CastЈ
user_emb/embedding_lookupResourceGatheruser_emb_embedding_lookup_42156user_emb/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*2
_class(
&$loc:@user_emb/embedding_lookup/42156*+
_output_shapes
:џџџџџџџџџ2*
dtype02
user_emb/embedding_lookup
"user_emb/embedding_lookup/IdentityIdentity"user_emb/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*2
_class(
&$loc:@user_emb/embedding_lookup/42156*+
_output_shapes
:џџџџџџџџџ22$
"user_emb/embedding_lookup/IdentityЛ
$user_emb/embedding_lookup/Identity_1Identity+user_emb/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22&
$user_emb/embedding_lookup/Identity_1
reshape_usr1/ShapeShape.user_emb1/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:2
reshape_usr1/Shape
 reshape_usr1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2"
 reshape_usr1/strided_slice/stack
"reshape_usr1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2$
"reshape_usr1/strided_slice/stack_1
"reshape_usr1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2$
"reshape_usr1/strided_slice/stack_2А
reshape_usr1/strided_sliceStridedSlicereshape_usr1/Shape:output:0)reshape_usr1/strided_slice/stack:output:0+reshape_usr1/strided_slice/stack_1:output:0+reshape_usr1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_usr1/strided_slice~
reshape_usr1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
reshape_usr1/Reshape/shape/1К
reshape_usr1/Reshape/shapePack#reshape_usr1/strided_slice:output:0%reshape_usr1/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
reshape_usr1/Reshape/shapeО
reshape_usr1/ReshapeReshape.user_emb1/embedding_lookup/Identity_1:output:0#reshape_usr1/Reshape/shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22
reshape_usr1/Reshape
reshape_movie1/ShapeShape/movie_emb1/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:2
reshape_movie1/Shape
"reshape_movie1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2$
"reshape_movie1/strided_slice/stack
$reshape_movie1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2&
$reshape_movie1/strided_slice/stack_1
$reshape_movie1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2&
$reshape_movie1/strided_slice/stack_2М
reshape_movie1/strided_sliceStridedSlicereshape_movie1/Shape:output:0+reshape_movie1/strided_slice/stack:output:0-reshape_movie1/strided_slice/stack_1:output:0-reshape_movie1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_movie1/strided_slice
reshape_movie1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22 
reshape_movie1/Reshape/shape/1Т
reshape_movie1/Reshape/shapePack%reshape_movie1/strided_slice:output:0'reshape_movie1/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
reshape_movie1/Reshape/shapeХ
reshape_movie1/ReshapeReshape/movie_emb1/embedding_lookup/Identity_1:output:0%reshape_movie1/Reshape/shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22
reshape_movie1/Reshape
reshape_usr/ShapeShape-user_emb/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:2
reshape_usr/Shape
reshape_usr/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2!
reshape_usr/strided_slice/stack
!reshape_usr/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2#
!reshape_usr/strided_slice/stack_1
!reshape_usr/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2#
!reshape_usr/strided_slice/stack_2Њ
reshape_usr/strided_sliceStridedSlicereshape_usr/Shape:output:0(reshape_usr/strided_slice/stack:output:0*reshape_usr/strided_slice/stack_1:output:0*reshape_usr/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_usr/strided_slice|
reshape_usr/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
reshape_usr/Reshape/shape/1Ж
reshape_usr/Reshape/shapePack"reshape_usr/strided_slice:output:0$reshape_usr/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
reshape_usr/Reshape/shapeК
reshape_usr/ReshapeReshape-user_emb/embedding_lookup/Identity_1:output:0"reshape_usr/Reshape/shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22
reshape_usr/Reshape
reshape_movie/ShapeShape.movie_emb/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:2
reshape_movie/Shape
!reshape_movie/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2#
!reshape_movie/strided_slice/stack
#reshape_movie/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2%
#reshape_movie/strided_slice/stack_1
#reshape_movie/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2%
#reshape_movie/strided_slice/stack_2Ж
reshape_movie/strided_sliceStridedSlicereshape_movie/Shape:output:0*reshape_movie/strided_slice/stack:output:0,reshape_movie/strided_slice/stack_1:output:0,reshape_movie/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_movie/strided_slice
reshape_movie/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
reshape_movie/Reshape/shape/1О
reshape_movie/Reshape/shapePack$reshape_movie/strided_slice:output:0&reshape_movie/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
reshape_movie/Reshape/shapeС
reshape_movie/ReshapeReshape.movie_emb/embedding_lookup/Identity_1:output:0$reshape_movie/Reshape/shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22
reshape_movie/Reshapej
concat/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/concat/axisТ
concat/concatConcatV2reshape_usr1/Reshape:output:0reshape_movie1/Reshape:output:0concat/concat/axis:output:0*
N*
T0*'
_output_shapes
:џџџџџџџџџd2
concat/concat
dot/l2_normalize/SquareSquarereshape_usr/Reshape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22
dot/l2_normalize/Square
&dot/l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2(
&dot/l2_normalize/Sum/reduction_indicesФ
dot/l2_normalize/SumSumdot/l2_normalize/Square:y:0/dot/l2_normalize/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:џџџџџџџџџ*
	keep_dims(2
dot/l2_normalize/Sum}
dot/l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *ЬМ+2
dot/l2_normalize/Maximum/yЕ
dot/l2_normalize/MaximumMaximumdot/l2_normalize/Sum:output:0#dot/l2_normalize/Maximum/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџ2
dot/l2_normalize/Maximum
dot/l2_normalize/RsqrtRsqrtdot/l2_normalize/Maximum:z:0*
T0*'
_output_shapes
:џџџџџџџџџ2
dot/l2_normalize/Rsqrt
dot/l2_normalizeMulreshape_usr/Reshape:output:0dot/l2_normalize/Rsqrt:y:0*
T0*'
_output_shapes
:џџџџџџџџџ22
dot/l2_normalize
dot/l2_normalize_1/SquareSquarereshape_movie/Reshape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22
dot/l2_normalize_1/Square
(dot/l2_normalize_1/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2*
(dot/l2_normalize_1/Sum/reduction_indicesЬ
dot/l2_normalize_1/SumSumdot/l2_normalize_1/Square:y:01dot/l2_normalize_1/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:џџџџџџџџџ*
	keep_dims(2
dot/l2_normalize_1/Sum
dot/l2_normalize_1/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *ЬМ+2
dot/l2_normalize_1/Maximum/yН
dot/l2_normalize_1/MaximumMaximumdot/l2_normalize_1/Sum:output:0%dot/l2_normalize_1/Maximum/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџ2
dot/l2_normalize_1/Maximum
dot/l2_normalize_1/RsqrtRsqrtdot/l2_normalize_1/Maximum:z:0*
T0*'
_output_shapes
:џџџџџџџџџ2
dot/l2_normalize_1/Rsqrt
dot/l2_normalize_1Mulreshape_movie/Reshape:output:0dot/l2_normalize_1/Rsqrt:y:0*
T0*'
_output_shapes
:џџџџџџџџџ22
dot/l2_normalize_1j
dot/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2
dot/ExpandDims/dim
dot/ExpandDims
ExpandDimsdot/l2_normalize:z:0dot/ExpandDims/dim:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22
dot/ExpandDimsn
dot/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B :2
dot/ExpandDims_1/dim
dot/ExpandDims_1
ExpandDimsdot/l2_normalize_1:z:0dot/ExpandDims_1/dim:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22
dot/ExpandDims_1

dot/MatMulBatchMatMulV2dot/ExpandDims:output:0dot/ExpandDims_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ2

dot/MatMulY
	dot/ShapeShapedot/MatMul:output:0*
T0*
_output_shapes
:2
	dot/Shape
dot/SqueezeSqueezedot/MatMul:output:0*
T0*'
_output_shapes
:џџџџџџџџџ*
squeeze_dims
2
dot/Squeeze
y_out/MatMul/ReadVariableOpReadVariableOp$y_out_matmul_readvariableop_resource*
_output_shapes

:*
dtype02
y_out/MatMul/ReadVariableOp
y_out/MatMulMatMuldot/Squeeze:output:0#y_out/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
y_out/MatMul
y_out/BiasAdd/ReadVariableOpReadVariableOp%y_out_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02
y_out/BiasAdd/ReadVariableOp
y_out/BiasAddBiasAddy_out/MatMul:product:0$y_out/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
y_out/BiasAddЂ
dense0/MatMul/ReadVariableOpReadVariableOp%dense0_matmul_readvariableop_resource*
_output_shapes

:d*
dtype02
dense0/MatMul/ReadVariableOp
dense0/MatMulMatMulconcat/concat:output:0$dense0/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
dense0/MatMulЁ
dense0/BiasAdd/ReadVariableOpReadVariableOp&dense0_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02
dense0/BiasAdd/ReadVariableOp
dense0/BiasAddBiasAdddense0/MatMul:product:0%dense0/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
dense0/BiasAddm
dense0/ReluReludense0/BiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџ2
dense0/Relul
concat2/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat2/concat/axisИ
concat2/concatConcatV2y_out/BiasAdd:output:0dense0/Relu:activations:0concat2/concat/axis:output:0*
N*
T0*'
_output_shapes
:џџџџџџџџџ2
concat2/concatЂ
rating/MatMul/ReadVariableOpReadVariableOp%rating_matmul_readvariableop_resource*
_output_shapes

:*
dtype02
rating/MatMul/ReadVariableOp
rating/MatMulMatMulconcat2/concat:output:0$rating/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
rating/MatMulЁ
rating/BiasAdd/ReadVariableOpReadVariableOp&rating_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02
rating/BiasAdd/ReadVariableOp
rating/BiasAddBiasAddrating/MatMul:product:0%rating/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
rating/BiasAddr
IdentityIdentityrating/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ2

Identity§
NoOpNoOp^dense0/BiasAdd/ReadVariableOp^dense0/MatMul/ReadVariableOp^movie_emb/embedding_lookup^movie_emb1/embedding_lookup^rating/BiasAdd/ReadVariableOp^rating/MatMul/ReadVariableOp^user_emb/embedding_lookup^user_emb1/embedding_lookup^y_out/BiasAdd/ReadVariableOp^y_out/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::џџџџџџџџџ:џџџџџџџџџ: : : : : : : : : : 2>
dense0/BiasAdd/ReadVariableOpdense0/BiasAdd/ReadVariableOp2<
dense0/MatMul/ReadVariableOpdense0/MatMul/ReadVariableOp28
movie_emb/embedding_lookupmovie_emb/embedding_lookup2:
movie_emb1/embedding_lookupmovie_emb1/embedding_lookup2>
rating/BiasAdd/ReadVariableOprating/BiasAdd/ReadVariableOp2<
rating/MatMul/ReadVariableOprating/MatMul/ReadVariableOp26
user_emb/embedding_lookupuser_emb/embedding_lookup28
user_emb1/embedding_lookupuser_emb1/embedding_lookup2<
y_out/BiasAdd/ReadVariableOpy_out/BiasAdd/ReadVariableOp2:
y_out/MatMul/ReadVariableOpy_out/MatMul/ReadVariableOp:Q M
'
_output_shapes
:џџџџџџџџџ
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:џџџџџџџџџ
"
_user_specified_name
inputs/1
с
n
B__inference_concat2_layer_call_and_return_conditional_losses_42622
inputs_0
inputs_1
identity\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis
concatConcatV2inputs_0inputs_1concat/axis:output:0*
N*
T0*'
_output_shapes
:џџџџџџџџџ2
concatc
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:џџџџџџџџџ2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:џџџџџџџџџ:џџџџџџџџџ:Q M
'
_output_shapes
:џџџџџџџџџ
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:џџџџџџџџџ
"
_user_specified_name
inputs/1
ы
h
>__inference_dot_layer_call_and_return_conditional_losses_41713

inputs
inputs_1
identityn
l2_normalize/SquareSquareinputs*
T0*'
_output_shapes
:џџџџџџџџџ22
l2_normalize/Square
"l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2$
"l2_normalize/Sum/reduction_indicesД
l2_normalize/SumSuml2_normalize/Square:y:0+l2_normalize/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:џџџџџџџџџ*
	keep_dims(2
l2_normalize/Sumu
l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *ЬМ+2
l2_normalize/Maximum/yЅ
l2_normalize/MaximumMaximuml2_normalize/Sum:output:0l2_normalize/Maximum/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџ2
l2_normalize/Maximum}
l2_normalize/RsqrtRsqrtl2_normalize/Maximum:z:0*
T0*'
_output_shapes
:џџџџџџџџџ2
l2_normalize/Rsqrtu
l2_normalizeMulinputsl2_normalize/Rsqrt:y:0*
T0*'
_output_shapes
:џџџџџџџџџ22
l2_normalizet
l2_normalize_1/SquareSquareinputs_1*
T0*'
_output_shapes
:џџџџџџџџџ22
l2_normalize_1/Square
$l2_normalize_1/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2&
$l2_normalize_1/Sum/reduction_indicesМ
l2_normalize_1/SumSuml2_normalize_1/Square:y:0-l2_normalize_1/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:џџџџџџџџџ*
	keep_dims(2
l2_normalize_1/Sumy
l2_normalize_1/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *ЬМ+2
l2_normalize_1/Maximum/y­
l2_normalize_1/MaximumMaximuml2_normalize_1/Sum:output:0!l2_normalize_1/Maximum/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџ2
l2_normalize_1/Maximum
l2_normalize_1/RsqrtRsqrtl2_normalize_1/Maximum:z:0*
T0*'
_output_shapes
:џџџџџџџџџ2
l2_normalize_1/Rsqrt}
l2_normalize_1Mulinputs_1l2_normalize_1/Rsqrt:y:0*
T0*'
_output_shapes
:џџџџџџџџџ22
l2_normalize_1b
ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2
ExpandDims/dim

ExpandDims
ExpandDimsl2_normalize:z:0ExpandDims/dim:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22

ExpandDimsf
ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B :2
ExpandDims_1/dim
ExpandDims_1
ExpandDimsl2_normalize_1:z:0ExpandDims_1/dim:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22
ExpandDims_1
MatMulBatchMatMulV2ExpandDims:output:0ExpandDims_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ2
MatMulM
ShapeShapeMatMul:output:0*
T0*
_output_shapes
:2
Shapew
SqueezeSqueezeMatMul:output:0*
T0*'
_output_shapes
:џџџџџџџџџ*
squeeze_dims
2	
Squeezed
IdentityIdentitySqueeze:output:0*
T0*'
_output_shapes
:џџџџџџџџџ2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:џџџџџџџџџ2:џџџџџџџџџ2:O K
'
_output_shapes
:џџџџџџџџџ2
 
_user_specified_nameinputs:OK
'
_output_shapes
:џџџџџџџџџ2
 
_user_specified_nameinputs
р
m
A__inference_concat_layer_call_and_return_conditional_losses_42570
inputs_0
inputs_1
identity\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis
concatConcatV2inputs_0inputs_1concat/axis:output:0*
N*
T0*'
_output_shapes
:џџџџџџџџџd2
concatc
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:џџџџџџџџџd2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:џџџџџџџџџ2:џџџџџџџџџ2:Q M
'
_output_shapes
:џџџџџџџџџ2
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:џџџџџџџџџ2
"
_user_specified_name
inputs/1

e
I__inference_reshape_movie1_layer_call_and_return_conditional_losses_41648

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2т
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
Reshape/shape/1
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapeo
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22	
Reshaped
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџ2:S O
+
_output_shapes
:џџџџџџџџџ2
 
_user_specified_nameinputs

d
H__inference_reshape_movie_layer_call_and_return_conditional_losses_41676

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2т
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
Reshape/shape/1
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapeo
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22	
Reshaped
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџ2:S O
+
_output_shapes
:џџџџџџџџџ2
 
_user_specified_nameinputs
Ш
G
+__inference_reshape_usr_layer_call_fn_42480

inputs
identityФ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_reshape_usr_layer_call_and_return_conditional_losses_416622
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџ2:S O
+
_output_shapes
:џџџџџџџџџ2
 
_user_specified_nameinputs
Ѓ

ђ
A__inference_rating_layer_call_and_return_conditional_losses_42638

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identityЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOp
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
MatMul
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2	
BiasAddk
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs

e
I__inference_reshape_movie1_layer_call_and_return_conditional_losses_42526

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2т
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
Reshape/shape/1
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapeo
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22	
Reshaped
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџ2:S O
+
_output_shapes
:џџџџџџџџџ2
 
_user_specified_nameinputs
х

 
D__inference_user_emb1_layer_call_and_return_conditional_losses_41590

inputs(
embedding_lookup_41584:[2
identityЂembedding_lookup]
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ2
Castћ
embedding_lookupResourceGatherembedding_lookup_41584Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*)
_class
loc:@embedding_lookup/41584*+
_output_shapes
:џџџџџџџџџ2*
dtype02
embedding_lookupь
embedding_lookup/IdentityIdentityembedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*)
_class
loc:@embedding_lookup/41584*+
_output_shapes
:џџџџџџџџџ22
embedding_lookup/Identity 
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22
embedding_lookup/Identity_1
IdentityIdentity$embedding_lookup/Identity_1:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ22

Identitya
NoOpNoOp^embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:џџџџџџџџџ: 2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Ђ

ё
@__inference_y_out_layer_call_and_return_conditional_losses_42586

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identityЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOp
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
MatMul
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2	
BiasAddk
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs

c
G__inference_reshape_usr1_layer_call_and_return_conditional_losses_42509

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2т
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
Reshape/shape/1
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapeo
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22	
Reshaped
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџ2:S O
+
_output_shapes
:џџџџџџџџџ2
 
_user_specified_nameinputs
T

__inference__traced_save_42788
file_prefix2
.savev2_user_emb_embeddings_read_readvariableop3
/savev2_movie_emb_embeddings_read_readvariableop3
/savev2_user_emb1_embeddings_read_readvariableop4
0savev2_movie_emb1_embeddings_read_readvariableop+
'savev2_y_out_kernel_read_readvariableop)
%savev2_y_out_bias_read_readvariableop,
(savev2_dense0_kernel_read_readvariableop*
&savev2_dense0_bias_read_readvariableop,
(savev2_rating_kernel_read_readvariableop*
&savev2_rating_bias_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableop9
5savev2_adam_user_emb_embeddings_m_read_readvariableop:
6savev2_adam_movie_emb_embeddings_m_read_readvariableop:
6savev2_adam_user_emb1_embeddings_m_read_readvariableop;
7savev2_adam_movie_emb1_embeddings_m_read_readvariableop2
.savev2_adam_y_out_kernel_m_read_readvariableop0
,savev2_adam_y_out_bias_m_read_readvariableop3
/savev2_adam_dense0_kernel_m_read_readvariableop1
-savev2_adam_dense0_bias_m_read_readvariableop3
/savev2_adam_rating_kernel_m_read_readvariableop1
-savev2_adam_rating_bias_m_read_readvariableop9
5savev2_adam_user_emb_embeddings_v_read_readvariableop:
6savev2_adam_movie_emb_embeddings_v_read_readvariableop:
6savev2_adam_user_emb1_embeddings_v_read_readvariableop;
7savev2_adam_movie_emb1_embeddings_v_read_readvariableop2
.savev2_adam_y_out_kernel_v_read_readvariableop0
,savev2_adam_y_out_bias_v_read_readvariableop3
/savev2_adam_dense0_kernel_v_read_readvariableop1
-savev2_adam_dense0_bias_v_read_readvariableop3
/savev2_adam_rating_kernel_v_read_readvariableop1
-savev2_adam_rating_bias_v_read_readvariableop
savev2_const

identity_1ЂMergeV2Checkpoints
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*2
StaticRegexFullMatchc
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part2
Constl
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part2	
Const_1
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: 2
Selectt

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: 2

StringJoinZ

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :2

num_shards
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 2
ShardedFilename/shardІ
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilenameМ
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:(*
dtype0*Ю
valueФBС(B:layer_with_weights-0/embeddings/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-1/embeddings/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-2/embeddings/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-3/embeddings/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-2/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-3/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-2/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-3/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2/tensor_namesи
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:(*
dtype0*c
valueZBX(B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
SaveV2/shape_and_slicesэ
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0.savev2_user_emb_embeddings_read_readvariableop/savev2_movie_emb_embeddings_read_readvariableop/savev2_user_emb1_embeddings_read_readvariableop0savev2_movie_emb1_embeddings_read_readvariableop'savev2_y_out_kernel_read_readvariableop%savev2_y_out_bias_read_readvariableop(savev2_dense0_kernel_read_readvariableop&savev2_dense0_bias_read_readvariableop(savev2_rating_kernel_read_readvariableop&savev2_rating_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop5savev2_adam_user_emb_embeddings_m_read_readvariableop6savev2_adam_movie_emb_embeddings_m_read_readvariableop6savev2_adam_user_emb1_embeddings_m_read_readvariableop7savev2_adam_movie_emb1_embeddings_m_read_readvariableop.savev2_adam_y_out_kernel_m_read_readvariableop,savev2_adam_y_out_bias_m_read_readvariableop/savev2_adam_dense0_kernel_m_read_readvariableop-savev2_adam_dense0_bias_m_read_readvariableop/savev2_adam_rating_kernel_m_read_readvariableop-savev2_adam_rating_bias_m_read_readvariableop5savev2_adam_user_emb_embeddings_v_read_readvariableop6savev2_adam_movie_emb_embeddings_v_read_readvariableop6savev2_adam_user_emb1_embeddings_v_read_readvariableop7savev2_adam_movie_emb1_embeddings_v_read_readvariableop.savev2_adam_y_out_kernel_v_read_readvariableop,savev2_adam_y_out_bias_v_read_readvariableop/savev2_adam_dense0_kernel_v_read_readvariableop-savev2_adam_dense0_bias_v_read_readvariableop/savev2_adam_rating_kernel_v_read_readvariableop-savev2_adam_rating_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *6
dtypes,
*2(	2
SaveV2К
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:2(
&MergeV2Checkpoints/checkpoint_prefixesЁ
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 2
MergeV2Checkpointsr
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 2

Identity_

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: 2

Identity_1c
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"!

identity_1Identity_1:output:0*П
_input_shapes­
Њ: :[2:
е2:[2:
е2:::d:::: : : : : : : : : :[2:
е2:[2:
е2:::d::::[2:
е2:[2:
е2:::d:::: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:$ 

_output_shapes

:[2:&"
 
_output_shapes
:
е2:$ 

_output_shapes

:[2:&"
 
_output_shapes
:
е2:$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:d: 

_output_shapes
::$	 

_output_shapes

:: 


_output_shapes
::

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :$ 

_output_shapes

:[2:&"
 
_output_shapes
:
е2:$ 

_output_shapes

:[2:&"
 
_output_shapes
:
е2:$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:d: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:[2:&"
 
_output_shapes
:
е2:$  

_output_shapes

:[2:&!"
 
_output_shapes
:
е2:$" 

_output_shapes

:: #

_output_shapes
::$$ 

_output_shapes

:d: %

_output_shapes
::$& 

_output_shapes

:: '

_output_shapes
::(

_output_shapes
: 
Ю
|
(__inference_user_emb_layer_call_fn_42412

inputs
unknown:[2
identityЂStatefulPartitionedCallъ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_user_emb_layer_call_and_return_conditional_losses_416182
StatefulPartitionedCall
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ22

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:џџџџџџџџџ: 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
ш

Ѓ
E__inference_movie_emb1_layer_call_and_return_conditional_losses_42456

inputs*
embedding_lookup_42450:
е2
identityЂembedding_lookup]
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ2
Castћ
embedding_lookupResourceGatherembedding_lookup_42450Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*)
_class
loc:@embedding_lookup/42450*+
_output_shapes
:џџџџџџџџџ2*
dtype02
embedding_lookupь
embedding_lookup/IdentityIdentityembedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*)
_class
loc:@embedding_lookup/42450*+
_output_shapes
:џџџџџџџџџ22
embedding_lookup/Identity 
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22
embedding_lookup/Identity_1
IdentityIdentity$embedding_lookup/Identity_1:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ22

Identitya
NoOpNoOp^embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:џџџџџџџџџ: 2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
ђ
ю
 __inference__wrapped_model_41557
user_inp
	movie_inp9
%ncf_movie_emb1_embedding_lookup_41457:
е26
$ncf_user_emb1_embedding_lookup_41463:[28
$ncf_movie_emb_embedding_lookup_41469:
е25
#ncf_user_emb_embedding_lookup_41475:[2:
(ncf_y_out_matmul_readvariableop_resource:7
)ncf_y_out_biasadd_readvariableop_resource:;
)ncf_dense0_matmul_readvariableop_resource:d8
*ncf_dense0_biasadd_readvariableop_resource:;
)ncf_rating_matmul_readvariableop_resource:8
*ncf_rating_biasadd_readvariableop_resource:
identityЂ!NCF/dense0/BiasAdd/ReadVariableOpЂ NCF/dense0/MatMul/ReadVariableOpЂNCF/movie_emb/embedding_lookupЂNCF/movie_emb1/embedding_lookupЂ!NCF/rating/BiasAdd/ReadVariableOpЂ NCF/rating/MatMul/ReadVariableOpЂNCF/user_emb/embedding_lookupЂNCF/user_emb1/embedding_lookupЂ NCF/y_out/BiasAdd/ReadVariableOpЂNCF/y_out/MatMul/ReadVariableOp~
NCF/movie_emb1/CastCast	movie_inp*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ2
NCF/movie_emb1/CastЦ
NCF/movie_emb1/embedding_lookupResourceGather%ncf_movie_emb1_embedding_lookup_41457NCF/movie_emb1/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*8
_class.
,*loc:@NCF/movie_emb1/embedding_lookup/41457*+
_output_shapes
:џџџџџџџџџ2*
dtype02!
NCF/movie_emb1/embedding_lookupЈ
(NCF/movie_emb1/embedding_lookup/IdentityIdentity(NCF/movie_emb1/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*8
_class.
,*loc:@NCF/movie_emb1/embedding_lookup/41457*+
_output_shapes
:џџџџџџџџџ22*
(NCF/movie_emb1/embedding_lookup/IdentityЭ
*NCF/movie_emb1/embedding_lookup/Identity_1Identity1NCF/movie_emb1/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22,
*NCF/movie_emb1/embedding_lookup/Identity_1{
NCF/user_emb1/CastCastuser_inp*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ2
NCF/user_emb1/CastС
NCF/user_emb1/embedding_lookupResourceGather$ncf_user_emb1_embedding_lookup_41463NCF/user_emb1/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*7
_class-
+)loc:@NCF/user_emb1/embedding_lookup/41463*+
_output_shapes
:џџџџџџџџџ2*
dtype02 
NCF/user_emb1/embedding_lookupЄ
'NCF/user_emb1/embedding_lookup/IdentityIdentity'NCF/user_emb1/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*7
_class-
+)loc:@NCF/user_emb1/embedding_lookup/41463*+
_output_shapes
:џџџџџџџџџ22)
'NCF/user_emb1/embedding_lookup/IdentityЪ
)NCF/user_emb1/embedding_lookup/Identity_1Identity0NCF/user_emb1/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22+
)NCF/user_emb1/embedding_lookup/Identity_1|
NCF/movie_emb/CastCast	movie_inp*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ2
NCF/movie_emb/CastС
NCF/movie_emb/embedding_lookupResourceGather$ncf_movie_emb_embedding_lookup_41469NCF/movie_emb/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*7
_class-
+)loc:@NCF/movie_emb/embedding_lookup/41469*+
_output_shapes
:џџџџџџџџџ2*
dtype02 
NCF/movie_emb/embedding_lookupЄ
'NCF/movie_emb/embedding_lookup/IdentityIdentity'NCF/movie_emb/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*7
_class-
+)loc:@NCF/movie_emb/embedding_lookup/41469*+
_output_shapes
:џџџџџџџџџ22)
'NCF/movie_emb/embedding_lookup/IdentityЪ
)NCF/movie_emb/embedding_lookup/Identity_1Identity0NCF/movie_emb/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22+
)NCF/movie_emb/embedding_lookup/Identity_1y
NCF/user_emb/CastCastuser_inp*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ2
NCF/user_emb/CastМ
NCF/user_emb/embedding_lookupResourceGather#ncf_user_emb_embedding_lookup_41475NCF/user_emb/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*6
_class,
*(loc:@NCF/user_emb/embedding_lookup/41475*+
_output_shapes
:џџџџџџџџџ2*
dtype02
NCF/user_emb/embedding_lookup 
&NCF/user_emb/embedding_lookup/IdentityIdentity&NCF/user_emb/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*6
_class,
*(loc:@NCF/user_emb/embedding_lookup/41475*+
_output_shapes
:џџџџџџџџџ22(
&NCF/user_emb/embedding_lookup/IdentityЧ
(NCF/user_emb/embedding_lookup/Identity_1Identity/NCF/user_emb/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22*
(NCF/user_emb/embedding_lookup/Identity_1
NCF/reshape_usr1/ShapeShape2NCF/user_emb1/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:2
NCF/reshape_usr1/Shape
$NCF/reshape_usr1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2&
$NCF/reshape_usr1/strided_slice/stack
&NCF/reshape_usr1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2(
&NCF/reshape_usr1/strided_slice/stack_1
&NCF/reshape_usr1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2(
&NCF/reshape_usr1/strided_slice/stack_2Ш
NCF/reshape_usr1/strided_sliceStridedSliceNCF/reshape_usr1/Shape:output:0-NCF/reshape_usr1/strided_slice/stack:output:0/NCF/reshape_usr1/strided_slice/stack_1:output:0/NCF/reshape_usr1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2 
NCF/reshape_usr1/strided_slice
 NCF/reshape_usr1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22"
 NCF/reshape_usr1/Reshape/shape/1Ъ
NCF/reshape_usr1/Reshape/shapePack'NCF/reshape_usr1/strided_slice:output:0)NCF/reshape_usr1/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2 
NCF/reshape_usr1/Reshape/shapeЮ
NCF/reshape_usr1/ReshapeReshape2NCF/user_emb1/embedding_lookup/Identity_1:output:0'NCF/reshape_usr1/Reshape/shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22
NCF/reshape_usr1/Reshape
NCF/reshape_movie1/ShapeShape3NCF/movie_emb1/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:2
NCF/reshape_movie1/Shape
&NCF/reshape_movie1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2(
&NCF/reshape_movie1/strided_slice/stack
(NCF/reshape_movie1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2*
(NCF/reshape_movie1/strided_slice/stack_1
(NCF/reshape_movie1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2*
(NCF/reshape_movie1/strided_slice/stack_2д
 NCF/reshape_movie1/strided_sliceStridedSlice!NCF/reshape_movie1/Shape:output:0/NCF/reshape_movie1/strided_slice/stack:output:01NCF/reshape_movie1/strided_slice/stack_1:output:01NCF/reshape_movie1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2"
 NCF/reshape_movie1/strided_slice
"NCF/reshape_movie1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22$
"NCF/reshape_movie1/Reshape/shape/1в
 NCF/reshape_movie1/Reshape/shapePack)NCF/reshape_movie1/strided_slice:output:0+NCF/reshape_movie1/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2"
 NCF/reshape_movie1/Reshape/shapeе
NCF/reshape_movie1/ReshapeReshape3NCF/movie_emb1/embedding_lookup/Identity_1:output:0)NCF/reshape_movie1/Reshape/shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22
NCF/reshape_movie1/Reshape
NCF/reshape_usr/ShapeShape1NCF/user_emb/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:2
NCF/reshape_usr/Shape
#NCF/reshape_usr/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2%
#NCF/reshape_usr/strided_slice/stack
%NCF/reshape_usr/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2'
%NCF/reshape_usr/strided_slice/stack_1
%NCF/reshape_usr/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2'
%NCF/reshape_usr/strided_slice/stack_2Т
NCF/reshape_usr/strided_sliceStridedSliceNCF/reshape_usr/Shape:output:0,NCF/reshape_usr/strided_slice/stack:output:0.NCF/reshape_usr/strided_slice/stack_1:output:0.NCF/reshape_usr/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
NCF/reshape_usr/strided_slice
NCF/reshape_usr/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22!
NCF/reshape_usr/Reshape/shape/1Ц
NCF/reshape_usr/Reshape/shapePack&NCF/reshape_usr/strided_slice:output:0(NCF/reshape_usr/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
NCF/reshape_usr/Reshape/shapeЪ
NCF/reshape_usr/ReshapeReshape1NCF/user_emb/embedding_lookup/Identity_1:output:0&NCF/reshape_usr/Reshape/shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22
NCF/reshape_usr/Reshape
NCF/reshape_movie/ShapeShape2NCF/movie_emb/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:2
NCF/reshape_movie/Shape
%NCF/reshape_movie/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%NCF/reshape_movie/strided_slice/stack
'NCF/reshape_movie/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'NCF/reshape_movie/strided_slice/stack_1
'NCF/reshape_movie/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'NCF/reshape_movie/strided_slice/stack_2Ю
NCF/reshape_movie/strided_sliceStridedSlice NCF/reshape_movie/Shape:output:0.NCF/reshape_movie/strided_slice/stack:output:00NCF/reshape_movie/strided_slice/stack_1:output:00NCF/reshape_movie/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2!
NCF/reshape_movie/strided_slice
!NCF/reshape_movie/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22#
!NCF/reshape_movie/Reshape/shape/1Ю
NCF/reshape_movie/Reshape/shapePack(NCF/reshape_movie/strided_slice:output:0*NCF/reshape_movie/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2!
NCF/reshape_movie/Reshape/shapeб
NCF/reshape_movie/ReshapeReshape2NCF/movie_emb/embedding_lookup/Identity_1:output:0(NCF/reshape_movie/Reshape/shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22
NCF/reshape_movie/Reshaper
NCF/concat/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
NCF/concat/concat/axisж
NCF/concat/concatConcatV2!NCF/reshape_usr1/Reshape:output:0#NCF/reshape_movie1/Reshape:output:0NCF/concat/concat/axis:output:0*
N*
T0*'
_output_shapes
:џџџџџџџџџd2
NCF/concat/concat
NCF/dot/l2_normalize/SquareSquare NCF/reshape_usr/Reshape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22
NCF/dot/l2_normalize/Square
*NCF/dot/l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2,
*NCF/dot/l2_normalize/Sum/reduction_indicesд
NCF/dot/l2_normalize/SumSumNCF/dot/l2_normalize/Square:y:03NCF/dot/l2_normalize/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:џџџџџџџџџ*
	keep_dims(2
NCF/dot/l2_normalize/Sum
NCF/dot/l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *ЬМ+2 
NCF/dot/l2_normalize/Maximum/yХ
NCF/dot/l2_normalize/MaximumMaximum!NCF/dot/l2_normalize/Sum:output:0'NCF/dot/l2_normalize/Maximum/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџ2
NCF/dot/l2_normalize/Maximum
NCF/dot/l2_normalize/RsqrtRsqrt NCF/dot/l2_normalize/Maximum:z:0*
T0*'
_output_shapes
:џџџџџџџџџ2
NCF/dot/l2_normalize/RsqrtЇ
NCF/dot/l2_normalizeMul NCF/reshape_usr/Reshape:output:0NCF/dot/l2_normalize/Rsqrt:y:0*
T0*'
_output_shapes
:џџџџџџџџџ22
NCF/dot/l2_normalize
NCF/dot/l2_normalize_1/SquareSquare"NCF/reshape_movie/Reshape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22
NCF/dot/l2_normalize_1/Square
,NCF/dot/l2_normalize_1/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2.
,NCF/dot/l2_normalize_1/Sum/reduction_indicesм
NCF/dot/l2_normalize_1/SumSum!NCF/dot/l2_normalize_1/Square:y:05NCF/dot/l2_normalize_1/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:џџџџџџџџџ*
	keep_dims(2
NCF/dot/l2_normalize_1/Sum
 NCF/dot/l2_normalize_1/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *ЬМ+2"
 NCF/dot/l2_normalize_1/Maximum/yЭ
NCF/dot/l2_normalize_1/MaximumMaximum#NCF/dot/l2_normalize_1/Sum:output:0)NCF/dot/l2_normalize_1/Maximum/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџ2 
NCF/dot/l2_normalize_1/Maximum
NCF/dot/l2_normalize_1/RsqrtRsqrt"NCF/dot/l2_normalize_1/Maximum:z:0*
T0*'
_output_shapes
:џџџџџџџџџ2
NCF/dot/l2_normalize_1/RsqrtЏ
NCF/dot/l2_normalize_1Mul"NCF/reshape_movie/Reshape:output:0 NCF/dot/l2_normalize_1/Rsqrt:y:0*
T0*'
_output_shapes
:џџџџџџџџџ22
NCF/dot/l2_normalize_1r
NCF/dot/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2
NCF/dot/ExpandDims/dimЇ
NCF/dot/ExpandDims
ExpandDimsNCF/dot/l2_normalize:z:0NCF/dot/ExpandDims/dim:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22
NCF/dot/ExpandDimsv
NCF/dot/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B :2
NCF/dot/ExpandDims_1/dimЏ
NCF/dot/ExpandDims_1
ExpandDimsNCF/dot/l2_normalize_1:z:0!NCF/dot/ExpandDims_1/dim:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22
NCF/dot/ExpandDims_1Ѓ
NCF/dot/MatMulBatchMatMulV2NCF/dot/ExpandDims:output:0NCF/dot/ExpandDims_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ2
NCF/dot/MatMule
NCF/dot/ShapeShapeNCF/dot/MatMul:output:0*
T0*
_output_shapes
:2
NCF/dot/Shape
NCF/dot/SqueezeSqueezeNCF/dot/MatMul:output:0*
T0*'
_output_shapes
:џџџџџџџџџ*
squeeze_dims
2
NCF/dot/SqueezeЋ
NCF/y_out/MatMul/ReadVariableOpReadVariableOp(ncf_y_out_matmul_readvariableop_resource*
_output_shapes

:*
dtype02!
NCF/y_out/MatMul/ReadVariableOpЃ
NCF/y_out/MatMulMatMulNCF/dot/Squeeze:output:0'NCF/y_out/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
NCF/y_out/MatMulЊ
 NCF/y_out/BiasAdd/ReadVariableOpReadVariableOp)ncf_y_out_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02"
 NCF/y_out/BiasAdd/ReadVariableOpЉ
NCF/y_out/BiasAddBiasAddNCF/y_out/MatMul:product:0(NCF/y_out/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
NCF/y_out/BiasAddЎ
 NCF/dense0/MatMul/ReadVariableOpReadVariableOp)ncf_dense0_matmul_readvariableop_resource*
_output_shapes

:d*
dtype02"
 NCF/dense0/MatMul/ReadVariableOpЈ
NCF/dense0/MatMulMatMulNCF/concat/concat:output:0(NCF/dense0/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
NCF/dense0/MatMul­
!NCF/dense0/BiasAdd/ReadVariableOpReadVariableOp*ncf_dense0_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02#
!NCF/dense0/BiasAdd/ReadVariableOp­
NCF/dense0/BiasAddBiasAddNCF/dense0/MatMul:product:0)NCF/dense0/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
NCF/dense0/BiasAddy
NCF/dense0/ReluReluNCF/dense0/BiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџ2
NCF/dense0/Relut
NCF/concat2/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
NCF/concat2/concat/axisЬ
NCF/concat2/concatConcatV2NCF/y_out/BiasAdd:output:0NCF/dense0/Relu:activations:0 NCF/concat2/concat/axis:output:0*
N*
T0*'
_output_shapes
:џџџџџџџџџ2
NCF/concat2/concatЎ
 NCF/rating/MatMul/ReadVariableOpReadVariableOp)ncf_rating_matmul_readvariableop_resource*
_output_shapes

:*
dtype02"
 NCF/rating/MatMul/ReadVariableOpЉ
NCF/rating/MatMulMatMulNCF/concat2/concat:output:0(NCF/rating/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
NCF/rating/MatMul­
!NCF/rating/BiasAdd/ReadVariableOpReadVariableOp*ncf_rating_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02#
!NCF/rating/BiasAdd/ReadVariableOp­
NCF/rating/BiasAddBiasAddNCF/rating/MatMul:product:0)NCF/rating/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
NCF/rating/BiasAddv
IdentityIdentityNCF/rating/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ2

IdentityЅ
NoOpNoOp"^NCF/dense0/BiasAdd/ReadVariableOp!^NCF/dense0/MatMul/ReadVariableOp^NCF/movie_emb/embedding_lookup ^NCF/movie_emb1/embedding_lookup"^NCF/rating/BiasAdd/ReadVariableOp!^NCF/rating/MatMul/ReadVariableOp^NCF/user_emb/embedding_lookup^NCF/user_emb1/embedding_lookup!^NCF/y_out/BiasAdd/ReadVariableOp ^NCF/y_out/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::џџџџџџџџџ:џџџџџџџџџ: : : : : : : : : : 2F
!NCF/dense0/BiasAdd/ReadVariableOp!NCF/dense0/BiasAdd/ReadVariableOp2D
 NCF/dense0/MatMul/ReadVariableOp NCF/dense0/MatMul/ReadVariableOp2@
NCF/movie_emb/embedding_lookupNCF/movie_emb/embedding_lookup2B
NCF/movie_emb1/embedding_lookupNCF/movie_emb1/embedding_lookup2F
!NCF/rating/BiasAdd/ReadVariableOp!NCF/rating/BiasAdd/ReadVariableOp2D
 NCF/rating/MatMul/ReadVariableOp NCF/rating/MatMul/ReadVariableOp2>
NCF/user_emb/embedding_lookupNCF/user_emb/embedding_lookup2@
NCF/user_emb1/embedding_lookupNCF/user_emb1/embedding_lookup2D
 NCF/y_out/BiasAdd/ReadVariableOp NCF/y_out/BiasAdd/ReadVariableOp2B
NCF/y_out/MatMul/ReadVariableOpNCF/y_out/MatMul/ReadVariableOp:Q M
'
_output_shapes
:џџџџџџџџџ
"
_user_specified_name
user_inp:RN
'
_output_shapes
:џџџџџџџџџ
#
_user_specified_name	movie_inp
џ

ђ
A__inference_dense0_layer_call_and_return_conditional_losses_42606

inputs0
matmul_readvariableop_resource:d-
biasadd_readvariableop_resource:
identityЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOp
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:d*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
MatMul
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџ2
Relum
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџd: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:џџџџџџџџџd
 
_user_specified_nameinputs
з
k
A__inference_concat_layer_call_and_return_conditional_losses_41685

inputs
inputs_1
identity\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis
concatConcatV2inputsinputs_1concat/axis:output:0*
N*
T0*'
_output_shapes
:џџџџџџџџџd2
concatc
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:џџџџџџџџџd2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:џџџџџџџџџ2:џџџџџџџџџ2:O K
'
_output_shapes
:џџџџџџџџџ2
 
_user_specified_nameinputs:OK
'
_output_shapes
:џџџџџџџџџ2
 
_user_specified_nameinputs
џ

ђ
A__inference_dense0_layer_call_and_return_conditional_losses_41742

inputs0
matmul_readvariableop_resource:d-
biasadd_readvariableop_resource:
identityЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOp
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:d*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
MatMul
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџ2
Relum
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџd: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:џџџџџџџџџd
 
_user_specified_nameinputs
ш

Ѓ
E__inference_movie_emb1_layer_call_and_return_conditional_losses_41576

inputs*
embedding_lookup_41570:
е2
identityЂembedding_lookup]
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ2
Castћ
embedding_lookupResourceGatherembedding_lookup_41570Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*)
_class
loc:@embedding_lookup/41570*+
_output_shapes
:џџџџџџџџџ2*
dtype02
embedding_lookupь
embedding_lookup/IdentityIdentityembedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*)
_class
loc:@embedding_lookup/41570*+
_output_shapes
:џџџџџџџџџ22
embedding_lookup/Identity 
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22
embedding_lookup/Identity_1
IdentityIdentity$embedding_lookup/Identity_1:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ22

Identitya
NoOpNoOp^embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:џџџџџџџџџ: 2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
;
Ђ
>__inference_NCF_layer_call_and_return_conditional_losses_42099
user_inp
	movie_inp$
movie_emb1_42064:
е2!
user_emb1_42067:[2#
movie_emb_42070:
е2 
user_emb_42073:[2
y_out_42082:
y_out_42084:
dense0_42087:d
dense0_42089:
rating_42093:
rating_42095:
identityЂdense0/StatefulPartitionedCallЂ!movie_emb/StatefulPartitionedCallЂ"movie_emb1/StatefulPartitionedCallЂrating/StatefulPartitionedCallЂ user_emb/StatefulPartitionedCallЂ!user_emb1/StatefulPartitionedCallЂy_out/StatefulPartitionedCall
"movie_emb1/StatefulPartitionedCallStatefulPartitionedCall	movie_inpmovie_emb1_42064*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *N
fIRG
E__inference_movie_emb1_layer_call_and_return_conditional_losses_415762$
"movie_emb1/StatefulPartitionedCall
!user_emb1/StatefulPartitionedCallStatefulPartitionedCalluser_inpuser_emb1_42067*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_user_emb1_layer_call_and_return_conditional_losses_415902#
!user_emb1/StatefulPartitionedCall
!movie_emb/StatefulPartitionedCallStatefulPartitionedCall	movie_inpmovie_emb_42070*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_movie_emb_layer_call_and_return_conditional_losses_416042#
!movie_emb/StatefulPartitionedCall
 user_emb/StatefulPartitionedCallStatefulPartitionedCalluser_inpuser_emb_42073*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_user_emb_layer_call_and_return_conditional_losses_416182"
 user_emb/StatefulPartitionedCall
reshape_usr1/PartitionedCallPartitionedCall*user_emb1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_reshape_usr1_layer_call_and_return_conditional_losses_416342
reshape_usr1/PartitionedCall
reshape_movie1/PartitionedCallPartitionedCall+movie_emb1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *R
fMRK
I__inference_reshape_movie1_layer_call_and_return_conditional_losses_416482 
reshape_movie1/PartitionedCallџ
reshape_usr/PartitionedCallPartitionedCall)user_emb/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_reshape_usr_layer_call_and_return_conditional_losses_416622
reshape_usr/PartitionedCall
reshape_movie/PartitionedCallPartitionedCall*movie_emb/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_reshape_movie_layer_call_and_return_conditional_losses_416762
reshape_movie/PartitionedCall
concat/PartitionedCallPartitionedCall%reshape_usr1/PartitionedCall:output:0'reshape_movie1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџd* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_concat_layer_call_and_return_conditional_losses_416852
concat/PartitionedCall
dot/PartitionedCallPartitionedCall$reshape_usr/PartitionedCall:output:0&reshape_movie/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *G
fBR@
>__inference_dot_layer_call_and_return_conditional_losses_417132
dot/PartitionedCall
y_out/StatefulPartitionedCallStatefulPartitionedCalldot/PartitionedCall:output:0y_out_42082y_out_42084*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *I
fDRB
@__inference_y_out_layer_call_and_return_conditional_losses_417252
y_out/StatefulPartitionedCall 
dense0/StatefulPartitionedCallStatefulPartitionedCallconcat/PartitionedCall:output:0dense0_42087dense0_42089*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense0_layer_call_and_return_conditional_losses_417422 
dense0/StatefulPartitionedCall
concat2/PartitionedCallPartitionedCall&y_out/StatefulPartitionedCall:output:0'dense0/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_concat2_layer_call_and_return_conditional_losses_417552
concat2/PartitionedCallЁ
rating/StatefulPartitionedCallStatefulPartitionedCall concat2/PartitionedCall:output:0rating_42093rating_42095*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_rating_layer_call_and_return_conditional_losses_417672 
rating/StatefulPartitionedCall
IdentityIdentity'rating/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ2

IdentityР
NoOpNoOp^dense0/StatefulPartitionedCall"^movie_emb/StatefulPartitionedCall#^movie_emb1/StatefulPartitionedCall^rating/StatefulPartitionedCall!^user_emb/StatefulPartitionedCall"^user_emb1/StatefulPartitionedCall^y_out/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::џџџџџџџџџ:џџџџџџџџџ: : : : : : : : : : 2@
dense0/StatefulPartitionedCalldense0/StatefulPartitionedCall2F
!movie_emb/StatefulPartitionedCall!movie_emb/StatefulPartitionedCall2H
"movie_emb1/StatefulPartitionedCall"movie_emb1/StatefulPartitionedCall2@
rating/StatefulPartitionedCallrating/StatefulPartitionedCall2D
 user_emb/StatefulPartitionedCall user_emb/StatefulPartitionedCall2F
!user_emb1/StatefulPartitionedCall!user_emb1/StatefulPartitionedCall2>
y_out/StatefulPartitionedCally_out/StatefulPartitionedCall:Q M
'
_output_shapes
:џџџџџџџџџ
"
_user_specified_name
user_inp:RN
'
_output_shapes
:џџџџџџџџџ
#
_user_specified_name	movie_inp
Н
S
'__inference_concat2_layer_call_fn_42628
inputs_0
inputs_1
identityЭ
PartitionedCallPartitionedCallinputs_0inputs_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_concat2_layer_call_and_return_conditional_losses_417552
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:џџџџџџџџџ2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:џџџџџџџџџ:џџџџџџџџџ:Q M
'
_output_shapes
:џџџџџџџџџ
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:џџџџџџџџџ
"
_user_specified_name
inputs/1
ы

&__inference_dense0_layer_call_fn_42615

inputs
unknown:d
	unknown_0:
identityЂStatefulPartitionedCallё
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense0_layer_call_and_return_conditional_losses_417422
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџd: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:џџџџџџџџџd
 
_user_specified_nameinputs
й
Л
>__inference_NCF_layer_call_and_return_conditional_losses_42343
inputs_0
inputs_15
!movie_emb1_embedding_lookup_42243:
е22
 user_emb1_embedding_lookup_42249:[24
 movie_emb_embedding_lookup_42255:
е21
user_emb_embedding_lookup_42261:[26
$y_out_matmul_readvariableop_resource:3
%y_out_biasadd_readvariableop_resource:7
%dense0_matmul_readvariableop_resource:d4
&dense0_biasadd_readvariableop_resource:7
%rating_matmul_readvariableop_resource:4
&rating_biasadd_readvariableop_resource:
identityЂdense0/BiasAdd/ReadVariableOpЂdense0/MatMul/ReadVariableOpЂmovie_emb/embedding_lookupЂmovie_emb1/embedding_lookupЂrating/BiasAdd/ReadVariableOpЂrating/MatMul/ReadVariableOpЂuser_emb/embedding_lookupЂuser_emb1/embedding_lookupЂy_out/BiasAdd/ReadVariableOpЂy_out/MatMul/ReadVariableOpu
movie_emb1/CastCastinputs_1*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ2
movie_emb1/CastВ
movie_emb1/embedding_lookupResourceGather!movie_emb1_embedding_lookup_42243movie_emb1/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*4
_class*
(&loc:@movie_emb1/embedding_lookup/42243*+
_output_shapes
:џџџџџџџџџ2*
dtype02
movie_emb1/embedding_lookup
$movie_emb1/embedding_lookup/IdentityIdentity$movie_emb1/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*4
_class*
(&loc:@movie_emb1/embedding_lookup/42243*+
_output_shapes
:џџџџџџџџџ22&
$movie_emb1/embedding_lookup/IdentityС
&movie_emb1/embedding_lookup/Identity_1Identity-movie_emb1/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22(
&movie_emb1/embedding_lookup/Identity_1s
user_emb1/CastCastinputs_0*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ2
user_emb1/Cast­
user_emb1/embedding_lookupResourceGather user_emb1_embedding_lookup_42249user_emb1/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*3
_class)
'%loc:@user_emb1/embedding_lookup/42249*+
_output_shapes
:џџџџџџџџџ2*
dtype02
user_emb1/embedding_lookup
#user_emb1/embedding_lookup/IdentityIdentity#user_emb1/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*3
_class)
'%loc:@user_emb1/embedding_lookup/42249*+
_output_shapes
:џџџџџџџџџ22%
#user_emb1/embedding_lookup/IdentityО
%user_emb1/embedding_lookup/Identity_1Identity,user_emb1/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22'
%user_emb1/embedding_lookup/Identity_1s
movie_emb/CastCastinputs_1*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ2
movie_emb/Cast­
movie_emb/embedding_lookupResourceGather movie_emb_embedding_lookup_42255movie_emb/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*3
_class)
'%loc:@movie_emb/embedding_lookup/42255*+
_output_shapes
:џџџџџџџџџ2*
dtype02
movie_emb/embedding_lookup
#movie_emb/embedding_lookup/IdentityIdentity#movie_emb/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*3
_class)
'%loc:@movie_emb/embedding_lookup/42255*+
_output_shapes
:џџџџџџџџџ22%
#movie_emb/embedding_lookup/IdentityО
%movie_emb/embedding_lookup/Identity_1Identity,movie_emb/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22'
%movie_emb/embedding_lookup/Identity_1q
user_emb/CastCastinputs_0*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ2
user_emb/CastЈ
user_emb/embedding_lookupResourceGatheruser_emb_embedding_lookup_42261user_emb/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*2
_class(
&$loc:@user_emb/embedding_lookup/42261*+
_output_shapes
:џџџџџџџџџ2*
dtype02
user_emb/embedding_lookup
"user_emb/embedding_lookup/IdentityIdentity"user_emb/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*2
_class(
&$loc:@user_emb/embedding_lookup/42261*+
_output_shapes
:џџџџџџџџџ22$
"user_emb/embedding_lookup/IdentityЛ
$user_emb/embedding_lookup/Identity_1Identity+user_emb/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22&
$user_emb/embedding_lookup/Identity_1
reshape_usr1/ShapeShape.user_emb1/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:2
reshape_usr1/Shape
 reshape_usr1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2"
 reshape_usr1/strided_slice/stack
"reshape_usr1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2$
"reshape_usr1/strided_slice/stack_1
"reshape_usr1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2$
"reshape_usr1/strided_slice/stack_2А
reshape_usr1/strided_sliceStridedSlicereshape_usr1/Shape:output:0)reshape_usr1/strided_slice/stack:output:0+reshape_usr1/strided_slice/stack_1:output:0+reshape_usr1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_usr1/strided_slice~
reshape_usr1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
reshape_usr1/Reshape/shape/1К
reshape_usr1/Reshape/shapePack#reshape_usr1/strided_slice:output:0%reshape_usr1/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
reshape_usr1/Reshape/shapeО
reshape_usr1/ReshapeReshape.user_emb1/embedding_lookup/Identity_1:output:0#reshape_usr1/Reshape/shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22
reshape_usr1/Reshape
reshape_movie1/ShapeShape/movie_emb1/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:2
reshape_movie1/Shape
"reshape_movie1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2$
"reshape_movie1/strided_slice/stack
$reshape_movie1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2&
$reshape_movie1/strided_slice/stack_1
$reshape_movie1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2&
$reshape_movie1/strided_slice/stack_2М
reshape_movie1/strided_sliceStridedSlicereshape_movie1/Shape:output:0+reshape_movie1/strided_slice/stack:output:0-reshape_movie1/strided_slice/stack_1:output:0-reshape_movie1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_movie1/strided_slice
reshape_movie1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22 
reshape_movie1/Reshape/shape/1Т
reshape_movie1/Reshape/shapePack%reshape_movie1/strided_slice:output:0'reshape_movie1/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
reshape_movie1/Reshape/shapeХ
reshape_movie1/ReshapeReshape/movie_emb1/embedding_lookup/Identity_1:output:0%reshape_movie1/Reshape/shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22
reshape_movie1/Reshape
reshape_usr/ShapeShape-user_emb/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:2
reshape_usr/Shape
reshape_usr/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2!
reshape_usr/strided_slice/stack
!reshape_usr/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2#
!reshape_usr/strided_slice/stack_1
!reshape_usr/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2#
!reshape_usr/strided_slice/stack_2Њ
reshape_usr/strided_sliceStridedSlicereshape_usr/Shape:output:0(reshape_usr/strided_slice/stack:output:0*reshape_usr/strided_slice/stack_1:output:0*reshape_usr/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_usr/strided_slice|
reshape_usr/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
reshape_usr/Reshape/shape/1Ж
reshape_usr/Reshape/shapePack"reshape_usr/strided_slice:output:0$reshape_usr/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
reshape_usr/Reshape/shapeК
reshape_usr/ReshapeReshape-user_emb/embedding_lookup/Identity_1:output:0"reshape_usr/Reshape/shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22
reshape_usr/Reshape
reshape_movie/ShapeShape.movie_emb/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:2
reshape_movie/Shape
!reshape_movie/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2#
!reshape_movie/strided_slice/stack
#reshape_movie/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2%
#reshape_movie/strided_slice/stack_1
#reshape_movie/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2%
#reshape_movie/strided_slice/stack_2Ж
reshape_movie/strided_sliceStridedSlicereshape_movie/Shape:output:0*reshape_movie/strided_slice/stack:output:0,reshape_movie/strided_slice/stack_1:output:0,reshape_movie/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_movie/strided_slice
reshape_movie/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
reshape_movie/Reshape/shape/1О
reshape_movie/Reshape/shapePack$reshape_movie/strided_slice:output:0&reshape_movie/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
reshape_movie/Reshape/shapeС
reshape_movie/ReshapeReshape.movie_emb/embedding_lookup/Identity_1:output:0$reshape_movie/Reshape/shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22
reshape_movie/Reshapej
concat/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/concat/axisТ
concat/concatConcatV2reshape_usr1/Reshape:output:0reshape_movie1/Reshape:output:0concat/concat/axis:output:0*
N*
T0*'
_output_shapes
:џџџџџџџџџd2
concat/concat
dot/l2_normalize/SquareSquarereshape_usr/Reshape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22
dot/l2_normalize/Square
&dot/l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2(
&dot/l2_normalize/Sum/reduction_indicesФ
dot/l2_normalize/SumSumdot/l2_normalize/Square:y:0/dot/l2_normalize/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:џџџџџџџџџ*
	keep_dims(2
dot/l2_normalize/Sum}
dot/l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *ЬМ+2
dot/l2_normalize/Maximum/yЕ
dot/l2_normalize/MaximumMaximumdot/l2_normalize/Sum:output:0#dot/l2_normalize/Maximum/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџ2
dot/l2_normalize/Maximum
dot/l2_normalize/RsqrtRsqrtdot/l2_normalize/Maximum:z:0*
T0*'
_output_shapes
:џџџџџџџџџ2
dot/l2_normalize/Rsqrt
dot/l2_normalizeMulreshape_usr/Reshape:output:0dot/l2_normalize/Rsqrt:y:0*
T0*'
_output_shapes
:џџџџџџџџџ22
dot/l2_normalize
dot/l2_normalize_1/SquareSquarereshape_movie/Reshape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22
dot/l2_normalize_1/Square
(dot/l2_normalize_1/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2*
(dot/l2_normalize_1/Sum/reduction_indicesЬ
dot/l2_normalize_1/SumSumdot/l2_normalize_1/Square:y:01dot/l2_normalize_1/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:џџџџџџџџџ*
	keep_dims(2
dot/l2_normalize_1/Sum
dot/l2_normalize_1/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *ЬМ+2
dot/l2_normalize_1/Maximum/yН
dot/l2_normalize_1/MaximumMaximumdot/l2_normalize_1/Sum:output:0%dot/l2_normalize_1/Maximum/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџ2
dot/l2_normalize_1/Maximum
dot/l2_normalize_1/RsqrtRsqrtdot/l2_normalize_1/Maximum:z:0*
T0*'
_output_shapes
:џџџџџџџџџ2
dot/l2_normalize_1/Rsqrt
dot/l2_normalize_1Mulreshape_movie/Reshape:output:0dot/l2_normalize_1/Rsqrt:y:0*
T0*'
_output_shapes
:џџџџџџџџџ22
dot/l2_normalize_1j
dot/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2
dot/ExpandDims/dim
dot/ExpandDims
ExpandDimsdot/l2_normalize:z:0dot/ExpandDims/dim:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22
dot/ExpandDimsn
dot/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B :2
dot/ExpandDims_1/dim
dot/ExpandDims_1
ExpandDimsdot/l2_normalize_1:z:0dot/ExpandDims_1/dim:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22
dot/ExpandDims_1

dot/MatMulBatchMatMulV2dot/ExpandDims:output:0dot/ExpandDims_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ2

dot/MatMulY
	dot/ShapeShapedot/MatMul:output:0*
T0*
_output_shapes
:2
	dot/Shape
dot/SqueezeSqueezedot/MatMul:output:0*
T0*'
_output_shapes
:џџџџџџџџџ*
squeeze_dims
2
dot/Squeeze
y_out/MatMul/ReadVariableOpReadVariableOp$y_out_matmul_readvariableop_resource*
_output_shapes

:*
dtype02
y_out/MatMul/ReadVariableOp
y_out/MatMulMatMuldot/Squeeze:output:0#y_out/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
y_out/MatMul
y_out/BiasAdd/ReadVariableOpReadVariableOp%y_out_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02
y_out/BiasAdd/ReadVariableOp
y_out/BiasAddBiasAddy_out/MatMul:product:0$y_out/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
y_out/BiasAddЂ
dense0/MatMul/ReadVariableOpReadVariableOp%dense0_matmul_readvariableop_resource*
_output_shapes

:d*
dtype02
dense0/MatMul/ReadVariableOp
dense0/MatMulMatMulconcat/concat:output:0$dense0/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
dense0/MatMulЁ
dense0/BiasAdd/ReadVariableOpReadVariableOp&dense0_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02
dense0/BiasAdd/ReadVariableOp
dense0/BiasAddBiasAdddense0/MatMul:product:0%dense0/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
dense0/BiasAddm
dense0/ReluReludense0/BiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџ2
dense0/Relul
concat2/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat2/concat/axisИ
concat2/concatConcatV2y_out/BiasAdd:output:0dense0/Relu:activations:0concat2/concat/axis:output:0*
N*
T0*'
_output_shapes
:џџџџџџџџџ2
concat2/concatЂ
rating/MatMul/ReadVariableOpReadVariableOp%rating_matmul_readvariableop_resource*
_output_shapes

:*
dtype02
rating/MatMul/ReadVariableOp
rating/MatMulMatMulconcat2/concat:output:0$rating/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
rating/MatMulЁ
rating/BiasAdd/ReadVariableOpReadVariableOp&rating_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02
rating/BiasAdd/ReadVariableOp
rating/BiasAddBiasAddrating/MatMul:product:0%rating/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
rating/BiasAddr
IdentityIdentityrating/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ2

Identity§
NoOpNoOp^dense0/BiasAdd/ReadVariableOp^dense0/MatMul/ReadVariableOp^movie_emb/embedding_lookup^movie_emb1/embedding_lookup^rating/BiasAdd/ReadVariableOp^rating/MatMul/ReadVariableOp^user_emb/embedding_lookup^user_emb1/embedding_lookup^y_out/BiasAdd/ReadVariableOp^y_out/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::џџџџџџџџџ:џџџџџџџџџ: : : : : : : : : : 2>
dense0/BiasAdd/ReadVariableOpdense0/BiasAdd/ReadVariableOp2<
dense0/MatMul/ReadVariableOpdense0/MatMul/ReadVariableOp28
movie_emb/embedding_lookupmovie_emb/embedding_lookup2:
movie_emb1/embedding_lookupmovie_emb1/embedding_lookup2>
rating/BiasAdd/ReadVariableOprating/BiasAdd/ReadVariableOp2<
rating/MatMul/ReadVariableOprating/MatMul/ReadVariableOp26
user_emb/embedding_lookupuser_emb/embedding_lookup28
user_emb1/embedding_lookupuser_emb1/embedding_lookup2<
y_out/BiasAdd/ReadVariableOpy_out/BiasAdd/ReadVariableOp2:
y_out/MatMul/ReadVariableOpy_out/MatMul/ReadVariableOp:Q M
'
_output_shapes
:џџџџџџџџџ
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:џџџџџџџџџ
"
_user_specified_name
inputs/1
Ц

#__inference_NCF_layer_call_fn_42369
inputs_0
inputs_1
unknown:
е2
	unknown_0:[2
	unknown_1:
е2
	unknown_2:[2
	unknown_3:
	unknown_4:
	unknown_5:d
	unknown_6:
	unknown_7:
	unknown_8:
identityЂStatefulPartitionedCallу
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputs_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8 *G
fBR@
>__inference_NCF_layer_call_and_return_conditional_losses_417742
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::џџџџџџџџџ:џџџџџџџџџ: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
'
_output_shapes
:џџџџџџџџџ
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:џџџџџџџџџ
"
_user_specified_name
inputs/1
Ћ

#__inference_signature_wrapper_42133
	movie_inp
user_inp
unknown:
е2
	unknown_0:[2
	unknown_1:
е2
	unknown_2:[2
	unknown_3:
	unknown_4:
	unknown_5:d
	unknown_6:
	unknown_7:
	unknown_8:
identityЂStatefulPartitionedCallЦ
StatefulPartitionedCallStatefulPartitionedCalluser_inp	movie_inpunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8 *)
f$R"
 __inference__wrapped_model_415572
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::џџџџџџџџџ:џџџџџџџџџ: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:R N
'
_output_shapes
:џџџџџџџџџ
#
_user_specified_name	movie_inp:QM
'
_output_shapes
:џџџџџџџџџ
"
_user_specified_name
user_inp
Ю
J
.__inference_reshape_movie1_layer_call_fn_42531

inputs
identityЧ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *R
fMRK
I__inference_reshape_movie1_layer_call_and_return_conditional_losses_416482
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџ2:S O
+
_output_shapes
:џџџџџџџџџ2
 
_user_specified_nameinputs
Л
R
&__inference_concat_layer_call_fn_42576
inputs_0
inputs_1
identityЬ
PartitionedCallPartitionedCallinputs_0inputs_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџd* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_concat_layer_call_and_return_conditional_losses_416852
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:џџџџџџџџџd2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:џџџџџџџџџ2:џџџџџџџџџ2:Q M
'
_output_shapes
:џџџџџџџџџ2
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:џџџџџџџџџ2
"
_user_specified_name
inputs/1
Ѓ

ђ
A__inference_rating_layer_call_and_return_conditional_losses_41767

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identityЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOp
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
MatMul
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2	
BiasAddk
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
ч

Ђ
D__inference_movie_emb_layer_call_and_return_conditional_losses_41604

inputs*
embedding_lookup_41598:
е2
identityЂembedding_lookup]
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ2
Castћ
embedding_lookupResourceGatherembedding_lookup_41598Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*)
_class
loc:@embedding_lookup/41598*+
_output_shapes
:џџџџџџџџџ2*
dtype02
embedding_lookupь
embedding_lookup/IdentityIdentityembedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*)
_class
loc:@embedding_lookup/41598*+
_output_shapes
:џџџџџџџџџ22
embedding_lookup/Identity 
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22
embedding_lookup/Identity_1
IdentityIdentity$embedding_lookup/Identity_1:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ22

Identitya
NoOpNoOp^embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:џџџџџџџџџ: 2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs

c
G__inference_reshape_usr1_layer_call_and_return_conditional_losses_41634

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2т
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
Reshape/shape/1
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapeo
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22	
Reshaped
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџ2:S O
+
_output_shapes
:џџџџџџџџџ2
 
_user_specified_nameinputs
Ц

#__inference_NCF_layer_call_fn_42395
inputs_0
inputs_1
unknown:
е2
	unknown_0:[2
	unknown_1:
е2
	unknown_2:[2
	unknown_3:
	unknown_4:
	unknown_5:d
	unknown_6:
	unknown_7:
	unknown_8:
identityЂStatefulPartitionedCallу
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputs_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8 *G
fBR@
>__inference_NCF_layer_call_and_return_conditional_losses_419722
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::џџџџџџџџџ:џџџџџџџџџ: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
'
_output_shapes
:џџџџџџџџџ
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:џџџџџџџџџ
"
_user_specified_name
inputs/1
Щ

#__inference_NCF_layer_call_fn_42021
user_inp
	movie_inp
unknown:
е2
	unknown_0:[2
	unknown_1:
е2
	unknown_2:[2
	unknown_3:
	unknown_4:
	unknown_5:d
	unknown_6:
	unknown_7:
	unknown_8:
identityЂStatefulPartitionedCallф
StatefulPartitionedCallStatefulPartitionedCalluser_inp	movie_inpunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8 *G
fBR@
>__inference_NCF_layer_call_and_return_conditional_losses_419722
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::џџџџџџџџџ:џџџџџџџџџ: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
'
_output_shapes
:џџџџџџџџџ
"
_user_specified_name
user_inp:RN
'
_output_shapes
:џџџџџџџџџ
#
_user_specified_name	movie_inp

b
F__inference_reshape_usr_layer_call_and_return_conditional_losses_42475

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2т
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
Reshape/shape/1
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapeo
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22	
Reshaped
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџ2:S O
+
_output_shapes
:џџџџџџџџџ2
 
_user_specified_nameinputs
ф


C__inference_user_emb_layer_call_and_return_conditional_losses_42405

inputs(
embedding_lookup_42399:[2
identityЂembedding_lookup]
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ2
Castћ
embedding_lookupResourceGatherembedding_lookup_42399Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*)
_class
loc:@embedding_lookup/42399*+
_output_shapes
:џџџџџџџџџ2*
dtype02
embedding_lookupь
embedding_lookup/IdentityIdentityembedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*)
_class
loc:@embedding_lookup/42399*+
_output_shapes
:џџџџџџџџџ22
embedding_lookup/Identity 
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22
embedding_lookup/Identity_1
IdentityIdentity$embedding_lookup/Identity_1:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ22

Identitya
NoOpNoOp^embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:џџџџџџџџџ: 2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Љ
у
!__inference__traced_restore_42915
file_prefix6
$assignvariableop_user_emb_embeddings:[2;
'assignvariableop_1_movie_emb_embeddings:
е29
'assignvariableop_2_user_emb1_embeddings:[2<
(assignvariableop_3_movie_emb1_embeddings:
е21
assignvariableop_4_y_out_kernel:+
assignvariableop_5_y_out_bias:2
 assignvariableop_6_dense0_kernel:d,
assignvariableop_7_dense0_bias:2
 assignvariableop_8_rating_kernel:,
assignvariableop_9_rating_bias:'
assignvariableop_10_adam_iter:	 )
assignvariableop_11_adam_beta_1: )
assignvariableop_12_adam_beta_2: (
assignvariableop_13_adam_decay: 0
&assignvariableop_14_adam_learning_rate: #
assignvariableop_15_total: #
assignvariableop_16_count: %
assignvariableop_17_total_1: %
assignvariableop_18_count_1: @
.assignvariableop_19_adam_user_emb_embeddings_m:[2C
/assignvariableop_20_adam_movie_emb_embeddings_m:
е2A
/assignvariableop_21_adam_user_emb1_embeddings_m:[2D
0assignvariableop_22_adam_movie_emb1_embeddings_m:
е29
'assignvariableop_23_adam_y_out_kernel_m:3
%assignvariableop_24_adam_y_out_bias_m::
(assignvariableop_25_adam_dense0_kernel_m:d4
&assignvariableop_26_adam_dense0_bias_m::
(assignvariableop_27_adam_rating_kernel_m:4
&assignvariableop_28_adam_rating_bias_m:@
.assignvariableop_29_adam_user_emb_embeddings_v:[2C
/assignvariableop_30_adam_movie_emb_embeddings_v:
е2A
/assignvariableop_31_adam_user_emb1_embeddings_v:[2D
0assignvariableop_32_adam_movie_emb1_embeddings_v:
е29
'assignvariableop_33_adam_y_out_kernel_v:3
%assignvariableop_34_adam_y_out_bias_v::
(assignvariableop_35_adam_dense0_kernel_v:d4
&assignvariableop_36_adam_dense0_bias_v::
(assignvariableop_37_adam_rating_kernel_v:4
&assignvariableop_38_adam_rating_bias_v:
identity_40ЂAssignVariableOpЂAssignVariableOp_1ЂAssignVariableOp_10ЂAssignVariableOp_11ЂAssignVariableOp_12ЂAssignVariableOp_13ЂAssignVariableOp_14ЂAssignVariableOp_15ЂAssignVariableOp_16ЂAssignVariableOp_17ЂAssignVariableOp_18ЂAssignVariableOp_19ЂAssignVariableOp_2ЂAssignVariableOp_20ЂAssignVariableOp_21ЂAssignVariableOp_22ЂAssignVariableOp_23ЂAssignVariableOp_24ЂAssignVariableOp_25ЂAssignVariableOp_26ЂAssignVariableOp_27ЂAssignVariableOp_28ЂAssignVariableOp_29ЂAssignVariableOp_3ЂAssignVariableOp_30ЂAssignVariableOp_31ЂAssignVariableOp_32ЂAssignVariableOp_33ЂAssignVariableOp_34ЂAssignVariableOp_35ЂAssignVariableOp_36ЂAssignVariableOp_37ЂAssignVariableOp_38ЂAssignVariableOp_4ЂAssignVariableOp_5ЂAssignVariableOp_6ЂAssignVariableOp_7ЂAssignVariableOp_8ЂAssignVariableOp_9Т
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:(*
dtype0*Ю
valueФBС(B:layer_with_weights-0/embeddings/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-1/embeddings/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-2/embeddings/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-3/embeddings/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-2/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-3/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-2/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-3/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2/tensor_namesо
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:(*
dtype0*c
valueZBX(B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
RestoreV2/shape_and_slicesі
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*Ж
_output_shapesЃ
 ::::::::::::::::::::::::::::::::::::::::*6
dtypes,
*2(	2
	RestoreV2g
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:2

IdentityЃ
AssignVariableOpAssignVariableOp$assignvariableop_user_emb_embeddingsIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOpk

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:2

Identity_1Ќ
AssignVariableOp_1AssignVariableOp'assignvariableop_1_movie_emb_embeddingsIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_1k

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:2

Identity_2Ќ
AssignVariableOp_2AssignVariableOp'assignvariableop_2_user_emb1_embeddingsIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_2k

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:2

Identity_3­
AssignVariableOp_3AssignVariableOp(assignvariableop_3_movie_emb1_embeddingsIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_3k

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:2

Identity_4Є
AssignVariableOp_4AssignVariableOpassignvariableop_4_y_out_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_4k

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:2

Identity_5Ђ
AssignVariableOp_5AssignVariableOpassignvariableop_5_y_out_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_5k

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:2

Identity_6Ѕ
AssignVariableOp_6AssignVariableOp assignvariableop_6_dense0_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_6k

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:2

Identity_7Ѓ
AssignVariableOp_7AssignVariableOpassignvariableop_7_dense0_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_7k

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:2

Identity_8Ѕ
AssignVariableOp_8AssignVariableOp assignvariableop_8_rating_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_8k

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:2

Identity_9Ѓ
AssignVariableOp_9AssignVariableOpassignvariableop_9_rating_biasIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_9n
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0	*
_output_shapes
:2
Identity_10Ѕ
AssignVariableOp_10AssignVariableOpassignvariableop_10_adam_iterIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	2
AssignVariableOp_10n
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:2
Identity_11Ї
AssignVariableOp_11AssignVariableOpassignvariableop_11_adam_beta_1Identity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_11n
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:2
Identity_12Ї
AssignVariableOp_12AssignVariableOpassignvariableop_12_adam_beta_2Identity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_12n
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:2
Identity_13І
AssignVariableOp_13AssignVariableOpassignvariableop_13_adam_decayIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_13n
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:2
Identity_14Ў
AssignVariableOp_14AssignVariableOp&assignvariableop_14_adam_learning_rateIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_14n
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:2
Identity_15Ё
AssignVariableOp_15AssignVariableOpassignvariableop_15_totalIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_15n
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:2
Identity_16Ё
AssignVariableOp_16AssignVariableOpassignvariableop_16_countIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_16n
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:2
Identity_17Ѓ
AssignVariableOp_17AssignVariableOpassignvariableop_17_total_1Identity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_17n
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:2
Identity_18Ѓ
AssignVariableOp_18AssignVariableOpassignvariableop_18_count_1Identity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_18n
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:2
Identity_19Ж
AssignVariableOp_19AssignVariableOp.assignvariableop_19_adam_user_emb_embeddings_mIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_19n
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:2
Identity_20З
AssignVariableOp_20AssignVariableOp/assignvariableop_20_adam_movie_emb_embeddings_mIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_20n
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:2
Identity_21З
AssignVariableOp_21AssignVariableOp/assignvariableop_21_adam_user_emb1_embeddings_mIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_21n
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:2
Identity_22И
AssignVariableOp_22AssignVariableOp0assignvariableop_22_adam_movie_emb1_embeddings_mIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_22n
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:2
Identity_23Џ
AssignVariableOp_23AssignVariableOp'assignvariableop_23_adam_y_out_kernel_mIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_23n
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:2
Identity_24­
AssignVariableOp_24AssignVariableOp%assignvariableop_24_adam_y_out_bias_mIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_24n
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:2
Identity_25А
AssignVariableOp_25AssignVariableOp(assignvariableop_25_adam_dense0_kernel_mIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_25n
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:2
Identity_26Ў
AssignVariableOp_26AssignVariableOp&assignvariableop_26_adam_dense0_bias_mIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_26n
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:2
Identity_27А
AssignVariableOp_27AssignVariableOp(assignvariableop_27_adam_rating_kernel_mIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_27n
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:2
Identity_28Ў
AssignVariableOp_28AssignVariableOp&assignvariableop_28_adam_rating_bias_mIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_28n
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:2
Identity_29Ж
AssignVariableOp_29AssignVariableOp.assignvariableop_29_adam_user_emb_embeddings_vIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_29n
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:2
Identity_30З
AssignVariableOp_30AssignVariableOp/assignvariableop_30_adam_movie_emb_embeddings_vIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_30n
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:2
Identity_31З
AssignVariableOp_31AssignVariableOp/assignvariableop_31_adam_user_emb1_embeddings_vIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_31n
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:2
Identity_32И
AssignVariableOp_32AssignVariableOp0assignvariableop_32_adam_movie_emb1_embeddings_vIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_32n
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:2
Identity_33Џ
AssignVariableOp_33AssignVariableOp'assignvariableop_33_adam_y_out_kernel_vIdentity_33:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_33n
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:2
Identity_34­
AssignVariableOp_34AssignVariableOp%assignvariableop_34_adam_y_out_bias_vIdentity_34:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_34n
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:2
Identity_35А
AssignVariableOp_35AssignVariableOp(assignvariableop_35_adam_dense0_kernel_vIdentity_35:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_35n
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:2
Identity_36Ў
AssignVariableOp_36AssignVariableOp&assignvariableop_36_adam_dense0_bias_vIdentity_36:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_36n
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:2
Identity_37А
AssignVariableOp_37AssignVariableOp(assignvariableop_37_adam_rating_kernel_vIdentity_37:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_37n
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:2
Identity_38Ў
AssignVariableOp_38AssignVariableOp&assignvariableop_38_adam_rating_bias_vIdentity_38:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_389
NoOpNoOp"/device:CPU:0*
_output_shapes
 2
NoOpИ
Identity_39Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2
Identity_39f
Identity_40IdentityIdentity_39:output:0^NoOp_1*
T0*
_output_shapes
: 2
Identity_40 
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 2
NoOp_1"#
identity_40Identity_40:output:0*c
_input_shapesR
P: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
х

 
D__inference_user_emb1_layer_call_and_return_conditional_losses_42439

inputs(
embedding_lookup_42433:[2
identityЂembedding_lookup]
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ2
Castћ
embedding_lookupResourceGatherembedding_lookup_42433Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*)
_class
loc:@embedding_lookup/42433*+
_output_shapes
:џџџџџџџџџ2*
dtype02
embedding_lookupь
embedding_lookup/IdentityIdentityembedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*)
_class
loc:@embedding_lookup/42433*+
_output_shapes
:џџџџџџџџџ22
embedding_lookup/Identity 
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22
embedding_lookup/Identity_1
IdentityIdentity$embedding_lookup/Identity_1:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ22

Identitya
NoOpNoOp^embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:џџџџџџџџџ: 2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs

d
H__inference_reshape_movie_layer_call_and_return_conditional_losses_42492

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2т
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
Reshape/shape/1
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapeo
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22	
Reshaped
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:џџџџџџџџџ22

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџ2:S O
+
_output_shapes
:џџџџџџџџџ2
 
_user_specified_nameinputs
ѕ
j
>__inference_dot_layer_call_and_return_conditional_losses_42557
inputs_0
inputs_1
identityp
l2_normalize/SquareSquareinputs_0*
T0*'
_output_shapes
:џџџџџџџџџ22
l2_normalize/Square
"l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2$
"l2_normalize/Sum/reduction_indicesД
l2_normalize/SumSuml2_normalize/Square:y:0+l2_normalize/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:џџџџџџџџџ*
	keep_dims(2
l2_normalize/Sumu
l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *ЬМ+2
l2_normalize/Maximum/yЅ
l2_normalize/MaximumMaximuml2_normalize/Sum:output:0l2_normalize/Maximum/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџ2
l2_normalize/Maximum}
l2_normalize/RsqrtRsqrtl2_normalize/Maximum:z:0*
T0*'
_output_shapes
:џџџџџџџџџ2
l2_normalize/Rsqrtw
l2_normalizeMulinputs_0l2_normalize/Rsqrt:y:0*
T0*'
_output_shapes
:џџџџџџџџџ22
l2_normalizet
l2_normalize_1/SquareSquareinputs_1*
T0*'
_output_shapes
:џџџџџџџџџ22
l2_normalize_1/Square
$l2_normalize_1/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2&
$l2_normalize_1/Sum/reduction_indicesМ
l2_normalize_1/SumSuml2_normalize_1/Square:y:0-l2_normalize_1/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:џџџџџџџџџ*
	keep_dims(2
l2_normalize_1/Sumy
l2_normalize_1/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *ЬМ+2
l2_normalize_1/Maximum/y­
l2_normalize_1/MaximumMaximuml2_normalize_1/Sum:output:0!l2_normalize_1/Maximum/y:output:0*
T0*'
_output_shapes
:џџџџџџџџџ2
l2_normalize_1/Maximum
l2_normalize_1/RsqrtRsqrtl2_normalize_1/Maximum:z:0*
T0*'
_output_shapes
:џџџџџџџџџ2
l2_normalize_1/Rsqrt}
l2_normalize_1Mulinputs_1l2_normalize_1/Rsqrt:y:0*
T0*'
_output_shapes
:џџџџџџџџџ22
l2_normalize_1b
ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2
ExpandDims/dim

ExpandDims
ExpandDimsl2_normalize:z:0ExpandDims/dim:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22

ExpandDimsf
ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B :2
ExpandDims_1/dim
ExpandDims_1
ExpandDimsl2_normalize_1:z:0ExpandDims_1/dim:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22
ExpandDims_1
MatMulBatchMatMulV2ExpandDims:output:0ExpandDims_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ2
MatMulM
ShapeShapeMatMul:output:0*
T0*
_output_shapes
:2
Shapew
SqueezeSqueezeMatMul:output:0*
T0*'
_output_shapes
:џџџџџџџџџ*
squeeze_dims
2	
Squeezed
IdentityIdentitySqueeze:output:0*
T0*'
_output_shapes
:џџџџџџџџџ2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:џџџџџџџџџ2:џџџџџџџџџ2:Q M
'
_output_shapes
:џџџџџџџџџ2
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:џџџџџџџџџ2
"
_user_specified_name
inputs/1
ф


C__inference_user_emb_layer_call_and_return_conditional_losses_41618

inputs(
embedding_lookup_41612:[2
identityЂembedding_lookup]
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ2
Castћ
embedding_lookupResourceGatherembedding_lookup_41612Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*)
_class
loc:@embedding_lookup/41612*+
_output_shapes
:џџџџџџџџџ2*
dtype02
embedding_lookupь
embedding_lookup/IdentityIdentityembedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*)
_class
loc:@embedding_lookup/41612*+
_output_shapes
:џџџџџџџџџ22
embedding_lookup/Identity 
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22
embedding_lookup/Identity_1
IdentityIdentity$embedding_lookup/Identity_1:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ22

Identitya
NoOpNoOp^embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:џџџџџџџџџ: 2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Ђ

ё
@__inference_y_out_layer_call_and_return_conditional_losses_41725

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identityЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOp
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2
MatMul
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ2	
BiasAddk
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Щ

#__inference_NCF_layer_call_fn_41797
user_inp
	movie_inp
unknown:
е2
	unknown_0:[2
	unknown_1:
е2
	unknown_2:[2
	unknown_3:
	unknown_4:
	unknown_5:d
	unknown_6:
	unknown_7:
	unknown_8:
identityЂStatefulPartitionedCallф
StatefulPartitionedCallStatefulPartitionedCalluser_inp	movie_inpunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8 *G
fBR@
>__inference_NCF_layer_call_and_return_conditional_losses_417742
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::џџџџџџџџџ:џџџџџџџџџ: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
'
_output_shapes
:џџџџџџџџџ
"
_user_specified_name
user_inp:RN
'
_output_shapes
:џџџџџџџџџ
#
_user_specified_name	movie_inp
ч

Ђ
D__inference_movie_emb_layer_call_and_return_conditional_losses_42422

inputs*
embedding_lookup_42416:
е2
identityЂembedding_lookup]
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:џџџџџџџџџ2
Castћ
embedding_lookupResourceGatherembedding_lookup_42416Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*)
_class
loc:@embedding_lookup/42416*+
_output_shapes
:џџџџџџџџџ2*
dtype02
embedding_lookupь
embedding_lookup/IdentityIdentityembedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*)
_class
loc:@embedding_lookup/42416*+
_output_shapes
:џџџџџџџџџ22
embedding_lookup/Identity 
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:џџџџџџџџџ22
embedding_lookup/Identity_1
IdentityIdentity$embedding_lookup/Identity_1:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ22

Identitya
NoOpNoOp^embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:џџџџџџџџџ: 2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs"ЈL
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*ь
serving_defaultи
?
	movie_inp2
serving_default_movie_inp:0џџџџџџџџџ
=
user_inp1
serving_default_user_inp:0џџџџџџџџџ:
rating0
StatefulPartitionedCall:0џџџџџџџџџtensorflow/serving/predict:То
ђ
layer-0
layer-1
layer_with_weights-0
layer-2
layer_with_weights-1
layer-3
layer_with_weights-2
layer-4
layer_with_weights-3
layer-5
layer-6
layer-7
	layer-8

layer-9
layer-10
layer-11
layer_with_weights-4
layer-12
layer_with_weights-5
layer-13
layer-14
layer_with_weights-6
layer-15
	optimizer
regularization_losses
	variables
trainable_variables
	keras_api

signatures
Ш_default_save_signature
+Щ&call_and_return_all_conditional_losses
Ъ__call__"
_tf_keras_network
"
_tf_keras_input_layer
"
_tf_keras_input_layer
З

embeddings
regularization_losses
	variables
trainable_variables
	keras_api
+Ы&call_and_return_all_conditional_losses
Ь__call__"
_tf_keras_layer
З

embeddings
regularization_losses
	variables
trainable_variables
 	keras_api
+Э&call_and_return_all_conditional_losses
Ю__call__"
_tf_keras_layer
З
!
embeddings
"regularization_losses
#	variables
$trainable_variables
%	keras_api
+Я&call_and_return_all_conditional_losses
а__call__"
_tf_keras_layer
З
&
embeddings
'regularization_losses
(	variables
)trainable_variables
*	keras_api
+б&call_and_return_all_conditional_losses
в__call__"
_tf_keras_layer
Ї
+regularization_losses
,	variables
-trainable_variables
.	keras_api
+г&call_and_return_all_conditional_losses
д__call__"
_tf_keras_layer
Ї
/regularization_losses
0	variables
1trainable_variables
2	keras_api
+е&call_and_return_all_conditional_losses
ж__call__"
_tf_keras_layer
Ї
3regularization_losses
4	variables
5trainable_variables
6	keras_api
+з&call_and_return_all_conditional_losses
и__call__"
_tf_keras_layer
Ї
7regularization_losses
8	variables
9trainable_variables
:	keras_api
+й&call_and_return_all_conditional_losses
к__call__"
_tf_keras_layer
Ї
;regularization_losses
<	variables
=trainable_variables
>	keras_api
+л&call_and_return_all_conditional_losses
м__call__"
_tf_keras_layer
Ї
?regularization_losses
@	variables
Atrainable_variables
B	keras_api
+н&call_and_return_all_conditional_losses
о__call__"
_tf_keras_layer
Н

Ckernel
Dbias
Eregularization_losses
F	variables
Gtrainable_variables
H	keras_api
+п&call_and_return_all_conditional_losses
р__call__"
_tf_keras_layer
Н

Ikernel
Jbias
Kregularization_losses
L	variables
Mtrainable_variables
N	keras_api
+с&call_and_return_all_conditional_losses
т__call__"
_tf_keras_layer
Ї
Oregularization_losses
P	variables
Qtrainable_variables
R	keras_api
+у&call_and_return_all_conditional_losses
ф__call__"
_tf_keras_layer
Н

Skernel
Tbias
Uregularization_losses
V	variables
Wtrainable_variables
X	keras_api
+х&call_and_return_all_conditional_losses
ц__call__"
_tf_keras_layer
Љ
Yiter

Zbeta_1

[beta_2
	\decay
]learning_ratemДmЕ!mЖ&mЗCmИDmЙImКJmЛSmМTmНvОvП!vР&vСCvТDvУIvФJvХSvЦTvЧ"
tf_deprecated_optimizer
 "
trackable_list_wrapper
f
0
1
!2
&3
C4
D5
I6
J7
S8
T9"
trackable_list_wrapper
f
0
1
!2
&3
C4
D5
I6
J7
S8
T9"
trackable_list_wrapper
Ю
^layer_regularization_losses
_layer_metrics
regularization_losses

`layers
	variables
ametrics
trainable_variables
bnon_trainable_variables
Ъ__call__
Ш_default_save_signature
+Щ&call_and_return_all_conditional_losses
'Щ"call_and_return_conditional_losses"
_generic_user_object
-
чserving_default"
signature_map
%:#[22user_emb/embeddings
 "
trackable_list_wrapper
'
0"
trackable_list_wrapper
'
0"
trackable_list_wrapper
А
clayer_regularization_losses
dlayer_metrics
regularization_losses

elayers
	variables
fmetrics
trainable_variables
gnon_trainable_variables
Ь__call__
+Ы&call_and_return_all_conditional_losses
'Ы"call_and_return_conditional_losses"
_generic_user_object
(:&
е22movie_emb/embeddings
 "
trackable_list_wrapper
'
0"
trackable_list_wrapper
'
0"
trackable_list_wrapper
А
hlayer_regularization_losses
ilayer_metrics
regularization_losses

jlayers
	variables
kmetrics
trainable_variables
lnon_trainable_variables
Ю__call__
+Э&call_and_return_all_conditional_losses
'Э"call_and_return_conditional_losses"
_generic_user_object
&:$[22user_emb1/embeddings
 "
trackable_list_wrapper
'
!0"
trackable_list_wrapper
'
!0"
trackable_list_wrapper
А
mlayer_regularization_losses
nlayer_metrics
"regularization_losses

olayers
#	variables
pmetrics
$trainable_variables
qnon_trainable_variables
а__call__
+Я&call_and_return_all_conditional_losses
'Я"call_and_return_conditional_losses"
_generic_user_object
):'
е22movie_emb1/embeddings
 "
trackable_list_wrapper
'
&0"
trackable_list_wrapper
'
&0"
trackable_list_wrapper
А
rlayer_regularization_losses
slayer_metrics
'regularization_losses

tlayers
(	variables
umetrics
)trainable_variables
vnon_trainable_variables
в__call__
+б&call_and_return_all_conditional_losses
'б"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
А
wlayer_regularization_losses
xlayer_metrics
+regularization_losses

ylayers
,	variables
zmetrics
-trainable_variables
{non_trainable_variables
д__call__
+г&call_and_return_all_conditional_losses
'г"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
Б
|layer_regularization_losses
}layer_metrics
/regularization_losses

~layers
0	variables
metrics
1trainable_variables
non_trainable_variables
ж__call__
+е&call_and_return_all_conditional_losses
'е"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
Е
 layer_regularization_losses
layer_metrics
3regularization_losses
layers
4	variables
metrics
5trainable_variables
non_trainable_variables
и__call__
+з&call_and_return_all_conditional_losses
'з"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
Е
 layer_regularization_losses
layer_metrics
7regularization_losses
layers
8	variables
metrics
9trainable_variables
non_trainable_variables
к__call__
+й&call_and_return_all_conditional_losses
'й"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
Е
 layer_regularization_losses
layer_metrics
;regularization_losses
layers
<	variables
metrics
=trainable_variables
non_trainable_variables
м__call__
+л&call_and_return_all_conditional_losses
'л"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
Е
 layer_regularization_losses
layer_metrics
?regularization_losses
layers
@	variables
metrics
Atrainable_variables
non_trainable_variables
о__call__
+н&call_and_return_all_conditional_losses
'н"call_and_return_conditional_losses"
_generic_user_object
:2y_out/kernel
:2
y_out/bias
 "
trackable_list_wrapper
.
C0
D1"
trackable_list_wrapper
.
C0
D1"
trackable_list_wrapper
Е
 layer_regularization_losses
layer_metrics
Eregularization_losses
layers
F	variables
metrics
Gtrainable_variables
non_trainable_variables
р__call__
+п&call_and_return_all_conditional_losses
'п"call_and_return_conditional_losses"
_generic_user_object
:d2dense0/kernel
:2dense0/bias
 "
trackable_list_wrapper
.
I0
J1"
trackable_list_wrapper
.
I0
J1"
trackable_list_wrapper
Е
 layer_regularization_losses
layer_metrics
Kregularization_losses
layers
L	variables
metrics
Mtrainable_variables
non_trainable_variables
т__call__
+с&call_and_return_all_conditional_losses
'с"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
Е
 layer_regularization_losses
 layer_metrics
Oregularization_losses
Ёlayers
P	variables
Ђmetrics
Qtrainable_variables
Ѓnon_trainable_variables
ф__call__
+у&call_and_return_all_conditional_losses
'у"call_and_return_conditional_losses"
_generic_user_object
:2rating/kernel
:2rating/bias
 "
trackable_list_wrapper
.
S0
T1"
trackable_list_wrapper
.
S0
T1"
trackable_list_wrapper
Е
 Єlayer_regularization_losses
Ѕlayer_metrics
Uregularization_losses
Іlayers
V	variables
Їmetrics
Wtrainable_variables
Јnon_trainable_variables
ц__call__
+х&call_and_return_all_conditional_losses
'х"call_and_return_conditional_losses"
_generic_user_object
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
 "
trackable_list_wrapper
 "
trackable_dict_wrapper

0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14
15"
trackable_list_wrapper
0
Љ0
Њ1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
R

Ћtotal

Ќcount
­	variables
Ў	keras_api"
_tf_keras_metric
c

Џtotal

Аcount
Б
_fn_kwargs
В	variables
Г	keras_api"
_tf_keras_metric
:  (2total
:  (2count
0
Ћ0
Ќ1"
trackable_list_wrapper
.
­	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
0
Џ0
А1"
trackable_list_wrapper
.
В	variables"
_generic_user_object
*:([22Adam/user_emb/embeddings/m
-:+
е22Adam/movie_emb/embeddings/m
+:)[22Adam/user_emb1/embeddings/m
.:,
е22Adam/movie_emb1/embeddings/m
#:!2Adam/y_out/kernel/m
:2Adam/y_out/bias/m
$:"d2Adam/dense0/kernel/m
:2Adam/dense0/bias/m
$:"2Adam/rating/kernel/m
:2Adam/rating/bias/m
*:([22Adam/user_emb/embeddings/v
-:+
е22Adam/movie_emb/embeddings/v
+:)[22Adam/user_emb1/embeddings/v
.:,
е22Adam/movie_emb1/embeddings/v
#:!2Adam/y_out/kernel/v
:2Adam/y_out/bias/v
$:"d2Adam/dense0/kernel/v
:2Adam/dense0/bias/v
$:"2Adam/rating/kernel/v
:2Adam/rating/bias/v
2
 __inference__wrapped_model_41557с
В
FullArgSpec
args 
varargsjargs
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *QЂN
LI
"
user_inpџџџџџџџџџ
# 
	movie_inpџџџџџџџџџ
Ц2У
>__inference_NCF_layer_call_and_return_conditional_losses_42238
>__inference_NCF_layer_call_and_return_conditional_losses_42343
>__inference_NCF_layer_call_and_return_conditional_losses_42060
>__inference_NCF_layer_call_and_return_conditional_losses_42099Р
ЗВГ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaultsЊ 
annotationsЊ *
 
к2з
#__inference_NCF_layer_call_fn_41797
#__inference_NCF_layer_call_fn_42369
#__inference_NCF_layer_call_fn_42395
#__inference_NCF_layer_call_fn_42021Р
ЗВГ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaultsЊ 
annotationsЊ *
 
э2ъ
C__inference_user_emb_layer_call_and_return_conditional_losses_42405Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
в2Я
(__inference_user_emb_layer_call_fn_42412Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ю2ы
D__inference_movie_emb_layer_call_and_return_conditional_losses_42422Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
г2а
)__inference_movie_emb_layer_call_fn_42429Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ю2ы
D__inference_user_emb1_layer_call_and_return_conditional_losses_42439Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
г2а
)__inference_user_emb1_layer_call_fn_42446Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
я2ь
E__inference_movie_emb1_layer_call_and_return_conditional_losses_42456Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
д2б
*__inference_movie_emb1_layer_call_fn_42463Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
№2э
F__inference_reshape_usr_layer_call_and_return_conditional_losses_42475Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
е2в
+__inference_reshape_usr_layer_call_fn_42480Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ђ2я
H__inference_reshape_movie_layer_call_and_return_conditional_losses_42492Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
з2д
-__inference_reshape_movie_layer_call_fn_42497Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ё2ю
G__inference_reshape_usr1_layer_call_and_return_conditional_losses_42509Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ж2г
,__inference_reshape_usr1_layer_call_fn_42514Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ѓ2№
I__inference_reshape_movie1_layer_call_and_return_conditional_losses_42526Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
и2е
.__inference_reshape_movie1_layer_call_fn_42531Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ш2х
>__inference_dot_layer_call_and_return_conditional_losses_42557Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
Э2Ъ
#__inference_dot_layer_call_fn_42563Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ы2ш
A__inference_concat_layer_call_and_return_conditional_losses_42570Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
а2Э
&__inference_concat_layer_call_fn_42576Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ъ2ч
@__inference_y_out_layer_call_and_return_conditional_losses_42586Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
Я2Ь
%__inference_y_out_layer_call_fn_42595Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ы2ш
A__inference_dense0_layer_call_and_return_conditional_losses_42606Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
а2Э
&__inference_dense0_layer_call_fn_42615Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ь2щ
B__inference_concat2_layer_call_and_return_conditional_losses_42622Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
б2Ю
'__inference_concat2_layer_call_fn_42628Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ы2ш
A__inference_rating_layer_call_and_return_conditional_losses_42638Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
а2Э
&__inference_rating_layer_call_fn_42647Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
дBб
#__inference_signature_wrapper_42133	movie_inpuser_inp"
В
FullArgSpec
args 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 л
>__inference_NCF_layer_call_and_return_conditional_losses_42060
&!CDIJSTcЂ`
YЂV
LI
"
user_inpџџџџџџџџџ
# 
	movie_inpџџџџџџџџџ
p 

 
Њ "%Ђ"

0џџџџџџџџџ
 л
>__inference_NCF_layer_call_and_return_conditional_losses_42099
&!CDIJSTcЂ`
YЂV
LI
"
user_inpџџџџџџџџџ
# 
	movie_inpџџџџџџџџџ
p

 
Њ "%Ђ"

0џџџџџџџџџ
 к
>__inference_NCF_layer_call_and_return_conditional_losses_42238
&!CDIJSTbЂ_
XЂU
KH
"
inputs/0џџџџџџџџџ
"
inputs/1џџџџџџџџџ
p 

 
Њ "%Ђ"

0џџџџџџџџџ
 к
>__inference_NCF_layer_call_and_return_conditional_losses_42343
&!CDIJSTbЂ_
XЂU
KH
"
inputs/0џџџџџџџџџ
"
inputs/1џџџџџџџџџ
p

 
Њ "%Ђ"

0џџџџџџџџџ
 Г
#__inference_NCF_layer_call_fn_41797
&!CDIJSTcЂ`
YЂV
LI
"
user_inpџџџџџџџџџ
# 
	movie_inpџџџџџџџџџ
p 

 
Њ "џџџџџџџџџГ
#__inference_NCF_layer_call_fn_42021
&!CDIJSTcЂ`
YЂV
LI
"
user_inpџџџџџџџџџ
# 
	movie_inpџџџџџџџџџ
p

 
Њ "џџџџџџџџџВ
#__inference_NCF_layer_call_fn_42369
&!CDIJSTbЂ_
XЂU
KH
"
inputs/0џџџџџџџџџ
"
inputs/1џџџџџџџџџ
p 

 
Њ "џџџџџџџџџВ
#__inference_NCF_layer_call_fn_42395
&!CDIJSTbЂ_
XЂU
KH
"
inputs/0џџџџџџџџџ
"
inputs/1џџџџџџџџџ
p

 
Њ "џџџџџџџџџП
 __inference__wrapped_model_41557
&!CDIJST[ЂX
QЂN
LI
"
user_inpџџџџџџџџџ
# 
	movie_inpџџџџџџџџџ
Њ "/Њ,
*
rating 
ratingџџџџџџџџџЪ
B__inference_concat2_layer_call_and_return_conditional_losses_42622ZЂW
PЂM
KH
"
inputs/0џџџџџџџџџ
"
inputs/1џџџџџџџџџ
Њ "%Ђ"

0џџџџџџџџџ
 Ё
'__inference_concat2_layer_call_fn_42628vZЂW
PЂM
KH
"
inputs/0џџџџџџџџџ
"
inputs/1џџџџџџџџџ
Њ "џџџџџџџџџЩ
A__inference_concat_layer_call_and_return_conditional_losses_42570ZЂW
PЂM
KH
"
inputs/0џџџџџџџџџ2
"
inputs/1џџџџџџџџџ2
Њ "%Ђ"

0џџџџџџџџџd
  
&__inference_concat_layer_call_fn_42576vZЂW
PЂM
KH
"
inputs/0џџџџџџџџџ2
"
inputs/1џџџџџџџџџ2
Њ "џџџџџџџџџdЁ
A__inference_dense0_layer_call_and_return_conditional_losses_42606\IJ/Ђ,
%Ђ"
 
inputsџџџџџџџџџd
Њ "%Ђ"

0џџџџџџџџџ
 y
&__inference_dense0_layer_call_fn_42615OIJ/Ђ,
%Ђ"
 
inputsџџџџџџџџџd
Њ "џџџџџџџџџЦ
>__inference_dot_layer_call_and_return_conditional_losses_42557ZЂW
PЂM
KH
"
inputs/0џџџџџџџџџ2
"
inputs/1џџџџџџџџџ2
Њ "%Ђ"

0џџџџџџџџџ
 
#__inference_dot_layer_call_fn_42563vZЂW
PЂM
KH
"
inputs/0џџџџџџџџџ2
"
inputs/1џџџџџџџџџ2
Њ "џџџџџџџџџЈ
E__inference_movie_emb1_layer_call_and_return_conditional_losses_42456_&/Ђ,
%Ђ"
 
inputsџџџџџџџџџ
Њ ")Ђ&

0џџџџџџџџџ2
 
*__inference_movie_emb1_layer_call_fn_42463R&/Ђ,
%Ђ"
 
inputsџџџџџџџџџ
Њ "џџџџџџџџџ2Ї
D__inference_movie_emb_layer_call_and_return_conditional_losses_42422_/Ђ,
%Ђ"
 
inputsџџџџџџџџџ
Њ ")Ђ&

0џџџџџџџџџ2
 
)__inference_movie_emb_layer_call_fn_42429R/Ђ,
%Ђ"
 
inputsџџџџџџџџџ
Њ "џџџџџџџџџ2Ё
A__inference_rating_layer_call_and_return_conditional_losses_42638\ST/Ђ,
%Ђ"
 
inputsџџџџџџџџџ
Њ "%Ђ"

0џџџџџџџџџ
 y
&__inference_rating_layer_call_fn_42647OST/Ђ,
%Ђ"
 
inputsџџџџџџџџџ
Њ "џџџџџџџџџЉ
I__inference_reshape_movie1_layer_call_and_return_conditional_losses_42526\3Ђ0
)Ђ&
$!
inputsџџџџџџџџџ2
Њ "%Ђ"

0џџџџџџџџџ2
 
.__inference_reshape_movie1_layer_call_fn_42531O3Ђ0
)Ђ&
$!
inputsџџџџџџџџџ2
Њ "џџџџџџџџџ2Ј
H__inference_reshape_movie_layer_call_and_return_conditional_losses_42492\3Ђ0
)Ђ&
$!
inputsџџџџџџџџџ2
Њ "%Ђ"

0џџџџџџџџџ2
 
-__inference_reshape_movie_layer_call_fn_42497O3Ђ0
)Ђ&
$!
inputsџџџџџџџџџ2
Њ "џџџџџџџџџ2Ї
G__inference_reshape_usr1_layer_call_and_return_conditional_losses_42509\3Ђ0
)Ђ&
$!
inputsџџџџџџџџџ2
Њ "%Ђ"

0џџџџџџџџџ2
 
,__inference_reshape_usr1_layer_call_fn_42514O3Ђ0
)Ђ&
$!
inputsџџџџџџџџџ2
Њ "џџџџџџџџџ2І
F__inference_reshape_usr_layer_call_and_return_conditional_losses_42475\3Ђ0
)Ђ&
$!
inputsџџџџџџџџџ2
Њ "%Ђ"

0џџџџџџџџџ2
 ~
+__inference_reshape_usr_layer_call_fn_42480O3Ђ0
)Ђ&
$!
inputsџџџџџџџџџ2
Њ "џџџџџџџџџ2ж
#__inference_signature_wrapper_42133Ў
&!CDIJSToЂl
Ђ 
eЊb
0
	movie_inp# 
	movie_inpџџџџџџџџџ
.
user_inp"
user_inpџџџџџџџџџ"/Њ,
*
rating 
ratingџџџџџџџџџЇ
D__inference_user_emb1_layer_call_and_return_conditional_losses_42439_!/Ђ,
%Ђ"
 
inputsџџџџџџџџџ
Њ ")Ђ&

0џџџџџџџџџ2
 
)__inference_user_emb1_layer_call_fn_42446R!/Ђ,
%Ђ"
 
inputsџџџџџџџџџ
Њ "џџџџџџџџџ2І
C__inference_user_emb_layer_call_and_return_conditional_losses_42405_/Ђ,
%Ђ"
 
inputsџџџџџџџџџ
Њ ")Ђ&

0џџџџџџџџџ2
 ~
(__inference_user_emb_layer_call_fn_42412R/Ђ,
%Ђ"
 
inputsџџџџџџџџџ
Њ "џџџџџџџџџ2 
@__inference_y_out_layer_call_and_return_conditional_losses_42586\CD/Ђ,
%Ђ"
 
inputsџџџџџџџџџ
Њ "%Ђ"

0џџџџџџџџџ
 x
%__inference_y_out_layer_call_fn_42595OCD/Ђ,
%Ђ"
 
inputsџџџџџџџџџ
Њ "џџџџџџџџџ