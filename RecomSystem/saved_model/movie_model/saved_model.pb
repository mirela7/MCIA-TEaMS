ťÔ
é
B
AssignVariableOp
resource
value"dtype"
dtypetype
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
8
Const
output"dtype"
valuetensor"
dtypetype
.
Identity

input"T
output"T"	
Ttype
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
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
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
Ľ
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
ž
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
ö
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

VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 "serve*2.6.02unknown8É

movie_emb/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape:
Ő2*%
shared_namemovie_emb/embeddings

(movie_emb/embeddings/Read/ReadVariableOpReadVariableOpmovie_emb/embeddings* 
_output_shapes
:
Ő2*
dtype0

NoOpNoOp
	
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*Í
valueĂBŔ Bš
Ł
layer-0
layer_with_weights-0
layer-1
layer-2
regularization_losses
	variables
trainable_variables
	keras_api

signatures
 
b
	
embeddings

regularization_losses
	variables
trainable_variables
	keras_api
R
regularization_losses
	variables
trainable_variables
	keras_api
 

	0

	0
­
layer_regularization_losses
layer_metrics
regularization_losses

layers
	variables
metrics
trainable_variables
non_trainable_variables
 
db
VARIABLE_VALUEmovie_emb/embeddings:layer_with_weights-0/embeddings/.ATTRIBUTES/VARIABLE_VALUE
 

	0

	0
­
layer_regularization_losses
layer_metrics

regularization_losses

layers
	variables
metrics
trainable_variables
non_trainable_variables
 
 
 
­
layer_regularization_losses
layer_metrics
regularization_losses

layers
	variables
metrics
trainable_variables
 non_trainable_variables
 
 

0
1
2
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
|
serving_default_movie_inpPlaceholder*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
dtype0*
shape:˙˙˙˙˙˙˙˙˙
Ë
StatefulPartitionedCallStatefulPartitionedCallserving_default_movie_inpmovie_emb/embeddings*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *,
f'R%
#__inference_signature_wrapper_43490
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
Ĺ
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename(movie_emb/embeddings/Read/ReadVariableOpConst*
Tin
2*
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
__inference__traced_save_43600
Ź
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamemovie_emb/embeddings*
Tin
2*
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
!__inference__traced_restore_43613ýö
Ľ
´
B__inference_model_1_layer_call_and_return_conditional_losses_43526

inputs4
 movie_emb_embedding_lookup_43512:
Ő2
identity˘movie_emb/embedding_lookupq
movie_emb/CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙2
movie_emb/Cast­
movie_emb/embedding_lookupResourceGather movie_emb_embedding_lookup_43512movie_emb/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*3
_class)
'%loc:@movie_emb/embedding_lookup/43512*+
_output_shapes
:˙˙˙˙˙˙˙˙˙2*
dtype02
movie_emb/embedding_lookup
#movie_emb/embedding_lookup/IdentityIdentity#movie_emb/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*3
_class)
'%loc:@movie_emb/embedding_lookup/43512*+
_output_shapes
:˙˙˙˙˙˙˙˙˙22%
#movie_emb/embedding_lookup/Identityž
%movie_emb/embedding_lookup/Identity_1Identity,movie_emb/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:˙˙˙˙˙˙˙˙˙22'
%movie_emb/embedding_lookup/Identity_1
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
#reshape_movie/strided_slice/stack_2ś
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
reshape_movie/Reshape/shape/1ž
reshape_movie/Reshape/shapePack$reshape_movie/strided_slice:output:0&reshape_movie/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
reshape_movie/Reshape/shapeÁ
reshape_movie/ReshapeReshape.movie_emb/embedding_lookup/Identity_1:output:0$reshape_movie/Reshape/shape:output:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙22
reshape_movie/Reshapey
IdentityIdentityreshape_movie/Reshape:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙22

Identityk
NoOpNoOp^movie_emb/embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:˙˙˙˙˙˙˙˙˙: 28
movie_emb/embedding_lookupmovie_emb/embedding_lookup:O K
'
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
Í
­
B__inference_model_1_layer_call_and_return_conditional_losses_43473
	movie_inp#
movie_emb_43468:
Ő2
identity˘!movie_emb/StatefulPartitionedCall
!movie_emb/StatefulPartitionedCallStatefulPartitionedCall	movie_inpmovie_emb_43468*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:˙˙˙˙˙˙˙˙˙2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_movie_emb_layer_call_and_return_conditional_losses_433982#
!movie_emb/StatefulPartitionedCall
reshape_movie/PartitionedCallPartitionedCall*movie_emb/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_reshape_movie_layer_call_and_return_conditional_losses_434142
reshape_movie/PartitionedCall
IdentityIdentity&reshape_movie/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙22

