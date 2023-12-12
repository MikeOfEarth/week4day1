def smallest_number(list):
    # takes list
    # puts list in order
    #  lowest to highest
    #  take first index (ie lowest number)
    # sorted_list=sorted(list)
    # print(sorted_list[0])
    small = list[0]
    for num in list:
        if num <= small:
            small = num
    return(small)

print(smallest_number([40,3,4,2]))