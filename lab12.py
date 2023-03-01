# -*- coding: utf-8 -*-
"""
Created on Mon Apr 26 15:24:19 2021

@author: Javy
"""

def triplicate(string):
    result = string * 3
    return result


def collatz(n):
    ''' This program takes a number and checks whether it's even or odd. 
    
    num -> str'''
    
    if n%2 == 0:
        return n/2
    else: 
        return n*3 +1
    

def mersenne(n):
    ''' This function will take a positive numerical input and outputs the number 2n-1
    
    number -> number'''
    
    answer = 2**n-1
    return answer



def is_vowel(char):
    '''This program will get a string, character, and determine if it is a vowel or not
    
    str -> str'''
    
    vowel = 'aeiouAEIOU'
    
    
    if char in vowel:
        return True
    else:
        return False
    
    
    
def is_anagram(one,two):
    ''' Takes two strings and determines if they are anagrams and returns either true or false
    
    str,str -> str'''    
    Anagram = True
    one = one.lower()
    two = two.lower()    
    for i in one:
        if one.count(i) == two.count(i) and two.count(i) == one.count(i):
            Anagram = True
        else:
            Anagram = False
            break
    return Anagram



def half(entry):
    '''takes an integer, float, or sequence and returns half of int rounded 
    down, half float no round, or half of sequene
    
    num -> num
    list -> list
    string -> string'''
    
    
    if isinstance(entry, float):
        x = entry / 2
    elif isinstance(entry, int):
        x = int(entry/2)
    else:
        mid = int(len(entry)/2)
        x = entry[0:mid]
        
    return x






# A
def mersenne_list(int_list):
    '''takes a list of integers and returns a list consisting of the results of
    applying the mersenne() function to the original list.
    
    list-of-ints -> list-of-ints'''
    new = []
    for i in map(mersenne,int_list):
        new.append(i) 
    return new

int_list = [2,5,7]
mersenne_list(int_list)




#B
def truncate(string):
    '''removes the last element of a string
    
    str-> None'''
    string = string[:-1]
    return string

def truncate_str_list(str_list):
    '''takes a list of non-empty strings and returns a list consisting of the 
    results of removing the last item of each string to the original list
    
    list-of-strs -> list of str'''
    
    copylist = str_list[:]
    answer = []
    for i in map(truncate,copylist):
        answer.append(i)
    return answer

truncate_str_list(["foo", "bar", "baz"])





    
def filter_vowels(string):
    '''takes a string and returns a string consisting of just the vowels from that string.
    
    str -> str'''
    
    i = 0
    vowels = ''
    for char in map(is_vowel,string):
        if char == True:
            vowels += string[i]
        i += 1
    return vowels
            
  
    
  
def is_anagram(one,two):
    ''' Takes two strings and determines if they are anagrams and returns either true or false
    
    str,str -> str'''    
    Anagram = True
    one = one.lower()
    two = two.lower()    
    for i in one:
        if one.count(i) == two.count(i) and two.count(i) == one.count(i):
            Anagram = True
        else:
            Anagram = False
            break
    return Anagram



def filter_anagrams(str_list,target):
    '''takes a list of strings and a target string and returns a list of words 
    from the list that are anagrams of the target string.
    
    list-of-strings, str -> list-of-strings'''
    
    i = 0
    anagrams = []
    for element in map(lambda x: is_anagram(x,target),str_list):
        if element:
            anagrams.append(str_list[i])
            i += 1 
        else:
            i += 1 
    return anagrams

print(filter_anagrams(["tots", "post", "pop", "tops"], "stop"))
    

    
def repeat(func, N, value):
    '''apply the given function to the starting value the specified number of 
    times and return the result
    
    (X->X), int -> X'''
    
    value_new = value
    for iteration in range(N):
        value_new = func(value_new)
        
    return value_new
        




def repeat_until(func, start_val, end_val):
    '''repeatedly apply the given function to the starting value until the 
    ending value is reached and then return an integer representing the number 
    of times the function was called.
    
    (X->X), X, X -> int'''
    
    holder = start_val
    counter = 0
    while holder != end_val:
        holder = func(holder)
        counter += 1
    return counter
    





































