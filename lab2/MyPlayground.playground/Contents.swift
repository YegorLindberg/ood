var someSet: Set<Int> = [1, 2, 3, 4, 5]

for i in someSet {
    if i == 2 {
        someSet.remove(2)
    }	
}

for i in someSet {
    print(i)
}