Identityr
NoOpNoOp"^movie_emb/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:˙˙˙˙˙˙˙˙˙: 2F
!movie_emb/StatefulPartitionedCall!movie_emb/StatefulPartitionedCall:R N
'
_output_shapes
:˙˙˙˙˙˙˙˙˙
#
_user_specified_name	movie_inp
Í
­
B__inference_model_1_layer_call_and_return_conditional_losses_43481
	movie_inp#
movie_emb_43476:
Ő2
identity˘!movie_emb/StatefulPartitionedCall
!movie_emb/StatefulPartitionedCallStatefulPartitionedCall	movie_inpmovie_emb_43476*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:˙˙˙˙˙˙˙˙˙2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_movie_emb_layer_call_and_return_conditional_losses_433982#
!movie_emb/StatefulPartitionedCall
reshape_movie/PartitionedCallPartitionedCall*movie_emb/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_reshape_movie_layer_call_and_return_conditional_losses_434142
reshape_movie/PartitionedCall
IdentityIdentity&reshape_movie/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙22

Identityr
NoOpNoOp"^movie_emb/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:˙˙˙˙˙˙˙˙˙: 2F
!movie_emb/StatefulPartitionedCall!movie_emb/StatefulPartitionedCall:R N
'
_output_shapes
:˙˙˙˙˙˙˙˙˙
#
_user_specified_name	movie_inp
Ň

)__inference_movie_emb_layer_call_fn_43557

inputs
unknown:
Ő2
identity˘StatefulPartitionedCallë
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:˙˙˙˙˙˙˙˙˙2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_movie_emb_layer_call_and_return_conditional_losses_433982
StatefulPartitionedCall
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:˙˙˙˙˙˙˙˙˙22

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:˙˙˙˙˙˙˙˙˙: 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
ç

˘
D__inference_movie_emb_layer_call_and_return_conditional_losses_43550

inputs*
embedding_lookup_43544:
Ő2
identity˘embedding_lookup]
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙2
Castű
embedding_lookupResourceGatherembedding_lookup_43544Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*)
_class
loc:@embedding_lookup/43544*+
_output_shapes
:˙˙˙˙˙˙˙˙˙2*
dtype02
embedding_lookupě
embedding_lookup/IdentityIdentityembedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*)
_class
loc:@embedding_lookup/43544*+
_output_shapes
:˙˙˙˙˙˙˙˙˙22
embedding_lookup/Identity 
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:˙˙˙˙˙˙˙˙˙22
embedding_lookup/Identity_1
IdentityIdentity$embedding_lookup/Identity_1:output:0^NoOp*
T0*+
_output_shapes
:˙˙˙˙˙˙˙˙˙22

Identitya
NoOpNoOp^embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:˙˙˙˙˙˙˙˙˙: 2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
Ć
}
'__inference_model_1_layer_call_fn_43533

inputs
unknown:
Ő2
identity˘StatefulPartitionedCallĺ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_model_1_layer_call_and_return_conditional_losses_434172
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙22

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:˙˙˙˙˙˙˙˙˙: 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
Ä
Ş
B__inference_model_1_layer_call_and_return_conditional_losses_43453

inputs#
movie_emb_43448:
Ő2
identity˘!movie_emb/StatefulPartitionedCall
!movie_emb/StatefulPartitionedCallStatefulPartitionedCallinputsmovie_emb_43448*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:˙˙˙˙˙˙˙˙˙2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_movie_emb_layer_call_and_return_conditional_losses_433982#
!movie_emb/StatefulPartitionedCall
reshape_movie/PartitionedCallPartitionedCall*movie_emb/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_reshape_movie_layer_call_and_return_conditional_losses_434142
reshape_movie/PartitionedCall
IdentityIdentity&reshape_movie/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙22

Identityr
NoOpNoOp"^movie_emb/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:˙˙˙˙˙˙˙˙˙: 2F
!movie_emb/StatefulPartitionedCall!movie_emb/StatefulPartitionedCall:O K
'
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
ç

˘
D__inference_movie_emb_layer_call_and_return_conditional_losses_43398

