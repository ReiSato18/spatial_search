stage1 = [1 1 1;1 0 1;1 1 1]
#stage2 one_side=9
empty2 = zeros(Int8,3,3)
line2_1= hcat(stage1,stage1,stage1)
line2_2= hcat(stage1,empty2,stage1)
stage2 = vcat(line2_1,line2_2,line2_1)
#stage3 one_side=27
empty3 = zeros(Int8,9,9)
line3_1= hcat(stage2,stage2,stage2)
line3_2= hcat(stage2,empty3,stage2)
stage3 = vcat(line3_1,line3_2,line3_1)
#stage4 one_side=81
empty4 = zeros(Int8,27,27)
line4_1= hcat(stage3,stage3,stage3)
line4_2= hcat(stage3,empty4,stage3)
stage4 = vcat(line4_1,line4_2,line4_1)
#stage5 one_side=243
empty5 = zeros(Int8,81,81)
line5_1= hcat(stage4,stage4,stage4)
line5_2= hcat(stage4,empty5,stage4)
stage5 = vcat(line5_1,line5_2,line5_1)
#stage6
empty6 = zeros(Int8,243,243)
line6_1= hcat(stage5,stage5,stage5)
line6_2= hcat(stage5,empty6,stage5)
stage6 = vcat(line6_1,line6_2,line6_1)
###
stage = copy(stage6)
#######################################
