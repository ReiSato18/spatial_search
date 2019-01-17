function random_walk(array)
    n = 625
    present = zeros(Int64,1,3)
    present[1,:] = copy(array)
    
    delta   = zeros(Int64,1,3)
    
    delta_index = rand(UnitRange{Int8}(1:3))
  
    if rand(UnitRange{Int8}(0:1)) == 0
        delta[delta_index] = 1
    else
        delta[delta_index] = -1
    end
   
    next_present = present + delta
   
    x = ((next_present[1]%n)+n-1)%n +1
    y = ((next_present[2]%n)+n-1)%n +1
    z = ((next_present[3]%n)+n-1)%n +1
    
    if stage[x,y,z]==1
        final_present=[x y z]
    else
        final_present = copy(present)
    end
    
    return final_present
end

using ProgressMeter
function iter(loop,time)
    count_0 = 0
    count_1 = 0
    count_2 = 0
    count_3 = 0
    count_4 = 0
    count_5 = 0
    count_6 = 0
    count_7 = 0
    count_8 = 0
    p = Progress(loop)
    for i in 1:loop
        array = ones(Int64,1,3)
        for t in 0:time
            if t == 0
                array = ones(Int64,1,3)
            else
                array = copy(random_walk(array)) 
            end
            #println(t,array)
            if t == 4 && array==[1 1 1]
                count_0 += 1
            elseif t == 16 && array==[1 1 1]
                count_1 += 1
            elseif t == 64 && array==[1 1 1]
                count_2 += 1
            elseif t == 256 && array==[1 1 1]
                count_3 += 1
            elseif t == 1024 && array==[1 1 1]
                count_4 += 1
            elseif t == 4096 && array==[1 1 1]
                count_5 += 1
            elseif t == 16384 && array==[1 1 1]
                count_6 += 1
            elseif t == 65536 && array==[1 1 1]
                count_7 += 1
            elseif t == 262144 && array==[1 1 1]
                count_8 += 1 
            end
        end
        next!(p)
    end
    println("stage4_5_3")
    println("t=4:",count_0,"\n","t=4**2:",count_1,"\n","t=4**3:",count_2,"\n","t=4**4:",count_3)
    println("t=4**5:",count_4,"\n","t=4**6:",count_5,"\n","t=4**7:",count_6,"\n","t=4**8:",count_7)
    println("t=4**9:",count_8)
end
iter(1000000,16384)