inputs*
embedding_lookup_43392:
Ő2
identity˘embedding_lookup]
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙2
Castű
embedding_lookupResourceGatherembedding_lookup_43392Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*)
_class
loc:@embedding_lookup/43392*+
_output_shapes
:˙˙˙˙˙˙˙˙˙2*
dtype02
embedding_lookupě
embedding_lookup/IdentityIdentityembedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*)
_class
loc:@embedding_lookup/43392*+
_output_shapes
:˙˙˙˙˙˙˙˙˙22
embedding_lookup/Identity 
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:˙˙˙˙˙˙˙˙˙22
embedding_lookup/Identity_1
IdentityIdentity$embedding_lookup/Identity_1:output:0^NoOp*
T0*+
_output_shapes
:˙˙˙˙˙˙˙˙˙22

Identitya
NoOpNoOp^embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:˙˙˙˙˙˙˙˙˙: 2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
Ć
}
'__inference_model_1_layer_call_fn_43540

inputs
unknown:
Ő2
identity˘StatefulPartitionedCallĺ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_model_1_layer_call_and_return_conditional_losses_434532
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙22

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:˙˙˙˙˙˙˙˙˙: 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
Ě
I
-__inference_reshape_movie_layer_call_fn_43574

inputs
identityĆ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_reshape_movie_layer_call_and_return_conditional_losses_434142
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙22

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:˙˙˙˙˙˙˙˙˙2:S O
+
_output_shapes
:˙˙˙˙˙˙˙˙˙2
 
_user_specified_nameinputs
Đ

'__inference_model_1_layer_call_fn_43422
	movie_inp
unknown:
Ő2
identity˘StatefulPartitionedCallč
StatefulPartitionedCallStatefulPartitionedCall	movie_inpunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_model_1_layer_call_and_return_conditional_losses_434172
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙22

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:˙˙˙˙˙˙˙˙˙: 22
StatefulPartitionedCallStatefulPartitionedCall:R N
'
_output_shapes
:˙˙˙˙˙˙˙˙˙
#
_user_specified_name	movie_inp

d
H__inference_reshape_movie_layer_call_and_return_conditional_losses_43414

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
strided_slice/stack_2â
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
:˙˙˙˙˙˙˙˙˙22	
Reshaped
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙22

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:˙˙˙˙˙˙˙˙˙2:S O
+
_output_shapes
:˙˙˙˙˙˙˙˙˙2
 
_user_specified_nameinputs

 
__inference__traced_save_43600
file_prefix3
/savev2_movie_emb_embeddings_read_readvariableop
savev2_const

