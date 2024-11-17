"""
Ancient Ant (A): Not very dangerous. Can be managed without using any potions.
Badass Beetle (B): A big and strong bug that requires 1 potion to defeat.
Creepy Cockroach (C): Fast and aggressive! This creature requires 3 potions to defeat it.
Diabolical Dragonfly (D): A fast and tricky enemy, hard to hit. This creature requires 5 potions to defeat it.
When two monsters pair up, you will need one more potion per creature than in a one-on-one fight.
"""
COST = Dict(
    'A' => 0,
    'B' => 1,
    'C' => 3,
    'D' => 5,
    'x' => 0,
)

function solve1(path)
    line = readline(path)
    cost = sum(COST[c] for c in line)
    return cost
end

function solve2(path)
    line = readline(path)
    cost = 0
    for i in 1:2:length(line)
        char = line[i]
        cost += COST[char]
        char = line[i+1]
        cost += COST[char]
        if line[i] != 'x' && line[i+1] != 'x'
            cost += 2
        end
    end
    return cost
end

function solve3(path)
    line = readline(path)
    cost = 0
    for i in 1:3:length(line)
        char = line[i]
        cost += COST[char]
        char = line[i+1]
        cost += COST[char]
        char = line[i+2]
        cost += COST[char]
        num_enemies = length(findall(!=('x'), line[i:i+2]))
        if num_enemies == 1
            cost += 0
        elseif num_enemies == 2
            cost += num_enemies
        elseif num_enemies == 3
            cost += num_enemies * 2
        end
    end
    return cost
end

function potion_cost(enemy_group)
    cost = 0
    for c in enemy_group
        cost += COST[c]
    end
    num_enemies = length(findall(!=('x'), enemy_group))
    if num_enemies == 1
        cost += 0
    elseif num_enemies == 2
        cost += num_enemies
    elseif num_enemies == 3
        cost += num_enemies * 2
    end
    return cost
end

function solve(input, group_size)
    enemies = [input[i:i+(group_size-1)] for i in 1:group_size:length(input)]
    costs = map(potion_cost, enemies)
    return sum(costs)
end

function solve1_new()
    path = "algorithmia/1/1.txt"
    input = readline(path)
    solve(input, 1)
end

function solve2_new()
    path = "algorithmia/1/2.txt"
    input = readline(path)
    solve(input, 2)
end

function solve3_new()
    path = "algorithmia/1/3.txt"
    input = readline(path)
    solve(input, 3)
end

path = "algorithmia/1/1.txt"
@show solve1(path)
@show solve1_new()

path = "algorithmia/1/2.txt"
@show solve2(path)
@show solve2_new()

path = "algorithmia/1/3.txt"
@show solve3(path)
@show solve3_new()
