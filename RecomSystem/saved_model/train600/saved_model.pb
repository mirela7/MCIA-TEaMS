��
��
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( �
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
delete_old_dirsbool(�
?
Mul
x"T
y"T
z"T"
Ttype:
2	�
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
dtypetype�
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
�
ResourceGather
resource
indices"Tindices
output"dtype"

batch_dimsint "
validate_indicesbool("
dtypetype"
Tindicestype:
2	�
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
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
list(type)(0�
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
7
Square
x"T
y"T"
Ttype:
2	
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
�
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
executor_typestring ��
@
StaticRegexFullMatch	
input

output
"
patternstring
�
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

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
�
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
�
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 �"serve*2.9.22v2.9.1-132-g18960c44ad38�
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
�
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
�
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
�
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
�
Adam/movie_emb1/embeddings/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
��2*-
shared_nameAdam/movie_emb1/embeddings/v
�
0Adam/movie_emb1/embeddings/v/Read/ReadVariableOpReadVariableOpAdam/movie_emb1/embeddings/v* 
_output_shapes
:
��2*
dtype0
�
Adam/user_emb1/embeddings/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�2*,
shared_nameAdam/user_emb1/embeddings/v
�
/Adam/user_emb1/embeddings/v/Read/ReadVariableOpReadVariableOpAdam/user_emb1/embeddings/v*
_output_shapes
:	�2*
dtype0
�
Adam/movie_emb/embeddings/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
��2*,
shared_nameAdam/movie_emb/embeddings/v
�
/Adam/movie_emb/embeddings/v/Read/ReadVariableOpReadVariableOpAdam/movie_emb/embeddings/v* 
_output_shapes
:
��2*
dtype0
�
Adam/user_emb/embeddings/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�2*+
shared_nameAdam/user_emb/embeddings/v
�
.Adam/user_emb/embeddings/v/Read/ReadVariableOpReadVariableOpAdam/user_emb/embeddings/v*
_output_shapes
:	�2*
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
�
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
�
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
�
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
�
Adam/movie_emb1/embeddings/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
��2*-
shared_nameAdam/movie_emb1/embeddings/m
�
0Adam/movie_emb1/embeddings/m/Read/ReadVariableOpReadVariableOpAdam/movie_emb1/embeddings/m* 
_output_shapes
:
��2*
dtype0
�
Adam/user_emb1/embeddings/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�2*,
shared_nameAdam/user_emb1/embeddings/m
�
/Adam/user_emb1/embeddings/m/Read/ReadVariableOpReadVariableOpAdam/user_emb1/embeddings/m*
_output_shapes
:	�2*
dtype0
�
Adam/movie_emb/embeddings/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
��2*,
shared_nameAdam/movie_emb/embeddings/m
�
/Adam/movie_emb/embeddings/m/Read/ReadVariableOpReadVariableOpAdam/movie_emb/embeddings/m* 
_output_shapes
:
��2*
dtype0
�
Adam/user_emb/embeddings/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�2*+
shared_nameAdam/user_emb/embeddings/m
�
.Adam/user_emb/embeddings/m/Read/ReadVariableOpReadVariableOpAdam/user_emb/embeddings/m*
_output_shapes
:	�2*
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
�
movie_emb1/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape:
��2*&
shared_namemovie_emb1/embeddings
�
)movie_emb1/embeddings/Read/ReadVariableOpReadVariableOpmovie_emb1/embeddings* 
_output_shapes
:
��2*
dtype0
�
user_emb1/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�2*%
shared_nameuser_emb1/embeddings
~
(user_emb1/embeddings/Read/ReadVariableOpReadVariableOpuser_emb1/embeddings*
_output_shapes
:	�2*
dtype0
�
movie_emb/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape:
��2*%
shared_namemovie_emb/embeddings

(movie_emb/embeddings/Read/ReadVariableOpReadVariableOpmovie_emb/embeddings* 
_output_shapes
:
��2*
dtype0
�
user_emb/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�2*$
shared_nameuser_emb/embeddings
|
'user_emb/embeddings/Read/ReadVariableOpReadVariableOpuser_emb/embeddings*
_output_shapes
:	�2*
dtype0

NoOpNoOp
�k
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*�k
value�kB�k B�k
�
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
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures*
* 
* 
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
 
embeddings*
�
!	variables
"trainable_variables
#regularization_losses
$	keras_api
%__call__
*&&call_and_return_all_conditional_losses
'
embeddings*
�
(	variables
)trainable_variables
*regularization_losses
+	keras_api
,__call__
*-&call_and_return_all_conditional_losses
.
embeddings*
�
/	variables
0trainable_variables
1regularization_losses
2	keras_api
3__call__
*4&call_and_return_all_conditional_losses
5
embeddings*
�
6	variables
7trainable_variables
8regularization_losses
9	keras_api
:__call__
*;&call_and_return_all_conditional_losses* 
�
<	variables
=trainable_variables
>regularization_losses
?	keras_api
@__call__
*A&call_and_return_all_conditional_losses* 
�
B	variables
Ctrainable_variables
Dregularization_losses
E	keras_api
F__call__
*G&call_and_return_all_conditional_losses* 
�
H	variables
Itrainable_variables
Jregularization_losses
K	keras_api
L__call__
*M&call_and_return_all_conditional_losses* 
�
N	variables
Otrainable_variables
Pregularization_losses
Q	keras_api
R__call__
*S&call_and_return_all_conditional_losses* 
�
T	variables
Utrainable_variables
Vregularization_losses
W	keras_api
X__call__
*Y&call_and_return_all_conditional_losses* 
�
Z	variables
[trainable_variables
\regularization_losses
]	keras_api
^__call__
*_&call_and_return_all_conditional_losses

`kernel
abias*
�
b	variables
ctrainable_variables
dregularization_losses
e	keras_api
f__call__
*g&call_and_return_all_conditional_losses

hkernel
ibias*
�
j	variables
ktrainable_variables
lregularization_losses
m	keras_api
n__call__
*o&call_and_return_all_conditional_losses* 
�
p	variables
qtrainable_variables
rregularization_losses
s	keras_api
t__call__
*u&call_and_return_all_conditional_losses

vkernel
wbias*
J
 0
'1
.2
53
`4
a5
h6
i7
v8
w9*
J
 0
'1
.2
53
`4
a5
h6
i7
v8
w9*
* 
�
xnon_trainable_variables

ylayers
zmetrics
{layer_regularization_losses
|layer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
7
}trace_0
~trace_1
trace_2
�trace_3* 
:
�trace_0
�trace_1
�trace_2
�trace_3* 
* 
�
	�iter
�beta_1
�beta_2

�decay
�learning_rate m�'m�.m�5m�`m�am�hm�im�vm�wm� v�'v�.v�5v�`v�av�hv�iv�vv�wv�*

�serving_default* 

 0*

 0*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
ga
VARIABLE_VALUEuser_emb/embeddings:layer_with_weights-0/embeddings/.ATTRIBUTES/VARIABLE_VALUE*

'0*

'0*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
!	variables
"trainable_variables
#regularization_losses
%__call__
*&&call_and_return_all_conditional_losses
&&"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
hb
VARIABLE_VALUEmovie_emb/embeddings:layer_with_weights-1/embeddings/.ATTRIBUTES/VARIABLE_VALUE*

.0*

.0*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
(	variables
)trainable_variables
*regularization_losses
,__call__
*-&call_and_return_all_conditional_losses
&-"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
hb
VARIABLE_VALUEuser_emb1/embeddings:layer_with_weights-2/embeddings/.ATTRIBUTES/VARIABLE_VALUE*

50*

50*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
/	variables
0trainable_variables
1regularization_losses
3__call__
*4&call_and_return_all_conditional_losses
&4"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
ic
VARIABLE_VALUEmovie_emb1/embeddings:layer_with_weights-3/embeddings/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
6	variables
7trainable_variables
8regularization_losses
:__call__
*;&call_and_return_all_conditional_losses
&;"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
<	variables
=trainable_variables
>regularization_losses
@__call__
*A&call_and_return_all_conditional_losses
&A"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
B	variables
Ctrainable_variables
Dregularization_losses
F__call__
*G&call_and_return_all_conditional_losses
&G"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
H	variables
Itrainable_variables
Jregularization_losses
L__call__
*M&call_and_return_all_conditional_losses
&M"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
N	variables
Otrainable_variables
Pregularization_losses
R__call__
*S&call_and_return_all_conditional_losses
&S"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
T	variables
Utrainable_variables
Vregularization_losses
X__call__
*Y&call_and_return_all_conditional_losses
&Y"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 

`0
a1*

`0
a1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
Z	variables
[trainable_variables
\regularization_losses
^__call__
*_&call_and_return_all_conditional_losses
&_"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
\V
VARIABLE_VALUEy_out/kernel6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUE*
XR
VARIABLE_VALUE
y_out/bias4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUE*

h0
i1*

h0
i1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
b	variables
ctrainable_variables
dregularization_losses
f__call__
*g&call_and_return_all_conditional_losses
&g"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
]W
VARIABLE_VALUEdense0/kernel6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUE*
YS
VARIABLE_VALUEdense0/bias4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
j	variables
ktrainable_variables
lregularization_losses
n__call__
*o&call_and_return_all_conditional_losses
&o"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 

v0
w1*

v0
w1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
p	variables
qtrainable_variables
rregularization_losses
t__call__
*u&call_and_return_all_conditional_losses
&u"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
]W
VARIABLE_VALUErating/kernel6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUE*
YS
VARIABLE_VALUErating/bias4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
z
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
15*

�0
�1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
LF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE*
NH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE*
^X
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
<
�	variables
�	keras_api

�total

�count*
M
�	variables
�	keras_api

�total

�count
�
_fn_kwargs*

�0
�1*

�	variables*
UO
VARIABLE_VALUEtotal_14keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
UO
VARIABLE_VALUEcount_14keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*

�0
�1*

�	variables*
SM
VARIABLE_VALUEtotal4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE*
* 
��
VARIABLE_VALUEAdam/user_emb/embeddings/mVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/movie_emb/embeddings/mVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/user_emb1/embeddings/mVlayer_with_weights-2/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/movie_emb1/embeddings/mVlayer_with_weights-3/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
y
VARIABLE_VALUEAdam/y_out/kernel/mRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
{u
VARIABLE_VALUEAdam/y_out/bias/mPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
�z
VARIABLE_VALUEAdam/dense0/kernel/mRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUEAdam/dense0/bias/mPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
�z
VARIABLE_VALUEAdam/rating/kernel/mRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUEAdam/rating/bias/mPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/user_emb/embeddings/vVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/movie_emb/embeddings/vVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/user_emb1/embeddings/vVlayer_with_weights-2/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/movie_emb1/embeddings/vVlayer_with_weights-3/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
y
VARIABLE_VALUEAdam/y_out/kernel/vRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
{u
VARIABLE_VALUEAdam/y_out/bias/vPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
�z
VARIABLE_VALUEAdam/dense0/kernel/vRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUEAdam/dense0/bias/vPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
�z
VARIABLE_VALUEAdam/rating/kernel/vRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUEAdam/rating/bias/vPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
|
serving_default_movie_inpPlaceholder*'
_output_shapes
:���������*
dtype0*
shape:���������
{
serving_default_user_inpPlaceholder*'
_output_shapes
:���������*
dtype0*
shape:���������
�
StatefulPartitionedCallStatefulPartitionedCallserving_default_movie_inpserving_default_user_inpmovie_emb1/embeddingsuser_emb1/embeddingsmovie_emb/embeddingsuser_emb/embeddingsy_out/kernel
y_out/biasdense0/kerneldense0/biasrating/kernelrating/bias*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8� *-
f(R&
$__inference_signature_wrapper_293372
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
�
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename'user_emb/embeddings/Read/ReadVariableOp(movie_emb/embeddings/Read/ReadVariableOp(user_emb1/embeddings/Read/ReadVariableOp)movie_emb1/embeddings/Read/ReadVariableOp y_out/kernel/Read/ReadVariableOpy_out/bias/Read/ReadVariableOp!dense0/kernel/Read/ReadVariableOpdense0/bias/Read/ReadVariableOp!rating/kernel/Read/ReadVariableOprating/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOp.Adam/user_emb/embeddings/m/Read/ReadVariableOp/Adam/movie_emb/embeddings/m/Read/ReadVariableOp/Adam/user_emb1/embeddings/m/Read/ReadVariableOp0Adam/movie_emb1/embeddings/m/Read/ReadVariableOp'Adam/y_out/kernel/m/Read/ReadVariableOp%Adam/y_out/bias/m/Read/ReadVariableOp(Adam/dense0/kernel/m/Read/ReadVariableOp&Adam/dense0/bias/m/Read/ReadVariableOp(Adam/rating/kernel/m/Read/ReadVariableOp&Adam/rating/bias/m/Read/ReadVariableOp.Adam/user_emb/embeddings/v/Read/ReadVariableOp/Adam/movie_emb/embeddings/v/Read/ReadVariableOp/Adam/user_emb1/embeddings/v/Read/ReadVariableOp0Adam/movie_emb1/embeddings/v/Read/ReadVariableOp'Adam/y_out/kernel/v/Read/ReadVariableOp%Adam/y_out/bias/v/Read/ReadVariableOp(Adam/dense0/kernel/v/Read/ReadVariableOp&Adam/dense0/bias/v/Read/ReadVariableOp(Adam/rating/kernel/v/Read/ReadVariableOp&Adam/rating/bias/v/Read/ReadVariableOpConst*4
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
GPU 2J 8� *(
f#R!
__inference__traced_save_294027
�
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameuser_emb/embeddingsmovie_emb/embeddingsuser_emb1/embeddingsmovie_emb1/embeddingsy_out/kernel
y_out/biasdense0/kerneldense0/biasrating/kernelrating/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotal_1count_1totalcountAdam/user_emb/embeddings/mAdam/movie_emb/embeddings/mAdam/user_emb1/embeddings/mAdam/movie_emb1/embeddings/mAdam/y_out/kernel/mAdam/y_out/bias/mAdam/dense0/kernel/mAdam/dense0/bias/mAdam/rating/kernel/mAdam/rating/bias/mAdam/user_emb/embeddings/vAdam/movie_emb/embeddings/vAdam/user_emb1/embeddings/vAdam/movie_emb1/embeddings/vAdam/y_out/kernel/vAdam/y_out/bias/vAdam/dense0/kernel/vAdam/dense0/bias/vAdam/rating/kernel/vAdam/rating/bias/v*3
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
GPU 2J 8� *+
f&R$
"__inference__traced_restore_294154��	
�	
f
J__inference_reshape_movie1_layer_call_and_return_conditional_losses_292887

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2u
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:d
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:���������2X
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:���������2"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������2:S O
+
_output_shapes
:���������2
 
_user_specified_nameinputs
�	
c
G__inference_reshape_usr_layer_call_and_return_conditional_losses_292901

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2u
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:d
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:���������2X
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:���������2"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������2:S O
+
_output_shapes
:���������2
 
_user_specified_nameinputs
�
i
?__inference_dot_layer_call_and_return_conditional_losses_292952

inputs
inputs_1
identityW
l2_normalize/SquareSquareinputs*
T0*'
_output_shapes
:���������2d
"l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :�
l2_normalize/SumSuml2_normalize/Square:y:0+l2_normalize/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims([
l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *̼�+�
l2_normalize/MaximumMaximuml2_normalize/Sum:output:0l2_normalize/Maximum/y:output:0*
T0*'
_output_shapes
:���������g
l2_normalize/RsqrtRsqrtl2_normalize/Maximum:z:0*
T0*'
_output_shapes
:���������e
l2_normalizeMulinputsl2_normalize/Rsqrt:y:0*
T0*'
_output_shapes
:���������2[
l2_normalize_1/SquareSquareinputs_1*
T0*'
_output_shapes
:���������2f
$l2_normalize_1/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :�
l2_normalize_1/SumSuml2_normalize_1/Square:y:0-l2_normalize_1/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(]
l2_normalize_1/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *̼�+�
l2_normalize_1/MaximumMaximuml2_normalize_1/Sum:output:0!l2_normalize_1/Maximum/y:output:0*
T0*'
_output_shapes
:���������k
l2_normalize_1/RsqrtRsqrtl2_normalize_1/Maximum:z:0*
T0*'
_output_shapes
:���������k
l2_normalize_1Mulinputs_1l2_normalize_1/Rsqrt:y:0*
T0*'
_output_shapes
:���������2P
ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :y

ExpandDims
ExpandDimsl2_normalize:z:0ExpandDims/dim:output:0*
T0*+
_output_shapes
:���������2R
ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B :
ExpandDims_1
ExpandDimsl2_normalize_1:z:0ExpandDims_1/dim:output:0*
T0*+
_output_shapes
:���������2y
MatMulBatchMatMulV2ExpandDims:output:0ExpandDims_1:output:0*
T0*+
_output_shapes
:���������D
ShapeShapeMatMul:output:0*
T0*
_output_shapes
:l
SqueezeSqueezeMatMul:output:0*
T0*'
_output_shapes
:���������*
squeeze_dims
X
IdentityIdentitySqueeze:output:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:���������2:���������2:O K
'
_output_shapes
:���������2
 
_user_specified_nameinputs:OK
'
_output_shapes
:���������2
 
_user_specified_nameinputs
�
�
$__inference_NCF_layer_call_fn_293398
inputs_0
inputs_1
unknown:
��2
	unknown_0:	�2
	unknown_1:
��2
	unknown_2:	�2
	unknown_3:
	unknown_4:
	unknown_5:d
	unknown_6:
	unknown_7:
	unknown_8:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputs_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8� *H
fCRA
?__inference_NCF_layer_call_and_return_conditional_losses_293013o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
'
_output_shapes
:���������
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:���������
"
_user_specified_name
inputs/1
�
�
'__inference_rating_layer_call_fn_293876

inputs
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_rating_layer_call_and_return_conditional_losses_293006o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�	
�
A__inference_y_out_layer_call_and_return_conditional_losses_292964

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������_
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�	
d
H__inference_reshape_usr1_layer_call_and_return_conditional_losses_293753

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2u
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:d
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:���������2X
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:���������2"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������2:S O
+
_output_shapes
:���������2
 
_user_specified_nameinputs
�
�
"__inference__traced_restore_294154
file_prefix7
$assignvariableop_user_emb_embeddings:	�2;
'assignvariableop_1_movie_emb_embeddings:
��2:
'assignvariableop_2_user_emb1_embeddings:	�2<
(assignvariableop_3_movie_emb1_embeddings:
��21
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
&assignvariableop_14_adam_learning_rate: %
assignvariableop_15_total_1: %
assignvariableop_16_count_1: #
assignvariableop_17_total: #
assignvariableop_18_count: A
.assignvariableop_19_adam_user_emb_embeddings_m:	�2C
/assignvariableop_20_adam_movie_emb_embeddings_m:
��2B
/assignvariableop_21_adam_user_emb1_embeddings_m:	�2D
0assignvariableop_22_adam_movie_emb1_embeddings_m:
��29
'assignvariableop_23_adam_y_out_kernel_m:3
%assignvariableop_24_adam_y_out_bias_m::
(assignvariableop_25_adam_dense0_kernel_m:d4
&assignvariableop_26_adam_dense0_bias_m::
(assignvariableop_27_adam_rating_kernel_m:4
&assignvariableop_28_adam_rating_bias_m:A
.assignvariableop_29_adam_user_emb_embeddings_v:	�2C
/assignvariableop_30_adam_movie_emb_embeddings_v:
��2B
/assignvariableop_31_adam_user_emb1_embeddings_v:	�2D
0assignvariableop_32_adam_movie_emb1_embeddings_v:
��29
'assignvariableop_33_adam_y_out_kernel_v:3
%assignvariableop_34_adam_y_out_bias_v::
(assignvariableop_35_adam_dense0_kernel_v:d4
&assignvariableop_36_adam_dense0_bias_v::
(assignvariableop_37_adam_rating_kernel_v:4
&assignvariableop_38_adam_rating_bias_v:
identity_40��AssignVariableOp�AssignVariableOp_1�AssignVariableOp_10�AssignVariableOp_11�AssignVariableOp_12�AssignVariableOp_13�AssignVariableOp_14�AssignVariableOp_15�AssignVariableOp_16�AssignVariableOp_17�AssignVariableOp_18�AssignVariableOp_19�AssignVariableOp_2�AssignVariableOp_20�AssignVariableOp_21�AssignVariableOp_22�AssignVariableOp_23�AssignVariableOp_24�AssignVariableOp_25�AssignVariableOp_26�AssignVariableOp_27�AssignVariableOp_28�AssignVariableOp_29�AssignVariableOp_3�AssignVariableOp_30�AssignVariableOp_31�AssignVariableOp_32�AssignVariableOp_33�AssignVariableOp_34�AssignVariableOp_35�AssignVariableOp_36�AssignVariableOp_37�AssignVariableOp_38�AssignVariableOp_4�AssignVariableOp_5�AssignVariableOp_6�AssignVariableOp_7�AssignVariableOp_8�AssignVariableOp_9�
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:(*
dtype0*�
value�B�(B:layer_with_weights-0/embeddings/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-1/embeddings/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-2/embeddings/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-3/embeddings/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-2/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-3/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-2/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-3/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:(*
dtype0*c
valueZBX(B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B �
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*�
_output_shapes�
�::::::::::::::::::::::::::::::::::::::::*6
dtypes,
*2(	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOpAssignVariableOp$assignvariableop_user_emb_embeddingsIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_1AssignVariableOp'assignvariableop_1_movie_emb_embeddingsIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_2AssignVariableOp'assignvariableop_2_user_emb1_embeddingsIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_3AssignVariableOp(assignvariableop_3_movie_emb1_embeddingsIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_4AssignVariableOpassignvariableop_4_y_out_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_5AssignVariableOpassignvariableop_5_y_out_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_6AssignVariableOp assignvariableop_6_dense0_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_7AssignVariableOpassignvariableop_7_dense0_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_8AssignVariableOp assignvariableop_8_rating_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_9AssignVariableOpassignvariableop_9_rating_biasIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_10AssignVariableOpassignvariableop_10_adam_iterIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_11AssignVariableOpassignvariableop_11_adam_beta_1Identity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_12AssignVariableOpassignvariableop_12_adam_beta_2Identity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_13AssignVariableOpassignvariableop_13_adam_decayIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_14AssignVariableOp&assignvariableop_14_adam_learning_rateIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_15AssignVariableOpassignvariableop_15_total_1Identity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_16AssignVariableOpassignvariableop_16_count_1Identity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_17AssignVariableOpassignvariableop_17_totalIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_18AssignVariableOpassignvariableop_18_countIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_19AssignVariableOp.assignvariableop_19_adam_user_emb_embeddings_mIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_20AssignVariableOp/assignvariableop_20_adam_movie_emb_embeddings_mIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_21AssignVariableOp/assignvariableop_21_adam_user_emb1_embeddings_mIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_22AssignVariableOp0assignvariableop_22_adam_movie_emb1_embeddings_mIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_23AssignVariableOp'assignvariableop_23_adam_y_out_kernel_mIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_24AssignVariableOp%assignvariableop_24_adam_y_out_bias_mIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_25AssignVariableOp(assignvariableop_25_adam_dense0_kernel_mIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_26AssignVariableOp&assignvariableop_26_adam_dense0_bias_mIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_27AssignVariableOp(assignvariableop_27_adam_rating_kernel_mIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_28AssignVariableOp&assignvariableop_28_adam_rating_bias_mIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_29AssignVariableOp.assignvariableop_29_adam_user_emb_embeddings_vIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_30AssignVariableOp/assignvariableop_30_adam_movie_emb_embeddings_vIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_31AssignVariableOp/assignvariableop_31_adam_user_emb1_embeddings_vIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_32AssignVariableOp0assignvariableop_32_adam_movie_emb1_embeddings_vIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_33AssignVariableOp'assignvariableop_33_adam_y_out_kernel_vIdentity_33:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_34AssignVariableOp%assignvariableop_34_adam_y_out_bias_vIdentity_34:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_35AssignVariableOp(assignvariableop_35_adam_dense0_kernel_vIdentity_35:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_36AssignVariableOp&assignvariableop_36_adam_dense0_bias_vIdentity_36:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_37AssignVariableOp(assignvariableop_37_adam_rating_kernel_vIdentity_37:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_38AssignVariableOp&assignvariableop_38_adam_rating_bias_vIdentity_38:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 �
Identity_39Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_40IdentityIdentity_39:output:0^NoOp_1*
T0*
_output_shapes
: �
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
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
�

*__inference_user_emb1_layer_call_fn_293675

inputs
unknown:	�2
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *N
fIRG
E__inference_user_emb1_layer_call_and_return_conditional_losses_292829s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:���������2`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:���������: 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
m
C__inference_concat2_layer_call_and_return_conditional_losses_292994

inputs
inputs_1
identityM
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :u
concatConcatV2inputsinputs_1concat/axis:output:0*
N*
T0*'
_output_shapes
:���������W
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:���������:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs:OK
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
I
-__inference_reshape_usr1_layer_call_fn_293741

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *Q
fLRJ
H__inference_reshape_usr1_layer_call_and_return_conditional_losses_292873`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������2"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������2:S O
+
_output_shapes
:���������2
 
_user_specified_nameinputs
�	
�
B__inference_rating_layer_call_and_return_conditional_losses_293006

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������_
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�

�
B__inference_dense0_layer_call_and_return_conditional_losses_292981

inputs0
matmul_readvariableop_resource:d-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:d*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������d: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������d
 
_user_specified_nameinputs
�	
�
D__inference_user_emb_layer_call_and_return_conditional_losses_292857

inputs*
embedding_lookup_292851:	�2
identity��embedding_lookupU
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:����������
embedding_lookupResourceGatherembedding_lookup_292851Cast:y:0*
Tindices0**
_class 
loc:@embedding_lookup/292851*+
_output_shapes
:���������2*
dtype0�
embedding_lookup/IdentityIdentityembedding_lookup:output:0*
T0**
_class 
loc:@embedding_lookup/292851*+
_output_shapes
:���������2�
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:���������2w
IdentityIdentity$embedding_lookup/Identity_1:output:0^NoOp*
T0*+
_output_shapes
:���������2Y
NoOpNoOp^embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:���������: 2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�	
�
A__inference_y_out_layer_call_and_return_conditional_losses_293834

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������_
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�	
�
F__inference_movie_emb1_layer_call_and_return_conditional_losses_292815

inputs+
embedding_lookup_292809:
��2
identity��embedding_lookupU
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:����������
embedding_lookupResourceGatherembedding_lookup_292809Cast:y:0*
Tindices0**
_class 
loc:@embedding_lookup/292809*+
_output_shapes
:���������2*
dtype0�
embedding_lookup/IdentityIdentityembedding_lookup:output:0*
T0**
_class 
loc:@embedding_lookup/292809*+
_output_shapes
:���������2�
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:���������2w
IdentityIdentity$embedding_lookup/Identity_1:output:0^NoOp*
T0*+
_output_shapes
:���������2Y
NoOpNoOp^embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:���������: 2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
$__inference_NCF_layer_call_fn_293036
user_inp
	movie_inp
unknown:
��2
	unknown_0:	�2
	unknown_1:
��2
	unknown_2:	�2
	unknown_3:
	unknown_4:
	unknown_5:d
	unknown_6:
	unknown_7:
	unknown_8:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCalluser_inp	movie_inpunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8� *H
fCRA
?__inference_NCF_layer_call_and_return_conditional_losses_293013o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
'
_output_shapes
:���������
"
_user_specified_name
user_inp:RN
'
_output_shapes
:���������
#
_user_specified_name	movie_inp
�
�
$__inference_NCF_layer_call_fn_293424
inputs_0
inputs_1
unknown:
��2
	unknown_0:	�2
	unknown_1:
��2
	unknown_2:	�2
	unknown_3:
	unknown_4:
	unknown_5:d
	unknown_6:
	unknown_7:
	unknown_8:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputs_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8� *H
fCRA
?__inference_NCF_layer_call_and_return_conditional_losses_293211o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
'
_output_shapes
:���������
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:���������
"
_user_specified_name
inputs/1
�
J
.__inference_reshape_movie_layer_call_fn_293724

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *R
fMRK
I__inference_reshape_movie_layer_call_and_return_conditional_losses_292915`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������2"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������2:S O
+
_output_shapes
:���������2
 
_user_specified_nameinputs
�
T
(__inference_concat2_layer_call_fn_293860
inputs_0
inputs_1
identity�
PartitionedCallPartitionedCallinputs_0inputs_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_concat2_layer_call_and_return_conditional_losses_292994`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:���������:���������:Q M
'
_output_shapes
:���������
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:���������
"
_user_specified_name
inputs/1
�	
d
H__inference_reshape_usr1_layer_call_and_return_conditional_losses_292873

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2u
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:d
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:���������2X
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:���������2"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������2:S O
+
_output_shapes
:���������2
 
_user_specified_nameinputs
�
�
*__inference_movie_emb_layer_call_fn_293658

inputs
unknown:
��2
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *N
fIRG
E__inference_movie_emb_layer_call_and_return_conditional_losses_292843s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:���������2`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:���������: 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
$__inference_NCF_layer_call_fn_293260
user_inp
	movie_inp
unknown:
��2
	unknown_0:	�2
	unknown_1:
��2
	unknown_2:	�2
	unknown_3:
	unknown_4:
	unknown_5:d
	unknown_6:
	unknown_7:
	unknown_8:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCalluser_inp	movie_inpunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8� *H
fCRA
?__inference_NCF_layer_call_and_return_conditional_losses_293211o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
'
_output_shapes
:���������
"
_user_specified_name
user_inp:RN
'
_output_shapes
:���������
#
_user_specified_name	movie_inp
�7
�
?__inference_NCF_layer_call_and_return_conditional_losses_293299
user_inp
	movie_inp%
movie_emb1_293264:
��2#
user_emb1_293267:	�2$
movie_emb_293270:
��2"
user_emb_293273:	�2
y_out_293282:
y_out_293284:
dense0_293287:d
dense0_293289:
rating_293293:
rating_293295:
identity��dense0/StatefulPartitionedCall�!movie_emb/StatefulPartitionedCall�"movie_emb1/StatefulPartitionedCall�rating/StatefulPartitionedCall� user_emb/StatefulPartitionedCall�!user_emb1/StatefulPartitionedCall�y_out/StatefulPartitionedCall�
"movie_emb1/StatefulPartitionedCallStatefulPartitionedCall	movie_inpmovie_emb1_293264*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_movie_emb1_layer_call_and_return_conditional_losses_292815�
!user_emb1/StatefulPartitionedCallStatefulPartitionedCalluser_inpuser_emb1_293267*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *N
fIRG
E__inference_user_emb1_layer_call_and_return_conditional_losses_292829�
!movie_emb/StatefulPartitionedCallStatefulPartitionedCall	movie_inpmovie_emb_293270*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *N
fIRG
E__inference_movie_emb_layer_call_and_return_conditional_losses_292843�
 user_emb/StatefulPartitionedCallStatefulPartitionedCalluser_inpuser_emb_293273*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_user_emb_layer_call_and_return_conditional_losses_292857�
reshape_usr1/PartitionedCallPartitionedCall*user_emb1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *Q
fLRJ
H__inference_reshape_usr1_layer_call_and_return_conditional_losses_292873�
reshape_movie1/PartitionedCallPartitionedCall+movie_emb1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *S
fNRL
J__inference_reshape_movie1_layer_call_and_return_conditional_losses_292887�
reshape_usr/PartitionedCallPartitionedCall)user_emb/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_reshape_usr_layer_call_and_return_conditional_losses_292901�
reshape_movie/PartitionedCallPartitionedCall*movie_emb/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *R
fMRK
I__inference_reshape_movie_layer_call_and_return_conditional_losses_292915�
concat/PartitionedCallPartitionedCall%reshape_usr1/PartitionedCall:output:0'reshape_movie1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_concat_layer_call_and_return_conditional_losses_292924�
dot/PartitionedCallPartitionedCall$reshape_usr/PartitionedCall:output:0&reshape_movie/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *H
fCRA
?__inference_dot_layer_call_and_return_conditional_losses_292952�
y_out/StatefulPartitionedCallStatefulPartitionedCalldot/PartitionedCall:output:0y_out_293282y_out_293284*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_y_out_layer_call_and_return_conditional_losses_292964�
dense0/StatefulPartitionedCallStatefulPartitionedCallconcat/PartitionedCall:output:0dense0_293287dense0_293289*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_dense0_layer_call_and_return_conditional_losses_292981�
concat2/PartitionedCallPartitionedCall&y_out/StatefulPartitionedCall:output:0'dense0/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_concat2_layer_call_and_return_conditional_losses_292994�
rating/StatefulPartitionedCallStatefulPartitionedCall concat2/PartitionedCall:output:0rating_293293rating_293295*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_rating_layer_call_and_return_conditional_losses_293006v
IdentityIdentity'rating/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^dense0/StatefulPartitionedCall"^movie_emb/StatefulPartitionedCall#^movie_emb1/StatefulPartitionedCall^rating/StatefulPartitionedCall!^user_emb/StatefulPartitionedCall"^user_emb1/StatefulPartitionedCall^y_out/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������: : : : : : : : : : 2@
dense0/StatefulPartitionedCalldense0/StatefulPartitionedCall2F
!movie_emb/StatefulPartitionedCall!movie_emb/StatefulPartitionedCall2H
"movie_emb1/StatefulPartitionedCall"movie_emb1/StatefulPartitionedCall2@
rating/StatefulPartitionedCallrating/StatefulPartitionedCall2D
 user_emb/StatefulPartitionedCall user_emb/StatefulPartitionedCall2F
!user_emb1/StatefulPartitionedCall!user_emb1/StatefulPartitionedCall2>
y_out/StatefulPartitionedCally_out/StatefulPartitionedCall:Q M
'
_output_shapes
:���������
"
_user_specified_name
user_inp:RN
'
_output_shapes
:���������
#
_user_specified_name	movie_inp
�
�
$__inference_signature_wrapper_293372
	movie_inp
user_inp
unknown:
��2
	unknown_0:	�2
	unknown_1:
��2
	unknown_2:	�2
	unknown_3:
	unknown_4:
	unknown_5:d
	unknown_6:
	unknown_7:
	unknown_8:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCalluser_inp	movie_inpunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8� **
f%R#
!__inference__wrapped_model_292796o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:R N
'
_output_shapes
:���������
#
_user_specified_name	movie_inp:QM
'
_output_shapes
:���������
"
_user_specified_name
user_inp
�	
�
F__inference_movie_emb1_layer_call_and_return_conditional_losses_293702

inputs+
embedding_lookup_293696:
��2
identity��embedding_lookupU
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:����������
embedding_lookupResourceGatherembedding_lookup_293696Cast:y:0*
Tindices0**
_class 
loc:@embedding_lookup/293696*+
_output_shapes
:���������2*
dtype0�
embedding_lookup/IdentityIdentityembedding_lookup:output:0*
T0**
_class 
loc:@embedding_lookup/293696*+
_output_shapes
:���������2�
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:���������2w
IdentityIdentity$embedding_lookup/Identity_1:output:0^NoOp*
T0*+
_output_shapes
:���������2Y
NoOpNoOp^embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:���������: 2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
H
,__inference_reshape_usr_layer_call_fn_293707

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_reshape_usr_layer_call_and_return_conditional_losses_292901`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������2"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������2:S O
+
_output_shapes
:���������2
 
_user_specified_nameinputs
�
K
/__inference_reshape_movie1_layer_call_fn_293758

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *S
fNRL
J__inference_reshape_movie1_layer_call_and_return_conditional_losses_292887`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������2"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������2:S O
+
_output_shapes
:���������2
 
_user_specified_nameinputs
�
P
$__inference_dot_layer_call_fn_293776
inputs_0
inputs_1
identity�
PartitionedCallPartitionedCallinputs_0inputs_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *H
fCRA
?__inference_dot_layer_call_and_return_conditional_losses_292952`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:���������2:���������2:Q M
'
_output_shapes
:���������2
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:���������2
"
_user_specified_name
inputs/1
�	
e
I__inference_reshape_movie_layer_call_and_return_conditional_losses_293736

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2u
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:d
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:���������2X
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:���������2"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������2:S O
+
_output_shapes
:���������2
 
_user_specified_nameinputs
�	
�
E__inference_movie_emb_layer_call_and_return_conditional_losses_293668

inputs+
embedding_lookup_293662:
��2
identity��embedding_lookupU
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:����������
embedding_lookupResourceGatherembedding_lookup_293662Cast:y:0*
Tindices0**
_class 
loc:@embedding_lookup/293662*+
_output_shapes
:���������2*
dtype0�
embedding_lookup/IdentityIdentityembedding_lookup:output:0*
T0**
_class 
loc:@embedding_lookup/293662*+
_output_shapes
:���������2�
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:���������2w
IdentityIdentity$embedding_lookup/Identity_1:output:0^NoOp*
T0*+
_output_shapes
:���������2Y
NoOpNoOp^embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:���������: 2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�	
�
E__inference_movie_emb_layer_call_and_return_conditional_losses_292843

inputs+
embedding_lookup_292837:
��2
identity��embedding_lookupU
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:����������
embedding_lookupResourceGatherembedding_lookup_292837Cast:y:0*
Tindices0**
_class 
loc:@embedding_lookup/292837*+
_output_shapes
:���������2*
dtype0�
embedding_lookup/IdentityIdentityembedding_lookup:output:0*
T0**
_class 
loc:@embedding_lookup/292837*+
_output_shapes
:���������2�
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:���������2w
IdentityIdentity$embedding_lookup/Identity_1:output:0^NoOp*
T0*+
_output_shapes
:���������2Y
NoOpNoOp^embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:���������: 2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�Q
�
__inference__traced_save_294027
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
-savev2_adam_learning_rate_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop9
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

identity_1��MergeV2Checkpointsw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part�
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : �
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: �
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:(*
dtype0*�
value�B�(B:layer_with_weights-0/embeddings/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-1/embeddings/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-2/embeddings/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-3/embeddings/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-2/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-3/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-2/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-3/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:(*
dtype0*c
valueZBX(B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B �
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0.savev2_user_emb_embeddings_read_readvariableop/savev2_movie_emb_embeddings_read_readvariableop/savev2_user_emb1_embeddings_read_readvariableop0savev2_movie_emb1_embeddings_read_readvariableop'savev2_y_out_kernel_read_readvariableop%savev2_y_out_bias_read_readvariableop(savev2_dense0_kernel_read_readvariableop&savev2_dense0_bias_read_readvariableop(savev2_rating_kernel_read_readvariableop&savev2_rating_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop5savev2_adam_user_emb_embeddings_m_read_readvariableop6savev2_adam_movie_emb_embeddings_m_read_readvariableop6savev2_adam_user_emb1_embeddings_m_read_readvariableop7savev2_adam_movie_emb1_embeddings_m_read_readvariableop.savev2_adam_y_out_kernel_m_read_readvariableop,savev2_adam_y_out_bias_m_read_readvariableop/savev2_adam_dense0_kernel_m_read_readvariableop-savev2_adam_dense0_bias_m_read_readvariableop/savev2_adam_rating_kernel_m_read_readvariableop-savev2_adam_rating_bias_m_read_readvariableop5savev2_adam_user_emb_embeddings_v_read_readvariableop6savev2_adam_movie_emb_embeddings_v_read_readvariableop6savev2_adam_user_emb1_embeddings_v_read_readvariableop7savev2_adam_movie_emb1_embeddings_v_read_readvariableop.savev2_adam_y_out_kernel_v_read_readvariableop,savev2_adam_y_out_bias_v_read_readvariableop/savev2_adam_dense0_kernel_v_read_readvariableop-savev2_adam_dense0_bias_v_read_readvariableop/savev2_adam_rating_kernel_v_read_readvariableop-savev2_adam_rating_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *6
dtypes,
*2(	�
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:�
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*�
_input_shapes�
�: :	�2:
��2:	�2:
��2:::d:::: : : : : : : : : :	�2:
��2:	�2:
��2:::d::::	�2:
��2:	�2:
��2:::d:::: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:%!

_output_shapes
:	�2:&"
 
_output_shapes
:
��2:%!

_output_shapes
:	�2:&"
 
_output_shapes
:
��2:$ 

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
: :%!

_output_shapes
:	�2:&"
 
_output_shapes
:
��2:%!

_output_shapes
:	�2:&"
 
_output_shapes
:
��2:$ 

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
::%!

_output_shapes
:	�2:&"
 
_output_shapes
:
��2:% !

_output_shapes
:	�2:&!"
 
_output_shapes
:
��2:$" 

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
�
�
&__inference_y_out_layer_call_fn_293824

inputs
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_y_out_layer_call_and_return_conditional_losses_292964o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�7
�
?__inference_NCF_layer_call_and_return_conditional_losses_293013

inputs
inputs_1%
movie_emb1_292816:
��2#
user_emb1_292830:	�2$
movie_emb_292844:
��2"
user_emb_292858:	�2
y_out_292965:
y_out_292967:
dense0_292982:d
dense0_292984:
rating_293007:
rating_293009:
identity��dense0/StatefulPartitionedCall�!movie_emb/StatefulPartitionedCall�"movie_emb1/StatefulPartitionedCall�rating/StatefulPartitionedCall� user_emb/StatefulPartitionedCall�!user_emb1/StatefulPartitionedCall�y_out/StatefulPartitionedCall�
"movie_emb1/StatefulPartitionedCallStatefulPartitionedCallinputs_1movie_emb1_292816*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_movie_emb1_layer_call_and_return_conditional_losses_292815�
!user_emb1/StatefulPartitionedCallStatefulPartitionedCallinputsuser_emb1_292830*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *N
fIRG
E__inference_user_emb1_layer_call_and_return_conditional_losses_292829�
!movie_emb/StatefulPartitionedCallStatefulPartitionedCallinputs_1movie_emb_292844*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *N
fIRG
E__inference_movie_emb_layer_call_and_return_conditional_losses_292843�
 user_emb/StatefulPartitionedCallStatefulPartitionedCallinputsuser_emb_292858*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_user_emb_layer_call_and_return_conditional_losses_292857�
reshape_usr1/PartitionedCallPartitionedCall*user_emb1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *Q
fLRJ
H__inference_reshape_usr1_layer_call_and_return_conditional_losses_292873�
reshape_movie1/PartitionedCallPartitionedCall+movie_emb1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *S
fNRL
J__inference_reshape_movie1_layer_call_and_return_conditional_losses_292887�
reshape_usr/PartitionedCallPartitionedCall)user_emb/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_reshape_usr_layer_call_and_return_conditional_losses_292901�
reshape_movie/PartitionedCallPartitionedCall*movie_emb/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *R
fMRK
I__inference_reshape_movie_layer_call_and_return_conditional_losses_292915�
concat/PartitionedCallPartitionedCall%reshape_usr1/PartitionedCall:output:0'reshape_movie1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_concat_layer_call_and_return_conditional_losses_292924�
dot/PartitionedCallPartitionedCall$reshape_usr/PartitionedCall:output:0&reshape_movie/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *H
fCRA
?__inference_dot_layer_call_and_return_conditional_losses_292952�
y_out/StatefulPartitionedCallStatefulPartitionedCalldot/PartitionedCall:output:0y_out_292965y_out_292967*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_y_out_layer_call_and_return_conditional_losses_292964�
dense0/StatefulPartitionedCallStatefulPartitionedCallconcat/PartitionedCall:output:0dense0_292982dense0_292984*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_dense0_layer_call_and_return_conditional_losses_292981�
concat2/PartitionedCallPartitionedCall&y_out/StatefulPartitionedCall:output:0'dense0/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_concat2_layer_call_and_return_conditional_losses_292994�
rating/StatefulPartitionedCallStatefulPartitionedCall concat2/PartitionedCall:output:0rating_293007rating_293009*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_rating_layer_call_and_return_conditional_losses_293006v
IdentityIdentity'rating/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^dense0/StatefulPartitionedCall"^movie_emb/StatefulPartitionedCall#^movie_emb1/StatefulPartitionedCall^rating/StatefulPartitionedCall!^user_emb/StatefulPartitionedCall"^user_emb1/StatefulPartitionedCall^y_out/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������: : : : : : : : : : 2@
dense0/StatefulPartitionedCalldense0/StatefulPartitionedCall2F
!movie_emb/StatefulPartitionedCall!movie_emb/StatefulPartitionedCall2H
"movie_emb1/StatefulPartitionedCall"movie_emb1/StatefulPartitionedCall2@
rating/StatefulPartitionedCallrating/StatefulPartitionedCall2D
 user_emb/StatefulPartitionedCall user_emb/StatefulPartitionedCall2F
!user_emb1/StatefulPartitionedCall!user_emb1/StatefulPartitionedCall2>
y_out/StatefulPartitionedCally_out/StatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs:OK
'
_output_shapes
:���������
 
_user_specified_nameinputs
�	
�
E__inference_user_emb1_layer_call_and_return_conditional_losses_292829

inputs*
embedding_lookup_292823:	�2
identity��embedding_lookupU
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:����������
embedding_lookupResourceGatherembedding_lookup_292823Cast:y:0*
Tindices0**
_class 
loc:@embedding_lookup/292823*+
_output_shapes
:���������2*
dtype0�
embedding_lookup/IdentityIdentityembedding_lookup:output:0*
T0**
_class 
loc:@embedding_lookup/292823*+
_output_shapes
:���������2�
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:���������2w
IdentityIdentity$embedding_lookup/Identity_1:output:0^NoOp*
T0*+
_output_shapes
:���������2Y
NoOpNoOp^embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:���������: 2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�	
e
I__inference_reshape_movie_layer_call_and_return_conditional_losses_292915

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2u
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:d
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:���������2X
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:���������2"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������2:S O
+
_output_shapes
:���������2
 
_user_specified_nameinputs
�q
�
?__inference_NCF_layer_call_and_return_conditional_losses_293634
inputs_0
inputs_16
"movie_emb1_embedding_lookup_293534:
��24
!user_emb1_embedding_lookup_293540:	�25
!movie_emb_embedding_lookup_293546:
��23
 user_emb_embedding_lookup_293552:	�26
$y_out_matmul_readvariableop_resource:3
%y_out_biasadd_readvariableop_resource:7
%dense0_matmul_readvariableop_resource:d4
&dense0_biasadd_readvariableop_resource:7
%rating_matmul_readvariableop_resource:4
&rating_biasadd_readvariableop_resource:
identity��dense0/BiasAdd/ReadVariableOp�dense0/MatMul/ReadVariableOp�movie_emb/embedding_lookup�movie_emb1/embedding_lookup�rating/BiasAdd/ReadVariableOp�rating/MatMul/ReadVariableOp�user_emb/embedding_lookup�user_emb1/embedding_lookup�y_out/BiasAdd/ReadVariableOp�y_out/MatMul/ReadVariableOpb
movie_emb1/CastCastinputs_1*

DstT0*

SrcT0*'
_output_shapes
:����������
movie_emb1/embedding_lookupResourceGather"movie_emb1_embedding_lookup_293534movie_emb1/Cast:y:0*
Tindices0*5
_class+
)'loc:@movie_emb1/embedding_lookup/293534*+
_output_shapes
:���������2*
dtype0�
$movie_emb1/embedding_lookup/IdentityIdentity$movie_emb1/embedding_lookup:output:0*
T0*5
_class+
)'loc:@movie_emb1/embedding_lookup/293534*+
_output_shapes
:���������2�
&movie_emb1/embedding_lookup/Identity_1Identity-movie_emb1/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:���������2a
user_emb1/CastCastinputs_0*

DstT0*

SrcT0*'
_output_shapes
:����������
user_emb1/embedding_lookupResourceGather!user_emb1_embedding_lookup_293540user_emb1/Cast:y:0*
Tindices0*4
_class*
(&loc:@user_emb1/embedding_lookup/293540*+
_output_shapes
:���������2*
dtype0�
#user_emb1/embedding_lookup/IdentityIdentity#user_emb1/embedding_lookup:output:0*
T0*4
_class*
(&loc:@user_emb1/embedding_lookup/293540*+
_output_shapes
:���������2�
%user_emb1/embedding_lookup/Identity_1Identity,user_emb1/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:���������2a
movie_emb/CastCastinputs_1*

DstT0*

SrcT0*'
_output_shapes
:����������
movie_emb/embedding_lookupResourceGather!movie_emb_embedding_lookup_293546movie_emb/Cast:y:0*
Tindices0*4
_class*
(&loc:@movie_emb/embedding_lookup/293546*+
_output_shapes
:���������2*
dtype0�
#movie_emb/embedding_lookup/IdentityIdentity#movie_emb/embedding_lookup:output:0*
T0*4
_class*
(&loc:@movie_emb/embedding_lookup/293546*+
_output_shapes
:���������2�
%movie_emb/embedding_lookup/Identity_1Identity,movie_emb/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:���������2`
user_emb/CastCastinputs_0*

DstT0*

SrcT0*'
_output_shapes
:����������
user_emb/embedding_lookupResourceGather user_emb_embedding_lookup_293552user_emb/Cast:y:0*
Tindices0*3
_class)
'%loc:@user_emb/embedding_lookup/293552*+
_output_shapes
:���������2*
dtype0�
"user_emb/embedding_lookup/IdentityIdentity"user_emb/embedding_lookup:output:0*
T0*3
_class)
'%loc:@user_emb/embedding_lookup/293552*+
_output_shapes
:���������2�
$user_emb/embedding_lookup/Identity_1Identity+user_emb/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:���������2p
reshape_usr1/ShapeShape.user_emb1/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:j
 reshape_usr1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: l
"reshape_usr1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:l
"reshape_usr1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
reshape_usr1/strided_sliceStridedSlicereshape_usr1/Shape:output:0)reshape_usr1/strided_slice/stack:output:0+reshape_usr1/strided_slice/stack_1:output:0+reshape_usr1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask^
reshape_usr1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2�
reshape_usr1/Reshape/shapePack#reshape_usr1/strided_slice:output:0%reshape_usr1/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:�
reshape_usr1/ReshapeReshape.user_emb1/embedding_lookup/Identity_1:output:0#reshape_usr1/Reshape/shape:output:0*
T0*'
_output_shapes
:���������2s
reshape_movie1/ShapeShape/movie_emb1/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:l
"reshape_movie1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: n
$reshape_movie1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:n
$reshape_movie1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
reshape_movie1/strided_sliceStridedSlicereshape_movie1/Shape:output:0+reshape_movie1/strided_slice/stack:output:0-reshape_movie1/strided_slice/stack_1:output:0-reshape_movie1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask`
reshape_movie1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2�
reshape_movie1/Reshape/shapePack%reshape_movie1/strided_slice:output:0'reshape_movie1/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:�
reshape_movie1/ReshapeReshape/movie_emb1/embedding_lookup/Identity_1:output:0%reshape_movie1/Reshape/shape:output:0*
T0*'
_output_shapes
:���������2n
reshape_usr/ShapeShape-user_emb/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:i
reshape_usr/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: k
!reshape_usr/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:k
!reshape_usr/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
reshape_usr/strided_sliceStridedSlicereshape_usr/Shape:output:0(reshape_usr/strided_slice/stack:output:0*reshape_usr/strided_slice/stack_1:output:0*reshape_usr/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask]
reshape_usr/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2�
reshape_usr/Reshape/shapePack"reshape_usr/strided_slice:output:0$reshape_usr/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:�
reshape_usr/ReshapeReshape-user_emb/embedding_lookup/Identity_1:output:0"reshape_usr/Reshape/shape:output:0*
T0*'
_output_shapes
:���������2q
reshape_movie/ShapeShape.movie_emb/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:k
!reshape_movie/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: m
#reshape_movie/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:m
#reshape_movie/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
reshape_movie/strided_sliceStridedSlicereshape_movie/Shape:output:0*reshape_movie/strided_slice/stack:output:0,reshape_movie/strided_slice/stack_1:output:0,reshape_movie/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
reshape_movie/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2�
reshape_movie/Reshape/shapePack$reshape_movie/strided_slice:output:0&reshape_movie/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:�
reshape_movie/ReshapeReshape.movie_emb/embedding_lookup/Identity_1:output:0$reshape_movie/Reshape/shape:output:0*
T0*'
_output_shapes
:���������2T
concat/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
concat/concatConcatV2reshape_usr1/Reshape:output:0reshape_movie1/Reshape:output:0concat/concat/axis:output:0*
N*
T0*'
_output_shapes
:���������dq
dot/l2_normalize/SquareSquarereshape_usr/Reshape:output:0*
T0*'
_output_shapes
:���������2h
&dot/l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :�
dot/l2_normalize/SumSumdot/l2_normalize/Square:y:0/dot/l2_normalize/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(_
dot/l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *̼�+�
dot/l2_normalize/MaximumMaximumdot/l2_normalize/Sum:output:0#dot/l2_normalize/Maximum/y:output:0*
T0*'
_output_shapes
:���������o
dot/l2_normalize/RsqrtRsqrtdot/l2_normalize/Maximum:z:0*
T0*'
_output_shapes
:����������
dot/l2_normalizeMulreshape_usr/Reshape:output:0dot/l2_normalize/Rsqrt:y:0*
T0*'
_output_shapes
:���������2u
dot/l2_normalize_1/SquareSquarereshape_movie/Reshape:output:0*
T0*'
_output_shapes
:���������2j
(dot/l2_normalize_1/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :�
dot/l2_normalize_1/SumSumdot/l2_normalize_1/Square:y:01dot/l2_normalize_1/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(a
dot/l2_normalize_1/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *̼�+�
dot/l2_normalize_1/MaximumMaximumdot/l2_normalize_1/Sum:output:0%dot/l2_normalize_1/Maximum/y:output:0*
T0*'
_output_shapes
:���������s
dot/l2_normalize_1/RsqrtRsqrtdot/l2_normalize_1/Maximum:z:0*
T0*'
_output_shapes
:����������
dot/l2_normalize_1Mulreshape_movie/Reshape:output:0dot/l2_normalize_1/Rsqrt:y:0*
T0*'
_output_shapes
:���������2T
dot/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :�
dot/ExpandDims
ExpandDimsdot/l2_normalize:z:0dot/ExpandDims/dim:output:0*
T0*+
_output_shapes
:���������2V
dot/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B :�
dot/ExpandDims_1
ExpandDimsdot/l2_normalize_1:z:0dot/ExpandDims_1/dim:output:0*
T0*+
_output_shapes
:���������2�

dot/MatMulBatchMatMulV2dot/ExpandDims:output:0dot/ExpandDims_1:output:0*
T0*+
_output_shapes
:���������L
	dot/ShapeShapedot/MatMul:output:0*
T0*
_output_shapes
:t
dot/SqueezeSqueezedot/MatMul:output:0*
T0*'
_output_shapes
:���������*
squeeze_dims
�
y_out/MatMul/ReadVariableOpReadVariableOp$y_out_matmul_readvariableop_resource*
_output_shapes

:*
dtype0�
y_out/MatMulMatMuldot/Squeeze:output:0#y_out/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������~
y_out/BiasAdd/ReadVariableOpReadVariableOp%y_out_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
y_out/BiasAddBiasAddy_out/MatMul:product:0$y_out/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
dense0/MatMul/ReadVariableOpReadVariableOp%dense0_matmul_readvariableop_resource*
_output_shapes

:d*
dtype0�
dense0/MatMulMatMulconcat/concat:output:0$dense0/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
dense0/BiasAdd/ReadVariableOpReadVariableOp&dense0_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
dense0/BiasAddBiasAdddense0/MatMul:product:0%dense0/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������^
dense0/ReluReludense0/BiasAdd:output:0*
T0*'
_output_shapes
:���������U
concat2/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
concat2/concatConcatV2y_out/BiasAdd:output:0dense0/Relu:activations:0concat2/concat/axis:output:0*
N*
T0*'
_output_shapes
:����������
rating/MatMul/ReadVariableOpReadVariableOp%rating_matmul_readvariableop_resource*
_output_shapes

:*
dtype0�
rating/MatMulMatMulconcat2/concat:output:0$rating/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
rating/BiasAdd/ReadVariableOpReadVariableOp&rating_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
rating/BiasAddBiasAddrating/MatMul:product:0%rating/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������f
IdentityIdentityrating/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^dense0/BiasAdd/ReadVariableOp^dense0/MatMul/ReadVariableOp^movie_emb/embedding_lookup^movie_emb1/embedding_lookup^rating/BiasAdd/ReadVariableOp^rating/MatMul/ReadVariableOp^user_emb/embedding_lookup^user_emb1/embedding_lookup^y_out/BiasAdd/ReadVariableOp^y_out/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������: : : : : : : : : : 2>
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
:���������
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:���������
"
_user_specified_name
inputs/1
�
k
?__inference_dot_layer_call_and_return_conditional_losses_293802
inputs_0
inputs_1
identityY
l2_normalize/SquareSquareinputs_0*
T0*'
_output_shapes
:���������2d
"l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :�
l2_normalize/SumSuml2_normalize/Square:y:0+l2_normalize/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims([
l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *̼�+�
l2_normalize/MaximumMaximuml2_normalize/Sum:output:0l2_normalize/Maximum/y:output:0*
T0*'
_output_shapes
:���������g
l2_normalize/RsqrtRsqrtl2_normalize/Maximum:z:0*
T0*'
_output_shapes
:���������g
l2_normalizeMulinputs_0l2_normalize/Rsqrt:y:0*
T0*'
_output_shapes
:���������2[
l2_normalize_1/SquareSquareinputs_1*
T0*'
_output_shapes
:���������2f
$l2_normalize_1/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :�
l2_normalize_1/SumSuml2_normalize_1/Square:y:0-l2_normalize_1/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(]
l2_normalize_1/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *̼�+�
l2_normalize_1/MaximumMaximuml2_normalize_1/Sum:output:0!l2_normalize_1/Maximum/y:output:0*
T0*'
_output_shapes
:���������k
l2_normalize_1/RsqrtRsqrtl2_normalize_1/Maximum:z:0*
T0*'
_output_shapes
:���������k
l2_normalize_1Mulinputs_1l2_normalize_1/Rsqrt:y:0*
T0*'
_output_shapes
:���������2P
ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :y

ExpandDims
ExpandDimsl2_normalize:z:0ExpandDims/dim:output:0*
T0*+
_output_shapes
:���������2R
ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B :
ExpandDims_1
ExpandDimsl2_normalize_1:z:0ExpandDims_1/dim:output:0*
T0*+
_output_shapes
:���������2y
MatMulBatchMatMulV2ExpandDims:output:0ExpandDims_1:output:0*
T0*+
_output_shapes
:���������D
ShapeShapeMatMul:output:0*
T0*
_output_shapes
:l
SqueezeSqueezeMatMul:output:0*
T0*'
_output_shapes
:���������*
squeeze_dims
X
IdentityIdentitySqueeze:output:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:���������2:���������2:Q M
'
_output_shapes
:���������2
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:���������2
"
_user_specified_name
inputs/1
�
n
B__inference_concat_layer_call_and_return_conditional_losses_293815
inputs_0
inputs_1
identityM
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :w
concatConcatV2inputs_0inputs_1concat/axis:output:0*
N*
T0*'
_output_shapes
:���������dW
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:���������d"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:���������2:���������2:Q M
'
_output_shapes
:���������2
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:���������2
"
_user_specified_name
inputs/1
�x
�
!__inference__wrapped_model_292796
user_inp
	movie_inp:
&ncf_movie_emb1_embedding_lookup_292696:
��28
%ncf_user_emb1_embedding_lookup_292702:	�29
%ncf_movie_emb_embedding_lookup_292708:
��27
$ncf_user_emb_embedding_lookup_292714:	�2:
(ncf_y_out_matmul_readvariableop_resource:7
)ncf_y_out_biasadd_readvariableop_resource:;
)ncf_dense0_matmul_readvariableop_resource:d8
*ncf_dense0_biasadd_readvariableop_resource:;
)ncf_rating_matmul_readvariableop_resource:8
*ncf_rating_biasadd_readvariableop_resource:
identity��!NCF/dense0/BiasAdd/ReadVariableOp� NCF/dense0/MatMul/ReadVariableOp�NCF/movie_emb/embedding_lookup�NCF/movie_emb1/embedding_lookup�!NCF/rating/BiasAdd/ReadVariableOp� NCF/rating/MatMul/ReadVariableOp�NCF/user_emb/embedding_lookup�NCF/user_emb1/embedding_lookup� NCF/y_out/BiasAdd/ReadVariableOp�NCF/y_out/MatMul/ReadVariableOpg
NCF/movie_emb1/CastCast	movie_inp*

DstT0*

SrcT0*'
_output_shapes
:����������
NCF/movie_emb1/embedding_lookupResourceGather&ncf_movie_emb1_embedding_lookup_292696NCF/movie_emb1/Cast:y:0*
Tindices0*9
_class/
-+loc:@NCF/movie_emb1/embedding_lookup/292696*+
_output_shapes
:���������2*
dtype0�
(NCF/movie_emb1/embedding_lookup/IdentityIdentity(NCF/movie_emb1/embedding_lookup:output:0*
T0*9
_class/
-+loc:@NCF/movie_emb1/embedding_lookup/292696*+
_output_shapes
:���������2�
*NCF/movie_emb1/embedding_lookup/Identity_1Identity1NCF/movie_emb1/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:���������2e
NCF/user_emb1/CastCastuser_inp*

DstT0*

SrcT0*'
_output_shapes
:����������
NCF/user_emb1/embedding_lookupResourceGather%ncf_user_emb1_embedding_lookup_292702NCF/user_emb1/Cast:y:0*
Tindices0*8
_class.
,*loc:@NCF/user_emb1/embedding_lookup/292702*+
_output_shapes
:���������2*
dtype0�
'NCF/user_emb1/embedding_lookup/IdentityIdentity'NCF/user_emb1/embedding_lookup:output:0*
T0*8
_class.
,*loc:@NCF/user_emb1/embedding_lookup/292702*+
_output_shapes
:���������2�
)NCF/user_emb1/embedding_lookup/Identity_1Identity0NCF/user_emb1/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:���������2f
NCF/movie_emb/CastCast	movie_inp*

DstT0*

SrcT0*'
_output_shapes
:����������
NCF/movie_emb/embedding_lookupResourceGather%ncf_movie_emb_embedding_lookup_292708NCF/movie_emb/Cast:y:0*
Tindices0*8
_class.
,*loc:@NCF/movie_emb/embedding_lookup/292708*+
_output_shapes
:���������2*
dtype0�
'NCF/movie_emb/embedding_lookup/IdentityIdentity'NCF/movie_emb/embedding_lookup:output:0*
T0*8
_class.
,*loc:@NCF/movie_emb/embedding_lookup/292708*+
_output_shapes
:���������2�
)NCF/movie_emb/embedding_lookup/Identity_1Identity0NCF/movie_emb/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:���������2d
NCF/user_emb/CastCastuser_inp*

DstT0*

SrcT0*'
_output_shapes
:����������
NCF/user_emb/embedding_lookupResourceGather$ncf_user_emb_embedding_lookup_292714NCF/user_emb/Cast:y:0*
Tindices0*7
_class-
+)loc:@NCF/user_emb/embedding_lookup/292714*+
_output_shapes
:���������2*
dtype0�
&NCF/user_emb/embedding_lookup/IdentityIdentity&NCF/user_emb/embedding_lookup:output:0*
T0*7
_class-
+)loc:@NCF/user_emb/embedding_lookup/292714*+
_output_shapes
:���������2�
(NCF/user_emb/embedding_lookup/Identity_1Identity/NCF/user_emb/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:���������2x
NCF/reshape_usr1/ShapeShape2NCF/user_emb1/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:n
$NCF/reshape_usr1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: p
&NCF/reshape_usr1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:p
&NCF/reshape_usr1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
NCF/reshape_usr1/strided_sliceStridedSliceNCF/reshape_usr1/Shape:output:0-NCF/reshape_usr1/strided_slice/stack:output:0/NCF/reshape_usr1/strided_slice/stack_1:output:0/NCF/reshape_usr1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskb
 NCF/reshape_usr1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2�
NCF/reshape_usr1/Reshape/shapePack'NCF/reshape_usr1/strided_slice:output:0)NCF/reshape_usr1/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:�
NCF/reshape_usr1/ReshapeReshape2NCF/user_emb1/embedding_lookup/Identity_1:output:0'NCF/reshape_usr1/Reshape/shape:output:0*
T0*'
_output_shapes
:���������2{
NCF/reshape_movie1/ShapeShape3NCF/movie_emb1/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:p
&NCF/reshape_movie1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(NCF/reshape_movie1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(NCF/reshape_movie1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
 NCF/reshape_movie1/strided_sliceStridedSlice!NCF/reshape_movie1/Shape:output:0/NCF/reshape_movie1/strided_slice/stack:output:01NCF/reshape_movie1/strided_slice/stack_1:output:01NCF/reshape_movie1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskd
"NCF/reshape_movie1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2�
 NCF/reshape_movie1/Reshape/shapePack)NCF/reshape_movie1/strided_slice:output:0+NCF/reshape_movie1/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:�
NCF/reshape_movie1/ReshapeReshape3NCF/movie_emb1/embedding_lookup/Identity_1:output:0)NCF/reshape_movie1/Reshape/shape:output:0*
T0*'
_output_shapes
:���������2v
NCF/reshape_usr/ShapeShape1NCF/user_emb/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:m
#NCF/reshape_usr/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: o
%NCF/reshape_usr/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:o
%NCF/reshape_usr/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
NCF/reshape_usr/strided_sliceStridedSliceNCF/reshape_usr/Shape:output:0,NCF/reshape_usr/strided_slice/stack:output:0.NCF/reshape_usr/strided_slice/stack_1:output:0.NCF/reshape_usr/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maska
NCF/reshape_usr/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2�
NCF/reshape_usr/Reshape/shapePack&NCF/reshape_usr/strided_slice:output:0(NCF/reshape_usr/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:�
NCF/reshape_usr/ReshapeReshape1NCF/user_emb/embedding_lookup/Identity_1:output:0&NCF/reshape_usr/Reshape/shape:output:0*
T0*'
_output_shapes
:���������2y
NCF/reshape_movie/ShapeShape2NCF/movie_emb/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:o
%NCF/reshape_movie/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: q
'NCF/reshape_movie/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:q
'NCF/reshape_movie/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
NCF/reshape_movie/strided_sliceStridedSlice NCF/reshape_movie/Shape:output:0.NCF/reshape_movie/strided_slice/stack:output:00NCF/reshape_movie/strided_slice/stack_1:output:00NCF/reshape_movie/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskc
!NCF/reshape_movie/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2�
NCF/reshape_movie/Reshape/shapePack(NCF/reshape_movie/strided_slice:output:0*NCF/reshape_movie/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:�
NCF/reshape_movie/ReshapeReshape2NCF/movie_emb/embedding_lookup/Identity_1:output:0(NCF/reshape_movie/Reshape/shape:output:0*
T0*'
_output_shapes
:���������2X
NCF/concat/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
NCF/concat/concatConcatV2!NCF/reshape_usr1/Reshape:output:0#NCF/reshape_movie1/Reshape:output:0NCF/concat/concat/axis:output:0*
N*
T0*'
_output_shapes
:���������dy
NCF/dot/l2_normalize/SquareSquare NCF/reshape_usr/Reshape:output:0*
T0*'
_output_shapes
:���������2l
*NCF/dot/l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :�
NCF/dot/l2_normalize/SumSumNCF/dot/l2_normalize/Square:y:03NCF/dot/l2_normalize/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(c
NCF/dot/l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *̼�+�
NCF/dot/l2_normalize/MaximumMaximum!NCF/dot/l2_normalize/Sum:output:0'NCF/dot/l2_normalize/Maximum/y:output:0*
T0*'
_output_shapes
:���������w
NCF/dot/l2_normalize/RsqrtRsqrt NCF/dot/l2_normalize/Maximum:z:0*
T0*'
_output_shapes
:����������
NCF/dot/l2_normalizeMul NCF/reshape_usr/Reshape:output:0NCF/dot/l2_normalize/Rsqrt:y:0*
T0*'
_output_shapes
:���������2}
NCF/dot/l2_normalize_1/SquareSquare"NCF/reshape_movie/Reshape:output:0*
T0*'
_output_shapes
:���������2n
,NCF/dot/l2_normalize_1/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :�
NCF/dot/l2_normalize_1/SumSum!NCF/dot/l2_normalize_1/Square:y:05NCF/dot/l2_normalize_1/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(e
 NCF/dot/l2_normalize_1/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *̼�+�
NCF/dot/l2_normalize_1/MaximumMaximum#NCF/dot/l2_normalize_1/Sum:output:0)NCF/dot/l2_normalize_1/Maximum/y:output:0*
T0*'
_output_shapes
:���������{
NCF/dot/l2_normalize_1/RsqrtRsqrt"NCF/dot/l2_normalize_1/Maximum:z:0*
T0*'
_output_shapes
:����������
NCF/dot/l2_normalize_1Mul"NCF/reshape_movie/Reshape:output:0 NCF/dot/l2_normalize_1/Rsqrt:y:0*
T0*'
_output_shapes
:���������2X
NCF/dot/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :�
NCF/dot/ExpandDims
ExpandDimsNCF/dot/l2_normalize:z:0NCF/dot/ExpandDims/dim:output:0*
T0*+
_output_shapes
:���������2Z
NCF/dot/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B :�
NCF/dot/ExpandDims_1
ExpandDimsNCF/dot/l2_normalize_1:z:0!NCF/dot/ExpandDims_1/dim:output:0*
T0*+
_output_shapes
:���������2�
NCF/dot/MatMulBatchMatMulV2NCF/dot/ExpandDims:output:0NCF/dot/ExpandDims_1:output:0*
T0*+
_output_shapes
:���������T
NCF/dot/ShapeShapeNCF/dot/MatMul:output:0*
T0*
_output_shapes
:|
NCF/dot/SqueezeSqueezeNCF/dot/MatMul:output:0*
T0*'
_output_shapes
:���������*
squeeze_dims
�
NCF/y_out/MatMul/ReadVariableOpReadVariableOp(ncf_y_out_matmul_readvariableop_resource*
_output_shapes

:*
dtype0�
NCF/y_out/MatMulMatMulNCF/dot/Squeeze:output:0'NCF/y_out/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
 NCF/y_out/BiasAdd/ReadVariableOpReadVariableOp)ncf_y_out_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
NCF/y_out/BiasAddBiasAddNCF/y_out/MatMul:product:0(NCF/y_out/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
 NCF/dense0/MatMul/ReadVariableOpReadVariableOp)ncf_dense0_matmul_readvariableop_resource*
_output_shapes

:d*
dtype0�
NCF/dense0/MatMulMatMulNCF/concat/concat:output:0(NCF/dense0/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
!NCF/dense0/BiasAdd/ReadVariableOpReadVariableOp*ncf_dense0_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
NCF/dense0/BiasAddBiasAddNCF/dense0/MatMul:product:0)NCF/dense0/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������f
NCF/dense0/ReluReluNCF/dense0/BiasAdd:output:0*
T0*'
_output_shapes
:���������Y
NCF/concat2/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
NCF/concat2/concatConcatV2NCF/y_out/BiasAdd:output:0NCF/dense0/Relu:activations:0 NCF/concat2/concat/axis:output:0*
N*
T0*'
_output_shapes
:����������
 NCF/rating/MatMul/ReadVariableOpReadVariableOp)ncf_rating_matmul_readvariableop_resource*
_output_shapes

:*
dtype0�
NCF/rating/MatMulMatMulNCF/concat2/concat:output:0(NCF/rating/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
!NCF/rating/BiasAdd/ReadVariableOpReadVariableOp*ncf_rating_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
NCF/rating/BiasAddBiasAddNCF/rating/MatMul:product:0)NCF/rating/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������j
IdentityIdentityNCF/rating/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp"^NCF/dense0/BiasAdd/ReadVariableOp!^NCF/dense0/MatMul/ReadVariableOp^NCF/movie_emb/embedding_lookup ^NCF/movie_emb1/embedding_lookup"^NCF/rating/BiasAdd/ReadVariableOp!^NCF/rating/MatMul/ReadVariableOp^NCF/user_emb/embedding_lookup^NCF/user_emb1/embedding_lookup!^NCF/y_out/BiasAdd/ReadVariableOp ^NCF/y_out/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������: : : : : : : : : : 2F
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
:���������
"
_user_specified_name
user_inp:RN
'
_output_shapes
:���������
#
_user_specified_name	movie_inp
�	
�
B__inference_rating_layer_call_and_return_conditional_losses_293886

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������_
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
~
)__inference_user_emb_layer_call_fn_293641

inputs
unknown:	�2
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_user_emb_layer_call_and_return_conditional_losses_292857s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:���������2`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:���������: 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�q
�
?__inference_NCF_layer_call_and_return_conditional_losses_293529
inputs_0
inputs_16
"movie_emb1_embedding_lookup_293429:
��24
!user_emb1_embedding_lookup_293435:	�25
!movie_emb_embedding_lookup_293441:
��23
 user_emb_embedding_lookup_293447:	�26
$y_out_matmul_readvariableop_resource:3
%y_out_biasadd_readvariableop_resource:7
%dense0_matmul_readvariableop_resource:d4
&dense0_biasadd_readvariableop_resource:7
%rating_matmul_readvariableop_resource:4
&rating_biasadd_readvariableop_resource:
identity��dense0/BiasAdd/ReadVariableOp�dense0/MatMul/ReadVariableOp�movie_emb/embedding_lookup�movie_emb1/embedding_lookup�rating/BiasAdd/ReadVariableOp�rating/MatMul/ReadVariableOp�user_emb/embedding_lookup�user_emb1/embedding_lookup�y_out/BiasAdd/ReadVariableOp�y_out/MatMul/ReadVariableOpb
movie_emb1/CastCastinputs_1*

DstT0*

SrcT0*'
_output_shapes
:����������
movie_emb1/embedding_lookupResourceGather"movie_emb1_embedding_lookup_293429movie_emb1/Cast:y:0*
Tindices0*5
_class+
)'loc:@movie_emb1/embedding_lookup/293429*+
_output_shapes
:���������2*
dtype0�
$movie_emb1/embedding_lookup/IdentityIdentity$movie_emb1/embedding_lookup:output:0*
T0*5
_class+
)'loc:@movie_emb1/embedding_lookup/293429*+
_output_shapes
:���������2�
&movie_emb1/embedding_lookup/Identity_1Identity-movie_emb1/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:���������2a
user_emb1/CastCastinputs_0*

DstT0*

SrcT0*'
_output_shapes
:����������
user_emb1/embedding_lookupResourceGather!user_emb1_embedding_lookup_293435user_emb1/Cast:y:0*
Tindices0*4
_class*
(&loc:@user_emb1/embedding_lookup/293435*+
_output_shapes
:���������2*
dtype0�
#user_emb1/embedding_lookup/IdentityIdentity#user_emb1/embedding_lookup:output:0*
T0*4
_class*
(&loc:@user_emb1/embedding_lookup/293435*+
_output_shapes
:���������2�
%user_emb1/embedding_lookup/Identity_1Identity,user_emb1/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:���������2a
movie_emb/CastCastinputs_1*

DstT0*

SrcT0*'
_output_shapes
:����������
movie_emb/embedding_lookupResourceGather!movie_emb_embedding_lookup_293441movie_emb/Cast:y:0*
Tindices0*4
_class*
(&loc:@movie_emb/embedding_lookup/293441*+
_output_shapes
:���������2*
dtype0�
#movie_emb/embedding_lookup/IdentityIdentity#movie_emb/embedding_lookup:output:0*
T0*4
_class*
(&loc:@movie_emb/embedding_lookup/293441*+
_output_shapes
:���������2�
%movie_emb/embedding_lookup/Identity_1Identity,movie_emb/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:���������2`
user_emb/CastCastinputs_0*

DstT0*

SrcT0*'
_output_shapes
:����������
user_emb/embedding_lookupResourceGather user_emb_embedding_lookup_293447user_emb/Cast:y:0*
Tindices0*3
_class)
'%loc:@user_emb/embedding_lookup/293447*+
_output_shapes
:���������2*
dtype0�
"user_emb/embedding_lookup/IdentityIdentity"user_emb/embedding_lookup:output:0*
T0*3
_class)
'%loc:@user_emb/embedding_lookup/293447*+
_output_shapes
:���������2�
$user_emb/embedding_lookup/Identity_1Identity+user_emb/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:���������2p
reshape_usr1/ShapeShape.user_emb1/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:j
 reshape_usr1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: l
"reshape_usr1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:l
"reshape_usr1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
reshape_usr1/strided_sliceStridedSlicereshape_usr1/Shape:output:0)reshape_usr1/strided_slice/stack:output:0+reshape_usr1/strided_slice/stack_1:output:0+reshape_usr1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask^
reshape_usr1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2�
reshape_usr1/Reshape/shapePack#reshape_usr1/strided_slice:output:0%reshape_usr1/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:�
reshape_usr1/ReshapeReshape.user_emb1/embedding_lookup/Identity_1:output:0#reshape_usr1/Reshape/shape:output:0*
T0*'
_output_shapes
:���������2s
reshape_movie1/ShapeShape/movie_emb1/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:l
"reshape_movie1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: n
$reshape_movie1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:n
$reshape_movie1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
reshape_movie1/strided_sliceStridedSlicereshape_movie1/Shape:output:0+reshape_movie1/strided_slice/stack:output:0-reshape_movie1/strided_slice/stack_1:output:0-reshape_movie1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask`
reshape_movie1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2�
reshape_movie1/Reshape/shapePack%reshape_movie1/strided_slice:output:0'reshape_movie1/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:�
reshape_movie1/ReshapeReshape/movie_emb1/embedding_lookup/Identity_1:output:0%reshape_movie1/Reshape/shape:output:0*
T0*'
_output_shapes
:���������2n
reshape_usr/ShapeShape-user_emb/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:i
reshape_usr/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: k
!reshape_usr/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:k
!reshape_usr/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
reshape_usr/strided_sliceStridedSlicereshape_usr/Shape:output:0(reshape_usr/strided_slice/stack:output:0*reshape_usr/strided_slice/stack_1:output:0*reshape_usr/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask]
reshape_usr/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2�
reshape_usr/Reshape/shapePack"reshape_usr/strided_slice:output:0$reshape_usr/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:�
reshape_usr/ReshapeReshape-user_emb/embedding_lookup/Identity_1:output:0"reshape_usr/Reshape/shape:output:0*
T0*'
_output_shapes
:���������2q
reshape_movie/ShapeShape.movie_emb/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:k
!reshape_movie/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: m
#reshape_movie/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:m
#reshape_movie/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
reshape_movie/strided_sliceStridedSlicereshape_movie/Shape:output:0*reshape_movie/strided_slice/stack:output:0,reshape_movie/strided_slice/stack_1:output:0,reshape_movie/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
reshape_movie/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2�
reshape_movie/Reshape/shapePack$reshape_movie/strided_slice:output:0&reshape_movie/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:�
reshape_movie/ReshapeReshape.movie_emb/embedding_lookup/Identity_1:output:0$reshape_movie/Reshape/shape:output:0*
T0*'
_output_shapes
:���������2T
concat/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
concat/concatConcatV2reshape_usr1/Reshape:output:0reshape_movie1/Reshape:output:0concat/concat/axis:output:0*
N*
T0*'
_output_shapes
:���������dq
dot/l2_normalize/SquareSquarereshape_usr/Reshape:output:0*
T0*'
_output_shapes
:���������2h
&dot/l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :�
dot/l2_normalize/SumSumdot/l2_normalize/Square:y:0/dot/l2_normalize/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(_
dot/l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *̼�+�
dot/l2_normalize/MaximumMaximumdot/l2_normalize/Sum:output:0#dot/l2_normalize/Maximum/y:output:0*
T0*'
_output_shapes
:���������o
dot/l2_normalize/RsqrtRsqrtdot/l2_normalize/Maximum:z:0*
T0*'
_output_shapes
:����������
dot/l2_normalizeMulreshape_usr/Reshape:output:0dot/l2_normalize/Rsqrt:y:0*
T0*'
_output_shapes
:���������2u
dot/l2_normalize_1/SquareSquarereshape_movie/Reshape:output:0*
T0*'
_output_shapes
:���������2j
(dot/l2_normalize_1/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :�
dot/l2_normalize_1/SumSumdot/l2_normalize_1/Square:y:01dot/l2_normalize_1/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(a
dot/l2_normalize_1/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *̼�+�
dot/l2_normalize_1/MaximumMaximumdot/l2_normalize_1/Sum:output:0%dot/l2_normalize_1/Maximum/y:output:0*
T0*'
_output_shapes
:���������s
dot/l2_normalize_1/RsqrtRsqrtdot/l2_normalize_1/Maximum:z:0*
T0*'
_output_shapes
:����������
dot/l2_normalize_1Mulreshape_movie/Reshape:output:0dot/l2_normalize_1/Rsqrt:y:0*
T0*'
_output_shapes
:���������2T
dot/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :�
dot/ExpandDims
ExpandDimsdot/l2_normalize:z:0dot/ExpandDims/dim:output:0*
T0*+
_output_shapes
:���������2V
dot/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B :�
dot/ExpandDims_1
ExpandDimsdot/l2_normalize_1:z:0dot/ExpandDims_1/dim:output:0*
T0*+
_output_shapes
:���������2�

dot/MatMulBatchMatMulV2dot/ExpandDims:output:0dot/ExpandDims_1:output:0*
T0*+
_output_shapes
:���������L
	dot/ShapeShapedot/MatMul:output:0*
T0*
_output_shapes
:t
dot/SqueezeSqueezedot/MatMul:output:0*
T0*'
_output_shapes
:���������*
squeeze_dims
�
y_out/MatMul/ReadVariableOpReadVariableOp$y_out_matmul_readvariableop_resource*
_output_shapes

:*
dtype0�
y_out/MatMulMatMuldot/Squeeze:output:0#y_out/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������~
y_out/BiasAdd/ReadVariableOpReadVariableOp%y_out_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
y_out/BiasAddBiasAddy_out/MatMul:product:0$y_out/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
dense0/MatMul/ReadVariableOpReadVariableOp%dense0_matmul_readvariableop_resource*
_output_shapes

:d*
dtype0�
dense0/MatMulMatMulconcat/concat:output:0$dense0/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
dense0/BiasAdd/ReadVariableOpReadVariableOp&dense0_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
dense0/BiasAddBiasAdddense0/MatMul:product:0%dense0/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������^
dense0/ReluReludense0/BiasAdd:output:0*
T0*'
_output_shapes
:���������U
concat2/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :�
concat2/concatConcatV2y_out/BiasAdd:output:0dense0/Relu:activations:0concat2/concat/axis:output:0*
N*
T0*'
_output_shapes
:����������
rating/MatMul/ReadVariableOpReadVariableOp%rating_matmul_readvariableop_resource*
_output_shapes

:*
dtype0�
rating/MatMulMatMulconcat2/concat:output:0$rating/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
rating/BiasAdd/ReadVariableOpReadVariableOp&rating_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
rating/BiasAddBiasAddrating/MatMul:product:0%rating/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������f
IdentityIdentityrating/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^dense0/BiasAdd/ReadVariableOp^dense0/MatMul/ReadVariableOp^movie_emb/embedding_lookup^movie_emb1/embedding_lookup^rating/BiasAdd/ReadVariableOp^rating/MatMul/ReadVariableOp^user_emb/embedding_lookup^user_emb1/embedding_lookup^y_out/BiasAdd/ReadVariableOp^y_out/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������: : : : : : : : : : 2>
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
:���������
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:���������
"
_user_specified_name
inputs/1
�	
�
D__inference_user_emb_layer_call_and_return_conditional_losses_293651

inputs*
embedding_lookup_293645:	�2
identity��embedding_lookupU
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:����������
embedding_lookupResourceGatherembedding_lookup_293645Cast:y:0*
Tindices0**
_class 
loc:@embedding_lookup/293645*+
_output_shapes
:���������2*
dtype0�
embedding_lookup/IdentityIdentityembedding_lookup:output:0*
T0**
_class 
loc:@embedding_lookup/293645*+
_output_shapes
:���������2�
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:���������2w
IdentityIdentity$embedding_lookup/Identity_1:output:0^NoOp*
T0*+
_output_shapes
:���������2Y
NoOpNoOp^embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:���������: 2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
+__inference_movie_emb1_layer_call_fn_293692

inputs
unknown:
��2
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_movie_emb1_layer_call_and_return_conditional_losses_292815s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:���������2`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:���������: 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
S
'__inference_concat_layer_call_fn_293808
inputs_0
inputs_1
identity�
PartitionedCallPartitionedCallinputs_0inputs_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_concat_layer_call_and_return_conditional_losses_292924`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������d"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:���������2:���������2:Q M
'
_output_shapes
:���������2
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:���������2
"
_user_specified_name
inputs/1
�
o
C__inference_concat2_layer_call_and_return_conditional_losses_293867
inputs_0
inputs_1
identityM
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :w
concatConcatV2inputs_0inputs_1concat/axis:output:0*
N*
T0*'
_output_shapes
:���������W
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:���������:���������:Q M
'
_output_shapes
:���������
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:���������
"
_user_specified_name
inputs/1
�
�
'__inference_dense0_layer_call_fn_293843

inputs
unknown:d
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_dense0_layer_call_and_return_conditional_losses_292981o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������d: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������d
 
_user_specified_nameinputs
�	
c
G__inference_reshape_usr_layer_call_and_return_conditional_losses_293719

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2u
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:d
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:���������2X
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:���������2"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������2:S O
+
_output_shapes
:���������2
 
_user_specified_nameinputs
�7
�
?__inference_NCF_layer_call_and_return_conditional_losses_293338
user_inp
	movie_inp%
movie_emb1_293303:
��2#
user_emb1_293306:	�2$
movie_emb_293309:
��2"
user_emb_293312:	�2
y_out_293321:
y_out_293323:
dense0_293326:d
dense0_293328:
rating_293332:
rating_293334:
identity��dense0/StatefulPartitionedCall�!movie_emb/StatefulPartitionedCall�"movie_emb1/StatefulPartitionedCall�rating/StatefulPartitionedCall� user_emb/StatefulPartitionedCall�!user_emb1/StatefulPartitionedCall�y_out/StatefulPartitionedCall�
"movie_emb1/StatefulPartitionedCallStatefulPartitionedCall	movie_inpmovie_emb1_293303*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_movie_emb1_layer_call_and_return_conditional_losses_292815�
!user_emb1/StatefulPartitionedCallStatefulPartitionedCalluser_inpuser_emb1_293306*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *N
fIRG
E__inference_user_emb1_layer_call_and_return_conditional_losses_292829�
!movie_emb/StatefulPartitionedCallStatefulPartitionedCall	movie_inpmovie_emb_293309*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *N
fIRG
E__inference_movie_emb_layer_call_and_return_conditional_losses_292843�
 user_emb/StatefulPartitionedCallStatefulPartitionedCalluser_inpuser_emb_293312*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_user_emb_layer_call_and_return_conditional_losses_292857�
reshape_usr1/PartitionedCallPartitionedCall*user_emb1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *Q
fLRJ
H__inference_reshape_usr1_layer_call_and_return_conditional_losses_292873�
reshape_movie1/PartitionedCallPartitionedCall+movie_emb1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *S
fNRL
J__inference_reshape_movie1_layer_call_and_return_conditional_losses_292887�
reshape_usr/PartitionedCallPartitionedCall)user_emb/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_reshape_usr_layer_call_and_return_conditional_losses_292901�
reshape_movie/PartitionedCallPartitionedCall*movie_emb/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *R
fMRK
I__inference_reshape_movie_layer_call_and_return_conditional_losses_292915�
concat/PartitionedCallPartitionedCall%reshape_usr1/PartitionedCall:output:0'reshape_movie1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_concat_layer_call_and_return_conditional_losses_292924�
dot/PartitionedCallPartitionedCall$reshape_usr/PartitionedCall:output:0&reshape_movie/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *H
fCRA
?__inference_dot_layer_call_and_return_conditional_losses_292952�
y_out/StatefulPartitionedCallStatefulPartitionedCalldot/PartitionedCall:output:0y_out_293321y_out_293323*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_y_out_layer_call_and_return_conditional_losses_292964�
dense0/StatefulPartitionedCallStatefulPartitionedCallconcat/PartitionedCall:output:0dense0_293326dense0_293328*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_dense0_layer_call_and_return_conditional_losses_292981�
concat2/PartitionedCallPartitionedCall&y_out/StatefulPartitionedCall:output:0'dense0/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_concat2_layer_call_and_return_conditional_losses_292994�
rating/StatefulPartitionedCallStatefulPartitionedCall concat2/PartitionedCall:output:0rating_293332rating_293334*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_rating_layer_call_and_return_conditional_losses_293006v
IdentityIdentity'rating/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^dense0/StatefulPartitionedCall"^movie_emb/StatefulPartitionedCall#^movie_emb1/StatefulPartitionedCall^rating/StatefulPartitionedCall!^user_emb/StatefulPartitionedCall"^user_emb1/StatefulPartitionedCall^y_out/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������: : : : : : : : : : 2@
dense0/StatefulPartitionedCalldense0/StatefulPartitionedCall2F
!movie_emb/StatefulPartitionedCall!movie_emb/StatefulPartitionedCall2H
"movie_emb1/StatefulPartitionedCall"movie_emb1/StatefulPartitionedCall2@
rating/StatefulPartitionedCallrating/StatefulPartitionedCall2D
 user_emb/StatefulPartitionedCall user_emb/StatefulPartitionedCall2F
!user_emb1/StatefulPartitionedCall!user_emb1/StatefulPartitionedCall2>
y_out/StatefulPartitionedCally_out/StatefulPartitionedCall:Q M
'
_output_shapes
:���������
"
_user_specified_name
user_inp:RN
'
_output_shapes
:���������
#
_user_specified_name	movie_inp
�
l
B__inference_concat_layer_call_and_return_conditional_losses_292924

inputs
inputs_1
identityM
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :u
concatConcatV2inputsinputs_1concat/axis:output:0*
N*
T0*'
_output_shapes
:���������dW
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:���������d"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:���������2:���������2:O K
'
_output_shapes
:���������2
 
_user_specified_nameinputs:OK
'
_output_shapes
:���������2
 
_user_specified_nameinputs
�

�
B__inference_dense0_layer_call_and_return_conditional_losses_293854

inputs0
matmul_readvariableop_resource:d-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:d*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������d: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������d
 
_user_specified_nameinputs
�	
�
E__inference_user_emb1_layer_call_and_return_conditional_losses_293685

inputs*
embedding_lookup_293679:	�2
identity��embedding_lookupU
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:����������
embedding_lookupResourceGatherembedding_lookup_293679Cast:y:0*
Tindices0**
_class 
loc:@embedding_lookup/293679*+
_output_shapes
:���������2*
dtype0�
embedding_lookup/IdentityIdentityembedding_lookup:output:0*
T0**
_class 
loc:@embedding_lookup/293679*+
_output_shapes
:���������2�
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:���������2w
IdentityIdentity$embedding_lookup/Identity_1:output:0^NoOp*
T0*+
_output_shapes
:���������2Y
NoOpNoOp^embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:���������: 2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�7
�
?__inference_NCF_layer_call_and_return_conditional_losses_293211

inputs
inputs_1%
movie_emb1_293176:
��2#
user_emb1_293179:	�2$
movie_emb_293182:
��2"
user_emb_293185:	�2
y_out_293194:
y_out_293196:
dense0_293199:d
dense0_293201:
rating_293205:
rating_293207:
identity��dense0/StatefulPartitionedCall�!movie_emb/StatefulPartitionedCall�"movie_emb1/StatefulPartitionedCall�rating/StatefulPartitionedCall� user_emb/StatefulPartitionedCall�!user_emb1/StatefulPartitionedCall�y_out/StatefulPartitionedCall�
"movie_emb1/StatefulPartitionedCallStatefulPartitionedCallinputs_1movie_emb1_293176*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_movie_emb1_layer_call_and_return_conditional_losses_292815�
!user_emb1/StatefulPartitionedCallStatefulPartitionedCallinputsuser_emb1_293179*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *N
fIRG
E__inference_user_emb1_layer_call_and_return_conditional_losses_292829�
!movie_emb/StatefulPartitionedCallStatefulPartitionedCallinputs_1movie_emb_293182*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *N
fIRG
E__inference_movie_emb_layer_call_and_return_conditional_losses_292843�
 user_emb/StatefulPartitionedCallStatefulPartitionedCallinputsuser_emb_293185*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_user_emb_layer_call_and_return_conditional_losses_292857�
reshape_usr1/PartitionedCallPartitionedCall*user_emb1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *Q
fLRJ
H__inference_reshape_usr1_layer_call_and_return_conditional_losses_292873�
reshape_movie1/PartitionedCallPartitionedCall+movie_emb1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *S
fNRL
J__inference_reshape_movie1_layer_call_and_return_conditional_losses_292887�
reshape_usr/PartitionedCallPartitionedCall)user_emb/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_reshape_usr_layer_call_and_return_conditional_losses_292901�
reshape_movie/PartitionedCallPartitionedCall*movie_emb/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *R
fMRK
I__inference_reshape_movie_layer_call_and_return_conditional_losses_292915�
concat/PartitionedCallPartitionedCall%reshape_usr1/PartitionedCall:output:0'reshape_movie1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_concat_layer_call_and_return_conditional_losses_292924�
dot/PartitionedCallPartitionedCall$reshape_usr/PartitionedCall:output:0&reshape_movie/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *H
fCRA
?__inference_dot_layer_call_and_return_conditional_losses_292952�
y_out/StatefulPartitionedCallStatefulPartitionedCalldot/PartitionedCall:output:0y_out_293194y_out_293196*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_y_out_layer_call_and_return_conditional_losses_292964�
dense0/StatefulPartitionedCallStatefulPartitionedCallconcat/PartitionedCall:output:0dense0_293199dense0_293201*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_dense0_layer_call_and_return_conditional_losses_292981�
concat2/PartitionedCallPartitionedCall&y_out/StatefulPartitionedCall:output:0'dense0/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_concat2_layer_call_and_return_conditional_losses_292994�
rating/StatefulPartitionedCallStatefulPartitionedCall concat2/PartitionedCall:output:0rating_293205rating_293207*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_rating_layer_call_and_return_conditional_losses_293006v
IdentityIdentity'rating/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^dense0/StatefulPartitionedCall"^movie_emb/StatefulPartitionedCall#^movie_emb1/StatefulPartitionedCall^rating/StatefulPartitionedCall!^user_emb/StatefulPartitionedCall"^user_emb1/StatefulPartitionedCall^y_out/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*M
_input_shapes<
::���������:���������: : : : : : : : : : 2@
dense0/StatefulPartitionedCalldense0/StatefulPartitionedCall2F
!movie_emb/StatefulPartitionedCall!movie_emb/StatefulPartitionedCall2H
"movie_emb1/StatefulPartitionedCall"movie_emb1/StatefulPartitionedCall2@
rating/StatefulPartitionedCallrating/StatefulPartitionedCall2D
 user_emb/StatefulPartitionedCall user_emb/StatefulPartitionedCall2F
!user_emb1/StatefulPartitionedCall!user_emb1/StatefulPartitionedCall2>
y_out/StatefulPartitionedCally_out/StatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs:OK
'
_output_shapes
:���������
 
_user_specified_nameinputs
�	
f
J__inference_reshape_movie1_layer_call_and_return_conditional_losses_293770

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :2u
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:d
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:���������2X
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:���������2"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������2:S O
+
_output_shapes
:���������2
 
_user_specified_nameinputs"�L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*�
serving_default�
?
	movie_inp2
serving_default_movie_inp:0���������
=
user_inp1
serving_default_user_inp:0���������:
rating0
StatefulPartitionedCall:0���������tensorflow/serving/predict:��
�
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
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures"
_tf_keras_network
"
_tf_keras_input_layer
"
_tf_keras_input_layer
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
 
embeddings"
_tf_keras_layer
�
!	variables
"trainable_variables
#regularization_losses
$	keras_api
%__call__
*&&call_and_return_all_conditional_losses
'
embeddings"
_tf_keras_layer
�
(	variables
)trainable_variables
*regularization_losses
+	keras_api
,__call__
*-&call_and_return_all_conditional_losses
.
embeddings"
_tf_keras_layer
�
/	variables
0trainable_variables
1regularization_losses
2	keras_api
3__call__
*4&call_and_return_all_conditional_losses
5
embeddings"
_tf_keras_layer
�
6	variables
7trainable_variables
8regularization_losses
9	keras_api
:__call__
*;&call_and_return_all_conditional_losses"
_tf_keras_layer
�
<	variables
=trainable_variables
>regularization_losses
?	keras_api
@__call__
*A&call_and_return_all_conditional_losses"
_tf_keras_layer
�
B	variables
Ctrainable_variables
Dregularization_losses
E	keras_api
F__call__
*G&call_and_return_all_conditional_losses"
_tf_keras_layer
�
H	variables
Itrainable_variables
Jregularization_losses
K	keras_api
L__call__
*M&call_and_return_all_conditional_losses"
_tf_keras_layer
�
N	variables
Otrainable_variables
Pregularization_losses
Q	keras_api
R__call__
*S&call_and_return_all_conditional_losses"
_tf_keras_layer
�
T	variables
Utrainable_variables
Vregularization_losses
W	keras_api
X__call__
*Y&call_and_return_all_conditional_losses"
_tf_keras_layer
�
Z	variables
[trainable_variables
\regularization_losses
]	keras_api
^__call__
*_&call_and_return_all_conditional_losses

`kernel
abias"
_tf_keras_layer
�
b	variables
ctrainable_variables
dregularization_losses
e	keras_api
f__call__
*g&call_and_return_all_conditional_losses

hkernel
ibias"
_tf_keras_layer
�
j	variables
ktrainable_variables
lregularization_losses
m	keras_api
n__call__
*o&call_and_return_all_conditional_losses"
_tf_keras_layer
�
p	variables
qtrainable_variables
rregularization_losses
s	keras_api
t__call__
*u&call_and_return_all_conditional_losses

vkernel
wbias"
_tf_keras_layer
f
 0
'1
.2
53
`4
a5
h6
i7
v8
w9"
trackable_list_wrapper
f
 0
'1
.2
53
`4
a5
h6
i7
v8
w9"
trackable_list_wrapper
 "
trackable_list_wrapper
�
xnon_trainable_variables

ylayers
zmetrics
{layer_regularization_losses
|layer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
�
}trace_0
~trace_1
trace_2
�trace_32�
$__inference_NCF_layer_call_fn_293036
$__inference_NCF_layer_call_fn_293398
$__inference_NCF_layer_call_fn_293424
$__inference_NCF_layer_call_fn_293260�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 z}trace_0z~trace_1ztrace_2z�trace_3
�
�trace_0
�trace_1
�trace_2
�trace_32�
?__inference_NCF_layer_call_and_return_conditional_losses_293529
?__inference_NCF_layer_call_and_return_conditional_losses_293634
?__inference_NCF_layer_call_and_return_conditional_losses_293299
?__inference_NCF_layer_call_and_return_conditional_losses_293338�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 z�trace_0z�trace_1z�trace_2z�trace_3
�B�
!__inference__wrapped_model_292796user_inp	movie_inp"�
���
FullArgSpec
args� 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�
	�iter
�beta_1
�beta_2

�decay
�learning_rate m�'m�.m�5m�`m�am�hm�im�vm�wm� v�'v�.v�5v�`v�av�hv�iv�vv�wv�"
	optimizer
-
�serving_default"
signature_map
'
 0"
trackable_list_wrapper
'
 0"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
)__inference_user_emb_layer_call_fn_293641�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
D__inference_user_emb_layer_call_and_return_conditional_losses_293651�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
&:$	�22user_emb/embeddings
'
'0"
trackable_list_wrapper
'
'0"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
!	variables
"trainable_variables
#regularization_losses
%__call__
*&&call_and_return_all_conditional_losses
&&"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
*__inference_movie_emb_layer_call_fn_293658�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
E__inference_movie_emb_layer_call_and_return_conditional_losses_293668�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
(:&
��22movie_emb/embeddings
'
.0"
trackable_list_wrapper
'
.0"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
(	variables
)trainable_variables
*regularization_losses
,__call__
*-&call_and_return_all_conditional_losses
&-"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
*__inference_user_emb1_layer_call_fn_293675�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
E__inference_user_emb1_layer_call_and_return_conditional_losses_293685�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
':%	�22user_emb1/embeddings
'
50"
trackable_list_wrapper
'
50"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
/	variables
0trainable_variables
1regularization_losses
3__call__
*4&call_and_return_all_conditional_losses
&4"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
+__inference_movie_emb1_layer_call_fn_293692�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
F__inference_movie_emb1_layer_call_and_return_conditional_losses_293702�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
):'
��22movie_emb1/embeddings
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
6	variables
7trainable_variables
8regularization_losses
:__call__
*;&call_and_return_all_conditional_losses
&;"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
,__inference_reshape_usr_layer_call_fn_293707�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
G__inference_reshape_usr_layer_call_and_return_conditional_losses_293719�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
<	variables
=trainable_variables
>regularization_losses
@__call__
*A&call_and_return_all_conditional_losses
&A"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
.__inference_reshape_movie_layer_call_fn_293724�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
I__inference_reshape_movie_layer_call_and_return_conditional_losses_293736�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
B	variables
Ctrainable_variables
Dregularization_losses
F__call__
*G&call_and_return_all_conditional_losses
&G"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
-__inference_reshape_usr1_layer_call_fn_293741�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
H__inference_reshape_usr1_layer_call_and_return_conditional_losses_293753�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
H	variables
Itrainable_variables
Jregularization_losses
L__call__
*M&call_and_return_all_conditional_losses
&M"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
/__inference_reshape_movie1_layer_call_fn_293758�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
J__inference_reshape_movie1_layer_call_and_return_conditional_losses_293770�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
N	variables
Otrainable_variables
Pregularization_losses
R__call__
*S&call_and_return_all_conditional_losses
&S"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
$__inference_dot_layer_call_fn_293776�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
?__inference_dot_layer_call_and_return_conditional_losses_293802�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
T	variables
Utrainable_variables
Vregularization_losses
X__call__
*Y&call_and_return_all_conditional_losses
&Y"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
'__inference_concat_layer_call_fn_293808�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
B__inference_concat_layer_call_and_return_conditional_losses_293815�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
.
`0
a1"
trackable_list_wrapper
.
`0
a1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
Z	variables
[trainable_variables
\regularization_losses
^__call__
*_&call_and_return_all_conditional_losses
&_"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
&__inference_y_out_layer_call_fn_293824�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
A__inference_y_out_layer_call_and_return_conditional_losses_293834�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
:2y_out/kernel
:2
y_out/bias
.
h0
i1"
trackable_list_wrapper
.
h0
i1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
b	variables
ctrainable_variables
dregularization_losses
f__call__
*g&call_and_return_all_conditional_losses
&g"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
'__inference_dense0_layer_call_fn_293843�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
B__inference_dense0_layer_call_and_return_conditional_losses_293854�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
:d2dense0/kernel
:2dense0/bias
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
j	variables
ktrainable_variables
lregularization_losses
n__call__
*o&call_and_return_all_conditional_losses
&o"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
(__inference_concat2_layer_call_fn_293860�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
C__inference_concat2_layer_call_and_return_conditional_losses_293867�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
.
v0
w1"
trackable_list_wrapper
.
v0
w1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
p	variables
qtrainable_variables
rregularization_losses
t__call__
*u&call_and_return_all_conditional_losses
&u"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
'__inference_rating_layer_call_fn_293876�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
B__inference_rating_layer_call_and_return_conditional_losses_293886�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
:2rating/kernel
:2rating/bias
 "
trackable_list_wrapper
�
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
�0
�1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
$__inference_NCF_layer_call_fn_293036user_inp	movie_inp"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�B�
$__inference_NCF_layer_call_fn_293398inputs/0inputs/1"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�B�
$__inference_NCF_layer_call_fn_293424inputs/0inputs/1"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�B�
$__inference_NCF_layer_call_fn_293260user_inp	movie_inp"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�B�
?__inference_NCF_layer_call_and_return_conditional_losses_293529inputs/0inputs/1"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�B�
?__inference_NCF_layer_call_and_return_conditional_losses_293634inputs/0inputs/1"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�B�
?__inference_NCF_layer_call_and_return_conditional_losses_293299user_inp	movie_inp"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�B�
?__inference_NCF_layer_call_and_return_conditional_losses_293338user_inp	movie_inp"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
�B�
$__inference_signature_wrapper_293372	movie_inpuser_inp"�
���
FullArgSpec
args� 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
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
�B�
)__inference_user_emb_layer_call_fn_293641inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
D__inference_user_emb_layer_call_and_return_conditional_losses_293651inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
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
�B�
*__inference_movie_emb_layer_call_fn_293658inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
E__inference_movie_emb_layer_call_and_return_conditional_losses_293668inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
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
�B�
*__inference_user_emb1_layer_call_fn_293675inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
E__inference_user_emb1_layer_call_and_return_conditional_losses_293685inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
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
�B�
+__inference_movie_emb1_layer_call_fn_293692inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
F__inference_movie_emb1_layer_call_and_return_conditional_losses_293702inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
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
�B�
,__inference_reshape_usr_layer_call_fn_293707inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
G__inference_reshape_usr_layer_call_and_return_conditional_losses_293719inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
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
�B�
.__inference_reshape_movie_layer_call_fn_293724inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
I__inference_reshape_movie_layer_call_and_return_conditional_losses_293736inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
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
�B�
-__inference_reshape_usr1_layer_call_fn_293741inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
H__inference_reshape_usr1_layer_call_and_return_conditional_losses_293753inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
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
�B�
/__inference_reshape_movie1_layer_call_fn_293758inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
J__inference_reshape_movie1_layer_call_and_return_conditional_losses_293770inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
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
�B�
$__inference_dot_layer_call_fn_293776inputs/0inputs/1"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
?__inference_dot_layer_call_and_return_conditional_losses_293802inputs/0inputs/1"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
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
�B�
'__inference_concat_layer_call_fn_293808inputs/0inputs/1"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
B__inference_concat_layer_call_and_return_conditional_losses_293815inputs/0inputs/1"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
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
�B�
&__inference_y_out_layer_call_fn_293824inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
A__inference_y_out_layer_call_and_return_conditional_losses_293834inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
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
�B�
'__inference_dense0_layer_call_fn_293843inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
B__inference_dense0_layer_call_and_return_conditional_losses_293854inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
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
�B�
(__inference_concat2_layer_call_fn_293860inputs/0inputs/1"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
C__inference_concat2_layer_call_and_return_conditional_losses_293867inputs/0inputs/1"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
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
�B�
'__inference_rating_layer_call_fn_293876inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
B__inference_rating_layer_call_and_return_conditional_losses_293886inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
R
�	variables
�	keras_api

�total

�count"
_tf_keras_metric
c
�	variables
�	keras_api

�total

�count
�
_fn_kwargs"
_tf_keras_metric
0
�0
�1"
trackable_list_wrapper
.
�	variables"
_generic_user_object
:  (2total
:  (2count
0
�0
�1"
trackable_list_wrapper
.
�	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
+:)	�22Adam/user_emb/embeddings/m
-:+
��22Adam/movie_emb/embeddings/m
,:*	�22Adam/user_emb1/embeddings/m
.:,
��22Adam/movie_emb1/embeddings/m
#:!2Adam/y_out/kernel/m
:2Adam/y_out/bias/m
$:"d2Adam/dense0/kernel/m
:2Adam/dense0/bias/m
$:"2Adam/rating/kernel/m
:2Adam/rating/bias/m
+:)	�22Adam/user_emb/embeddings/v
-:+
��22Adam/movie_emb/embeddings/v
,:*	�22Adam/user_emb1/embeddings/v
.:,
��22Adam/movie_emb1/embeddings/v
#:!2Adam/y_out/kernel/v
:2Adam/y_out/bias/v
$:"d2Adam/dense0/kernel/v
:2Adam/dense0/bias/v
$:"2Adam/rating/kernel/v
:2Adam/rating/bias/v�
?__inference_NCF_layer_call_and_return_conditional_losses_293299�
5.' `ahivwc�`
Y�V
L�I
"�
user_inp���������
#� 
	movie_inp���������
p 

 
� "%�"
�
0���������
� �
?__inference_NCF_layer_call_and_return_conditional_losses_293338�
5.' `ahivwc�`
Y�V
L�I
"�
user_inp���������
#� 
	movie_inp���������
p

 
� "%�"
�
0���������
� �
?__inference_NCF_layer_call_and_return_conditional_losses_293529�
5.' `ahivwb�_
X�U
K�H
"�
inputs/0���������
"�
inputs/1���������
p 

 
� "%�"
�
0���������
� �
?__inference_NCF_layer_call_and_return_conditional_losses_293634�
5.' `ahivwb�_
X�U
K�H
"�
inputs/0���������
"�
inputs/1���������
p

 
� "%�"
�
0���������
� �
$__inference_NCF_layer_call_fn_293036�
5.' `ahivwc�`
Y�V
L�I
"�
user_inp���������
#� 
	movie_inp���������
p 

 
� "�����������
$__inference_NCF_layer_call_fn_293260�
5.' `ahivwc�`
Y�V
L�I
"�
user_inp���������
#� 
	movie_inp���������
p

 
� "�����������
$__inference_NCF_layer_call_fn_293398�
5.' `ahivwb�_
X�U
K�H
"�
inputs/0���������
"�
inputs/1���������
p 

 
� "�����������
$__inference_NCF_layer_call_fn_293424�
5.' `ahivwb�_
X�U
K�H
"�
inputs/0���������
"�
inputs/1���������
p

 
� "�����������
!__inference__wrapped_model_292796�
5.' `ahivw[�X
Q�N
L�I
"�
user_inp���������
#� 
	movie_inp���������
� "/�,
*
rating �
rating����������
C__inference_concat2_layer_call_and_return_conditional_losses_293867�Z�W
P�M
K�H
"�
inputs/0���������
"�
inputs/1���������
� "%�"
�
0���������
� �
(__inference_concat2_layer_call_fn_293860vZ�W
P�M
K�H
"�
inputs/0���������
"�
inputs/1���������
� "�����������
B__inference_concat_layer_call_and_return_conditional_losses_293815�Z�W
P�M
K�H
"�
inputs/0���������2
"�
inputs/1���������2
� "%�"
�
0���������d
� �
'__inference_concat_layer_call_fn_293808vZ�W
P�M
K�H
"�
inputs/0���������2
"�
inputs/1���������2
� "����������d�
B__inference_dense0_layer_call_and_return_conditional_losses_293854\hi/�,
%�"
 �
inputs���������d
� "%�"
�
0���������
� z
'__inference_dense0_layer_call_fn_293843Ohi/�,
%�"
 �
inputs���������d
� "�����������
?__inference_dot_layer_call_and_return_conditional_losses_293802�Z�W
P�M
K�H
"�
inputs/0���������2
"�
inputs/1���������2
� "%�"
�
0���������
� �
$__inference_dot_layer_call_fn_293776vZ�W
P�M
K�H
"�
inputs/0���������2
"�
inputs/1���������2
� "�����������
F__inference_movie_emb1_layer_call_and_return_conditional_losses_293702_5/�,
%�"
 �
inputs���������
� ")�&
�
0���������2
� �
+__inference_movie_emb1_layer_call_fn_293692R5/�,
%�"
 �
inputs���������
� "����������2�
E__inference_movie_emb_layer_call_and_return_conditional_losses_293668_'/�,
%�"
 �
inputs���������
� ")�&
�
0���������2
� �
*__inference_movie_emb_layer_call_fn_293658R'/�,
%�"
 �
inputs���������
� "����������2�
B__inference_rating_layer_call_and_return_conditional_losses_293886\vw/�,
%�"
 �
inputs���������
� "%�"
�
0���������
� z
'__inference_rating_layer_call_fn_293876Ovw/�,
%�"
 �
inputs���������
� "�����������
J__inference_reshape_movie1_layer_call_and_return_conditional_losses_293770\3�0
)�&
$�!
inputs���������2
� "%�"
�
0���������2
� �
/__inference_reshape_movie1_layer_call_fn_293758O3�0
)�&
$�!
inputs���������2
� "����������2�
I__inference_reshape_movie_layer_call_and_return_conditional_losses_293736\3�0
)�&
$�!
inputs���������2
� "%�"
�
0���������2
� �
.__inference_reshape_movie_layer_call_fn_293724O3�0
)�&
$�!
inputs���������2
� "����������2�
H__inference_reshape_usr1_layer_call_and_return_conditional_losses_293753\3�0
)�&
$�!
inputs���������2
� "%�"
�
0���������2
� �
-__inference_reshape_usr1_layer_call_fn_293741O3�0
)�&
$�!
inputs���������2
� "����������2�
G__inference_reshape_usr_layer_call_and_return_conditional_losses_293719\3�0
)�&
$�!
inputs���������2
� "%�"
�
0���������2
� 
,__inference_reshape_usr_layer_call_fn_293707O3�0
)�&
$�!
inputs���������2
� "����������2�
$__inference_signature_wrapper_293372�
5.' `ahivwo�l
� 
e�b
0
	movie_inp#� 
	movie_inp���������
.
user_inp"�
user_inp���������"/�,
*
rating �
rating����������
E__inference_user_emb1_layer_call_and_return_conditional_losses_293685_./�,
%�"
 �
inputs���������
� ")�&
�
0���������2
� �
*__inference_user_emb1_layer_call_fn_293675R./�,
%�"
 �
inputs���������
� "����������2�
D__inference_user_emb_layer_call_and_return_conditional_losses_293651_ /�,
%�"
 �
inputs���������
� ")�&
�
0���������2
� 
)__inference_user_emb_layer_call_fn_293641R /�,
%�"
 �
inputs���������
� "����������2�
A__inference_y_out_layer_call_and_return_conditional_losses_293834\`a/�,
%�"
 �
inputs���������
� "%�"
�
0���������
� y
&__inference_y_out_layer_call_fn_293824O`a/�,
%�"
 �
inputs���������
� "����������