identity_1˘MergeV2Checkpoints
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
ShardedFilename/shardŚ
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilenameÚ
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*m
valuedBbB:layer_with_weights-0/embeddings/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2/tensor_names
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueBB B 2
SaveV2/shape_and_slicesě
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0/savev2_movie_emb_embeddings_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *
dtypes
22
SaveV2ş
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:2(
&MergeV2Checkpoints/checkpoint_prefixesĄ
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

identity_1Identity_1:output:0*#
_input_shapes
: :
Ő2: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:&"
 
_output_shapes
:
Ő2:

_output_shapes
: 
Ä
Ş
B__inference_model_1_layer_call_and_return_conditional_losses_43417

inputs#
movie_emb_43399:
Ő2
identity˘!movie_emb/StatefulPartitionedCall
!movie_emb/StatefulPartitionedCallStatefulPartitionedCallinputsmovie_emb_43399*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:˙˙˙˙˙˙˙˙˙2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_movie_emb_layer_call_and_return_conditional_losses_433982#
!movie_emb/StatefulPartitionedCall
reshape_movie/PartitionedCallPartitionedCall*movie_emb/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Q
fLRJ
H__inference_reshape_movie_layer_call_and_return_conditional_losses_434142
reshape_movie/PartitionedCall
IdentityIdentity&reshape_movie/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙22

Identityr
NoOpNoOp"^movie_emb/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:˙˙˙˙˙˙˙˙˙: 2F
!movie_emb/StatefulPartitionedCall!movie_emb/StatefulPartitionedCall:O K
'
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs

d
H__inference_reshape_movie_layer_call_and_return_conditional_losses_43569

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
strided_slice/stack_2â
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
:˙˙˙˙˙˙˙˙˙22	
Reshaped
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙22

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:˙˙˙˙˙˙˙˙˙2:S O
+
_output_shapes
:˙˙˙˙˙˙˙˙˙2
 
_user_specified_nameinputs


!__inference__traced_restore_43613
file_prefix9
%assignvariableop_movie_emb_embeddings:
Ő2

identity_2˘AssignVariableOpŕ
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*m
valuedBbB:layer_with_weights-0/embeddings/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2/tensor_names
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueBB B 2
RestoreV2/shape_and_slicesľ
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*
_output_shapes

::*
dtypes
22
	RestoreV2g
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:2

Identity¤
AssignVariableOpAssignVariableOp%assignvariableop_movie_emb_embeddingsIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp9
NoOpNoOp"/device:CPU:0*
_output_shapes
 2
NoOp{

Identity_1Identityfile_prefix^AssignVariableOp^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2

Identity_1c

Identity_2IdentityIdentity_1:output:0^NoOp_1*
T0*
_output_shapes
: 2

Identity_2e
NoOp_1NoOp^AssignVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp_1"!

identity_2Identity_2:output:0*
_input_shapes
: : 2$
AssignVariableOpAssignVariableOp:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
Đ

'__inference_model_1_layer_call_fn_43465
	movie_inp
unknown:
Ő2
identity˘StatefulPartitionedCallč
StatefulPartitionedCallStatefulPartitionedCall	movie_inpunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_model_1_layer_call_and_return_conditional_losses_434532
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙22

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:˙˙˙˙˙˙˙˙˙: 22
StatefulPartitionedCallStatefulPartitionedCall:R N
'
_output_shapes
:˙˙˙˙˙˙˙˙˙
#
_user_specified_name	movie_inp
Ľ
´
B__inference_model_1_layer_call_and_return_conditional_losses_43508

inputs4
 movie_emb_embedding_lookup_43494:
Ő2
identity˘movie_emb/embedding_lookupq
movie_emb/CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙2
movie_emb/Cast­
movie_emb/embedding_lookupResourceGather movie_emb_embedding_lookup_43494movie_emb/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*3
_class)
'%loc:@movie_emb/embedding_lookup/43494*+
_output_shapes
:˙˙˙˙˙˙˙˙˙2*
dtype02
movie_emb/embedding_lookup
#movie_emb/embedding_lookup/IdentityIdentity#movie_emb/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*3
_class)
'%loc:@movie_emb/embedding_lookup/43494*+
_output_shapes
:˙˙˙˙˙˙˙˙˙22%
#movie_emb/embedding_lookup/Identityž
%movie_emb/embedding_lookup/Identity_1Identity,movie_emb/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:˙˙˙˙˙˙˙˙˙22'
%movie_emb/embedding_lookup/Identity_1
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
#reshape_movie/strided_slice/stack_2ś
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
reshape_movie/Reshape/shape/1ž
reshape_movie/Reshape/shapePack$reshape_movie/strided_slice:output:0&reshape_movie/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
reshape_movie/Reshape/shapeÁ
reshape_movie/ReshapeReshape.movie_emb/embedding_lookup/Identity_1:output:0$reshape_movie/Reshape/shape:output:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙22
reshape_movie/Reshapey
IdentityIdentityreshape_movie/Reshape:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙22

Identityk
NoOpNoOp^movie_emb/embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:˙˙˙˙˙˙˙˙˙: 28
movie_emb/embedding_lookupmovie_emb/embedding_lookup:O K
'
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
ö
Ľ
 __inference__wrapped_model_43381
	movie_inp<
