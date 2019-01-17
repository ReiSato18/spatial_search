#MS(3,1)
########################
stage1 = zeros(Int8,3,3,3)
stage1[:,:,1]=[1 1 1;1 0 1;1 1 1]
stage1[:,:,2]=[1 0 1;0 0 0;1 0 1]
stage1[:,:,3]=[1 1 1;1 0 1;1 1 1]
#println(stage1)
#stage2
empty2 = zeros(Int8,3,3,3)
block2_1_1 = hcat(stage1,stage1,stage1)
block2_1_2 = hcat(stage1,empty2,stage1)
block2_1 = vcat(block2_1_1,block2_1_2,block2_1_1)
block2_2_1 = hcat(stage1,empty2,stage1)
block2_2_2 = hcat(empty2,empty2,empty2)
block2_2 = vcat(block2_2_1,block2_2_2,block2_2_1)
stage2 = zeros(Int8,9,9,9)
stage2[:,:,1:3]= copy(block2_1)
stage2[:,:,4:6]= copy(block2_2)
stage2[:,:,7:9]= copy(block2_1)
#stage3
empty3 = zeros(Int8,9,9,9)
block3_1_1 = hcat(stage2,stage2,stage2)
block3_1_2 = hcat(stage2,empty3,stage2)
block3_1 = vcat(block3_1_1,block3_1_2,block3_1_1)
block3_2_1 = hcat(stage2,empty3,stage2)
block3_2_2 = hcat(empty3,empty3,empty3)
block3_2 = vcat(block3_2_1,block3_2_2,block3_2_1)
stage3 = zeros(Int8,27,27,27)
stage3[:,:,1:9] = copy(block3_1)
stage3[:,:,10:18]=copy(block3_2)
stage3[:,:,19:27]=copy(block3_1)
###
empty4 = zeros(Int8,27,27,27)
block4_1_1 = hcat(stage3,stage3,stage3)
block4_1_2 = hcat(stage3,empty4,stage3)
block4_1 = vcat(block4_1_1,block4_1_2,block4_1_1)
block4_2_1 = hcat(stage3,empty4,stage3)
block4_2_2 = hcat(empty4,empty4,empty4)
block4_2 = vcat(block4_2_1,block4_2_2,block4_2_1)
stage4 = zeros(Int8,81,81,81)
stage4[:,:,1:27]=block4_1
stage4[:,:,28:54]=block4_2
stage4[:,:,55:81]=block4_1
#stage5
empty5 = zeros(Int8,81,81,81)
block5_1_1 = hcat(stage4,stage4,stage4)
block5_1_2 = hcat(stage4,empty5,stage4)
block5_1 = vcat(block5_1_1,block5_1_2,block5_1_1)
block5_2_1 = hcat(stage4,empty5,stage4)
block5_2_2 = hcat(empty5,empty5,empty5)
block5_2 = vcat(block5_2_1,block5_2_2,block5_2_1)
stage5 = zeros(Int8,243,243,243)
stage5[:,:,1:81]=block5_1
stage5[:,:,82:162]=block5_2
stage5[:,:,163:243]=block5_1
#Stage = zeros(Int8,27,27,27)
stage = copy(stage4)
################################################################
################################################################
#MS(4,2)
stage1 = zeros(Int8,4,4,4)
stage1[:,:,1]=[1 1 1 1;1 0 0 1;1 0 0 1;1 1 1 1]
stage1[:,:,2]=[1 0 0 1;0 0 0 0;0 0 0 0;1 0 0 1]
stage1[:,:,3]=[1 0 0 1;0 0 0 0;0 0 0 0;1 0 0 1]
stage1[:,:,4]=[1 1 1 1;1 0 0 1;1 0 0 1;1 1 1 1]
#println(stage1)
##########stage2
empty2 = zeros(Int8,4,4,4)
block2_1_1 = hcat(stage1,stage1,stage1,stage1)
block2_1_2 = hcat(stage1,empty2,empty2,stage1)
block2_1_3 = hcat(empty2,empty2,empty2,empty2)
##
block2_1 = vcat(block2_1_1,block2_1_2,block2_1_2,block2_1_1)
block2_2 = vcat(block2_1_2,block2_1_3,block2_1_3,block2_1_2)
##
stage2 = zeros(Int8,16,16,16)
stage2[:,:,1:4]= copy(block2_1)
stage2[:,:,5:8]= copy(block2_2)
stage2[:,:,9:12]= copy(block2_2)
stage2[:,:,13:16]= copy(block2_1)
##########stage3
empty3 = zeros(Int8,16,16,16)
block3_1_1 = hcat(stage2,stage2,stage2,stage2)
block3_1_2 = hcat(stage2,empty3,empty3,stage2)
block3_1_3 = hcat(empty3,empty3,empty3,empty3)
##
block3_1 = vcat(block3_1_1,block3_1_2,block3_1_2,block3_1_1)
block3_2 = vcat(block3_1_2,block3_1_3,block3_1_3,block3_1_2)
##
stage3 = zeros(Int8,64,64,64)
stage3[:,:,1:16]= copy(block3_1)
stage3[:,:,17:32]= copy(block3_2)
stage3[:,:,33:48]= copy(block3_2)
stage3[:,:,49:64]= copy(block3_1)
#############stage4
empty4 = zeros(Int8,64,64,64)
block4_1_1 = hcat(stage3,stage3,stage3,stage3)
block4_1_2 = hcat(stage3,empty4,empty4,stage3)
block4_1_3 = hcat(empty4,empty4,empty4,empty4)
##
block4_1 = vcat(block4_1_1,block4_1_2,block4_1_2,block4_1_1)
block4_2 = vcat(block4_1_2,block4_1_3,block4_1_3,block4_1_2)
##
stage4 = zeros(Int8,256,256,256)
stage4[:,:,1:64]= copy(block4_1)
stage4[:,:,65:128]= copy(block4_2)
stage4[:,:,129:192]= copy(block4_2)
stage4[:,:,193:256]= copy(block4_1)
#############stage5
empty5 = zeros(Int8,256,256,256)
block5_1_1 = hcat(stage4,stage4,stage4,stage4)
block5_1_2 = hcat(stage4,empty5,empty5,stage4)
block5_1_3 = hcat(empty5,empty5,empty5,empty5)
##
block5_1 = vcat(block5_1_1,block5_1_2,block5_1_2,block5_1_1)
block5_2 = vcat(block5_1_2,block5_1_3,block5_1_3,block5_1_2)
##
stage5 = zeros(Int8,1024,1024,1024)
stage5[:,:,1:256]= copy(block5_1)
stage5[:,:,257:512]= copy(block5_2)
stage5[:,:,513:768]= copy(block5_2)
stage5[:,:,769:1024]= copy(block5_1)
#############################################
################################################################
################################################################
#MS(5,3)
#menger(5,3)
stage1 = zeros(Int8,5,5,5)
stage1[:,:,1]=[1 1 1 1 1;1 0 0 0 1;1 0 0 0 1;1 0 0 0 1;1 1 1 1 1]
stage1[:,:,2]=[1 0 0 0 1;0 0 0 0 0;0 0 0 0 0;0 0 0 0 0;1 0 0 0 1]
stage1[:,:,3]=[1 0 0 0 1;0 0 0 0 0;0 0 0 0 0;0 0 0 0 0;1 0 0 0 1]
stage1[:,:,4]=[1 0 0 0 1;0 0 0 0 0;0 0 0 0 0;0 0 0 0 0;1 0 0 0 1]
stage1[:,:,5]=[1 1 1 1 1;1 0 0 0 1;1 0 0 0 1;1 0 0 0 1;1 1 1 1 1]
##########stage2
empty2 = zeros(Int8,5,5,5)
block2_1_1 = hcat(stage1,stage1,stage1,stage1,stage1)
block2_1_2 = hcat(stage1,empty2,empty2,empty2,stage1)
block2_1_3 = hcat(empty2,empty2,empty2,empty2,empty2)
##
block2_1 = vcat(block2_1_1,block2_1_2,block2_1_2,block2_1_2,block2_1_1)
block2_2 = vcat(block2_1_2,block2_1_3,block2_1_3,block2_1_3,block2_1_2)
##
stage2 = zeros(Int8,25,25,25)
stage2[:,:,1:5]= copy(block2_1)
stage2[:,:,6:10]= copy(block2_2)
stage2[:,:,11:15]= copy(block2_2)
stage2[:,:,16:20]= copy(block2_2)
stage2[:,:,21:25]= copy(block2_1)
##########stage3
empty3 = zeros(Int8,25,25,25)
block3_1_1 = hcat(stage2,stage2,stage2,stage2,stage2)
block3_1_2 = hcat(stage2,empty3,empty3,empty3,stage2)
block3_1_3 = hcat(empty3,empty3,empty3,empty3,empty3)
##
block3_1 = vcat(block3_1_1,block3_1_2,block3_1_2,block3_1_2,block3_1_1)
block3_2 = vcat(block3_1_2,block3_1_3,block3_1_3,block3_1_3,block3_1_2)
##
stage3 = zeros(Int8,125,125,125)
stage3[:,:,1:25]= copy(block3_1)
stage3[:,:,26:50]= copy(block3_2)
stage3[:,:,51:75]= copy(block3_2)
stage3[:,:,76:100]= copy(block3_2)
stage3[:,:,101:125]= copy(block3_1)
##########stage4
empty4 = zeros(Int8,125,125,125)
block4_1_1 = hcat(stage3,stage3,stage3,stage3,stage3)
block4_1_2 = hcat(stage3,empty4,empty4,empty4,stage3)
block4_1_3 = hcat(empty4,empty4,empty4,empty4,empty4)
##
block4_1 = vcat(block4_1_1,block4_1_2,block4_1_2,block4_1_2,block4_1_1)
block4_2 = vcat(block4_1_2,block4_1_3,block4_1_3,block4_1_3,block4_1_2)
##
stage4 = zeros(Int8,625,625,625)
stage4[:,:,1:125]= copy(block4_1)
stage4[:,:,126:250]= copy(block4_2)
stage4[:,:,251:375]= copy(block4_2)
stage4[:,:,376:500]= copy(block4_2)
stage4[:,:,501:625]= copy(block4_1)
####
#MS(6,4)
#menger(6,4)
m_6_4_stage1 = zeros(Int8,6,6,6)
m_6_4_stage1[:,:,1]=[1 1 1 1 1 1;1 0 0 0 0 1;1 0 0 0 0 1;1 0 0 0 0 1;1 0 0 0 0 1;1 1 1 1 1 1]
m_6_4_stage1[:,:,2]=[1 0 0 0 0 1;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;1 0 0 0 0 1]
m_6_4_stage1[:,:,3]=[1 0 0 0 0 1;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;1 0 0 0 0 1]
m_6_4_stage1[:,:,4]=[1 0 0 0 0 1;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;1 0 0 0 0 1]
m_6_4_stage1[:,:,5]=[1 0 0 0 0 1;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;1 0 0 0 0 1]
m_6_4_stage1[:,:,6]=[1 1 1 1 1 1;1 0 0 0 0 1;1 0 0 0 0 1;1 0 0 0 0 1;1 0 0 0 0 1;1 1 1 1 1 1]
#####
###stage2
m_6_4_empty2 = zeros(Int8,6,6,6)
m_6_4_block2_1_1 = hcat(m_6_4_stage1,m_6_4_stage1,m_6_4_stage1,m_6_4_stage1,m_6_4_stage1,m_6_4_stage1)
m_6_4_block2_1_2 = hcat(m_6_4_stage1,m_6_4_empty2,m_6_4_empty2,m_6_4_empty2,m_6_4_empty2,m_6_4_stage1)
m_6_4_block2_1_3 = hcat(m_6_4_empty2,m_6_4_empty2,m_6_4_empty2,m_6_4_empty2,m_6_4_empty2,m_6_4_empty2)
##
m_6_4_block2_1 = vcat(m_6_4_block2_1_1,m_6_4_block2_1_2,m_6_4_block2_1_2,m_6_4_block2_1_2,m_6_4_block2_1_2,m_6_4_block2_1_1)
m_6_4_block2_2 = vcat(m_6_4_block2_1_2,m_6_4_block2_1_3,m_6_4_block2_1_3,m_6_4_block2_1_3,m_6_4_block2_1_3,m_6_4_block2_1_2)
##
m_6_4_stage2 = zeros(Int8,36,36,36)
m_6_4_stage2[:,:,1:6]= copy(m_6_4_block2_1)
m_6_4_stage2[:,:,7:12]= copy(m_6_4_block2_2)
m_6_4_stage2[:,:,13:18]= copy(m_6_4_block2_2)
m_6_4_stage2[:,:,19:24]= copy(m_6_4_block2_2)
m_6_4_stage2[:,:,25:30]= copy(m_6_4_block2_2)
m_6_4_stage2[:,:,31:36]= copy(m_6_4_block2_1)
#####
###stage3
m_6_4_empty3 = zeros(Int8,36,36,36)
m_6_4_block3_1_1 = hcat(m_6_4_stage2,m_6_4_stage2,m_6_4_stage2,m_6_4_stage2,m_6_4_stage2,m_6_4_stage2)
m_6_4_block3_1_2 = hcat(m_6_4_stage2,m_6_4_empty3,m_6_4_empty3,m_6_4_empty3,m_6_4_empty3,m_6_4_stage2)
m_6_4_block3_1_3 = hcat(m_6_4_empty3,m_6_4_empty3,m_6_4_empty3,m_6_4_empty3,m_6_4_empty3,m_6_4_empty3)
##
m_6_4_block3_1 = vcat(m_6_4_block3_1_1,m_6_4_block3_1_2,m_6_4_block3_1_2,m_6_4_block3_1_2,m_6_4_block3_1_2,m_6_4_block3_1_1)
m_6_4_block3_2 = vcat(m_6_4_block3_1_2,m_6_4_block3_1_3,m_6_4_block3_1_3,m_6_4_block3_1_3,m_6_4_block3_1_3,m_6_4_block3_1_2)
##
m_6_4_stage3 = zeros(Int8,216,216,216)
m_6_4_stage3[:,:,1:36]= copy(m_6_4_block3_1)
m_6_4_stage3[:,:,37:72]= copy(m_6_4_block3_2)
m_6_4_stage3[:,:,73:108]= copy(m_6_4_block3_2)
m_6_4_stage3[:,:,109:144]= copy(m_6_4_block3_2)
m_6_4_stage3[:,:,145:180]= copy(m_6_4_block3_2)
m_6_4_stage3[:,:,181:216]= copy(m_6_4_block3_1)
#####
###stage4
m_6_4_empty4 = zeros(Int8,216,216,216)
m_6_4_block4_1_1 = hcat(m_6_4_stage3,m_6_4_stage3,m_6_4_stage3,m_6_4_stage3,m_6_4_stage3,m_6_4_stage3)
m_6_4_block4_1_2 = hcat(m_6_4_stage3,m_6_4_empty4,m_6_4_empty4,m_6_4_empty4,m_6_4_empty4,m_6_4_stage3)
m_6_4_block4_1_3 = hcat(m_6_4_empty4,m_6_4_empty4,m_6_4_empty4,m_6_4_empty4,m_6_4_empty4,m_6_4_empty4)
##
m_6_4_block4_1 = vcat(m_6_4_block4_1_1,m_6_4_block4_1_2,m_6_4_block4_1_2,m_6_4_block4_1_2,m_6_4_block4_1_2,m_6_4_block4_1_1)
m_6_4_block4_2 = vcat(m_6_4_block4_1_2,m_6_4_block4_1_3,m_6_4_block4_1_3,m_6_4_block4_1_3,m_6_4_block4_1_3,m_6_4_block4_1_2)
##
m_6_4_stage4 = zeros(Int8,1296,1296,1296)
m_6_4_stage4[:,:,1:216]= copy(m_6_4_block4_1)
m_6_4_stage4[:,:,217:432]= copy(m_6_4_block4_2)
m_6_4_stage4[:,:,433:648]= copy(m_6_4_block4_2)
m_6_4_stage4[:,:,649:864]= copy(m_6_4_block4_2)
m_6_4_stage4[:,:,865:1080]= copy(m_6_4_block4_2)
m_6_4_stage4[:,:,1081:1296]= copy(m_6_4_block4_1)
#####
stage = copy(m_6_4_stage3)