(model_1_movie_emb_embedding_lookup_43367:
Ő2
identity˘"model_1/movie_emb/embedding_lookup
model_1/movie_emb/CastCast	movie_inp*

DstT0*

SrcT0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙2
model_1/movie_emb/CastŐ
"model_1/movie_emb/embedding_lookupResourceGather(model_1_movie_emb_embedding_lookup_43367model_1/movie_emb/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*;
_class1
/-loc:@model_1/movie_emb/embedding_lookup/43367*+
_output_shapes
:˙˙˙˙˙˙˙˙˙2*
dtype02$
"model_1/movie_emb/embedding_lookup´
+model_1/movie_emb/embedding_lookup/IdentityIdentity+model_1/movie_emb/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*;
_class1
/-loc:@model_1/movie_emb/embedding_lookup/43367*+
_output_shapes
:˙˙˙˙˙˙˙˙˙22-
+model_1/movie_emb/embedding_lookup/IdentityÖ
-model_1/movie_emb/embedding_lookup/Identity_1Identity4model_1/movie_emb/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:˙˙˙˙˙˙˙˙˙22/
-model_1/movie_emb/embedding_lookup/Identity_1 
model_1/reshape_movie/ShapeShape6model_1/movie_emb/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:2
model_1/reshape_movie/Shape 
)model_1/reshape_movie/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2+
)model_1/reshape_movie/strided_slice/stack¤
+model_1/reshape_movie/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2-
+model_1/reshape_movie/strided_slice/stack_1¤
+model_1/reshape_movie/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2-
+model_1/reshape_movie/strided_slice/stack_2ć
#model_1/reshape_movie/strided_sliceStridedSlice$model_1/reshape_movie/Shape:output:02model_1/reshape_movie/strided_slice/stack:output:04model_1/reshape_movie/strided_slice/stack_1:output:04model_1/reshape_movie/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2%
#model_1/reshape_movie/strided_slice
%model_1/reshape_movie/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22'
%model_1/reshape_movie/Reshape/shape/1Ţ
#model_1/reshape_movie/Reshape/shapePack,model_1/reshape_movie/strided_slice:output:0.model_1/reshape_movie/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2%
#model_1/reshape_movie/Reshape/shapeá
model_1/reshape_movie/ReshapeReshape6model_1/movie_emb/embedding_lookup/Identity_1:output:0,model_1/reshape_movie/Reshape/shape:output:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙22
model_1/reshape_movie/Reshape
IdentityIdentity&model_1/reshape_movie/Reshape:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙22

Identitys
NoOpNoOp#^model_1/movie_emb/embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:˙˙˙˙˙˙˙˙˙: 2H
"model_1/movie_emb/embedding_lookup"model_1/movie_emb/embedding_lookup:R N
'
_output_shapes
:˙˙˙˙˙˙˙˙˙
#
_user_specified_name	movie_inp
Š
|
#__inference_signature_wrapper_43490
	movie_inp
unknown:
Ő2
identity˘StatefulPartitionedCallĆ
StatefulPartitionedCallStatefulPartitionedCall	movie_inpunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *)
f$R"
 __inference__wrapped_model_433812
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙22

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:˙˙˙˙˙˙˙˙˙: 22
StatefulPartitionedCallStatefulPartitionedCall:R N
'
_output_shapes
:˙˙˙˙˙˙˙˙˙
#
_user_specified_name	movie_inp"¨L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*´
serving_default 
?
	movie_inp2
serving_default_movie_inp:0˙˙˙˙˙˙˙˙˙A
reshape_movie0
StatefulPartitionedCall:0˙˙˙˙˙˙˙˙˙2tensorflow/serving/predict:ý5

layer-0
layer_with_weights-0
layer-1
layer-2
regularization_losses
	variables
trainable_variables
	keras_api

signatures
!_default_save_signature
*"&call_and_return_all_conditional_losses
#__call__"
_tf_keras_network
"
_tf_keras_input_layer
ľ
	
embeddings

regularization_losses
	variables
trainable_variables
	keras_api
*$&call_and_return_all_conditional_losses
%__call__"
_tf_keras_layer
Ľ
regularization_losses
	variables
trainable_variables
	keras_api
*&&call_and_return_all_conditional_losses
'__call__"
_tf_keras_layer
 "
trackable_list_wrapper
'
	0"
trackable_list_wrapper
'
	0"
trackable_list_wrapper
Ę
layer_regularization_losses
layer_metrics
regularization_losses

layers
	variables
metrics
trainable_variables
non_trainable_variables
#__call__
!_default_save_signature
*"&call_and_return_all_conditional_losses
&""call_and_return_conditional_losses"
_generic_user_object
,
(serving_default"
signature_map
(:&
Ő22movie_emb/embeddings
 "
trackable_list_wrapper
'
	0"
trackable_list_wrapper
'
	0"
trackable_list_wrapper
­
layer_regularization_losses
layer_metrics

regularization_losses

layers
	variables
metrics
trainable_variables
non_trainable_variables
%__call__
*$&call_and_return_all_conditional_losses
&$"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
­
layer_regularization_losses
layer_metrics
regularization_losses

layers
	variables
metrics
trainable_variables
 non_trainable_variables
'__call__
*&&call_and_return_all_conditional_losses
&&"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
5
0
1
2"
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
ŕ2Ý
 __inference__wrapped_model_43381¸
˛
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
annotationsŞ *(˘%
# 
	movie_inp˙˙˙˙˙˙˙˙˙
Ö2Ó
B__inference_model_1_layer_call_and_return_conditional_losses_43508
B__inference_model_1_layer_call_and_return_conditional_losses_43526
B__inference_model_1_layer_call_and_return_conditional_losses_43473
B__inference_model_1_layer_call_and_return_conditional_losses_43481Ŕ
ˇ˛ł
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
kwonlydefaultsŞ 
annotationsŞ *
 
ę2ç
'__inference_model_1_layer_call_fn_43422
'__inference_model_1_layer_call_fn_43533
'__inference_model_1_layer_call_fn_43540
'__inference_model_1_layer_call_fn_43465Ŕ
ˇ˛ł
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
kwonlydefaultsŞ 
annotationsŞ *
 
î2ë
D__inference_movie_emb_layer_call_and_return_conditional_losses_43550˘
˛
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
annotationsŞ *
 
Ó2Đ
)__inference_movie_emb_layer_call_fn_43557˘
˛
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
annotationsŞ *
 
ň2ď
H__inference_reshape_movie_layer_call_and_return_conditional_losses_43569˘
˛
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
annotationsŞ *
 
×2Ô
-__inference_reshape_movie_layer_call_fn_43574˘
˛
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
annotationsŞ *
 
ĚBÉ
#__inference_signature_wrapper_43490	movie_inp"
˛
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
annotationsŞ *
 
 __inference__wrapped_model_43381v	2˘/
(˘%
# 
	movie_inp˙˙˙˙˙˙˙˙˙
Ş "=Ş:
8
reshape_movie'$
reshape_movie˙˙˙˙˙˙˙˙˙2Ź
B__inference_model_1_layer_call_and_return_conditional_losses_43473f	:˘7
0˘-
# 
	movie_inp˙˙˙˙˙˙˙˙˙
p 

 
Ş "%˘"

0˙˙˙˙˙˙˙˙˙2
 Ź
B__inference_model_1_layer_call_and_return_conditional_losses_43481f	:˘7
0˘-
# 
	movie_inp˙˙˙˙˙˙˙˙˙
p

 
Ş "%˘"

0˙˙˙˙˙˙˙˙˙2
 Š
B__inference_model_1_layer_call_and_return_conditional_losses_43508c	7˘4
-˘*
 
inputs˙˙˙˙˙˙˙˙˙
p 

 
Ş "%˘"

0˙˙˙˙˙˙˙˙˙2
 Š
B__inference_model_1_layer_call_and_return_conditional_losses_43526c	7˘4
-˘*
 
inputs˙˙˙˙˙˙˙˙˙
p

 
Ş "%˘"

0˙˙˙˙˙˙˙˙˙2
 
'__inference_model_1_layer_call_fn_43422Y	:˘7
0˘-
# 
	movie_inp˙˙˙˙˙˙˙˙˙
p 

 
Ş "˙˙˙˙˙˙˙˙˙2
'__inference_model_1_layer_call_fn_43465Y	:˘7
0˘-
# 
	movie_inp˙˙˙˙˙˙˙˙˙
p

 
Ş "˙˙˙˙˙˙˙˙˙2
'__inference_model_1_layer_call_fn_43533V	7˘4
-˘*
 
inputs˙˙˙˙˙˙˙˙˙
p 

 
Ş "˙˙˙˙˙˙˙˙˙2
'__inference_model_1_layer_call_fn_43540V	7˘4
-˘*
 
inputs˙˙˙˙˙˙˙˙˙
p

 
Ş "˙˙˙˙˙˙˙˙˙2§
D__inference_movie_emb_layer_call_and_return_conditional_losses_43550_	/˘,
%˘"
 
inputs˙˙˙˙˙˙˙˙˙
Ş ")˘&

0˙˙˙˙˙˙˙˙˙2
 
)__inference_movie_emb_layer_call_fn_43557R	/˘,
%˘"
 
inputs˙˙˙˙˙˙˙˙˙
Ş "˙˙˙˙˙˙˙˙˙2¨
H__inference_reshape_movie_layer_call_and_return_conditional_losses_43569\3˘0
)˘&
$!
inputs˙˙˙˙˙˙˙˙˙2
Ş "%˘"

0˙˙˙˙˙˙˙˙˙2
 
-__inference_reshape_movie_layer_call_fn_43574O3˘0
)˘&
$!
inputs˙˙˙˙˙˙˙˙˙2
Ş "˙˙˙˙˙˙˙˙˙2Ť
#__inference_signature_wrapper_43490	?˘<
˘ 
5Ş2
0
	movie_inp# 
	movie_inp˙˙˙˙˙˙˙˙˙"=Ş:
8
reshape_movie'$
reshape_movie˙˙˙˙˙˙˙˙˙2