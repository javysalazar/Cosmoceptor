# -*- coding: utf-8 -*-
"""
Created on Mon Apr 26 12:51:30 2021

@author: Javy
"""

class Room:
    '''represents locations in a game
    Attributes:
        description
            str
        room_num
            int'''
            
    def __init__(self, room_num, description):
        '''initializes self with room_num and description
        
        Room, int, str -> None'''
        self.room_num = room_num
        self.description = description
        
        
    def __repr__(self):
        '''represents Room in format: Room(room_num, description)
        
        Room -> str'''
        return 'Room(' + repr(self.room_num) + ', ' + repr(self.description) + ')'
        



class Thing:
    '''Represents physical objects in the game
    Attributes:
        name
            str
        location
            Room object'''
            
    
    def __init__(self, name, location):
        self.name = name
        self.location = location.description
        
        
    def __repr__(self):
        
        return'Thing(' + repr(self.name) + ', ' + repr(self.location) +')'
    
    
    def __str__(self):
        
        return 'The ' + str(self.name) + ' is in ' + str(self.location) +'.'





class Openable(Thing):
    
    
    def __init__(self, name, location, is_open = False):
        
        super().__init__(name, location)
        self.is_open = is_open 
        
    
    def __repr__(self):
        return 'Openable(' + repr(self.name) + ', ' + repr(self.location) + ', ' + repr(self.is_open) + ')'
        
        
    def __str__(self):
        if self.is_open:
            oc = 'open'
        else:
            oc = 'closed'
            
        return 'The ' + str(self.name) + ' in ' + str(self.location) + ' is ' + oc
    
    
    def try_open(self):
        if self.is_open:
            return False
        else:
            self.is_open = True
            return True
        



class Lockable(Openable):
    def __init__(self, name, location, key, is_open = False, is_locked = False):
        
        super().__init__(name, location, is_open)
        self.key = key
        self.is_locked = is_locked

        
    
    def __repr__(self):
        return 'Lockable(' + repr(self.name) + ', ' + repr(self.location) \
            + ', ' + repr(self.key) + ', '  + repr(self.is_open) + ', ' +repr(self.is_locked) +')'
            
            
            
    def __str__(self):
        if self.is_open:
            oc = 'open'
            lc = '.'
        elif not self.is_open and self.is_locked:
            oc = 'closed'
            lc = ' and locked.'
        else:
            oc = 'closed'
            lc = ' but unlocked.'
            
            
        return 'The ' + str(self.name) + ' in ' + str(self.location) + ' is ' + oc + lc 
    
    
    def try_open(self):
        if self.is_locked == False:
            if self.is_open:
                return False
            else:
                self.is_open = True
                return True
        else:
            return False 
        
  
        
    def try_unlock_with(self, key):
        if self.is_locked and key == self.key:
            self.is_locked = False
            return True
        else:
            return False
       
            



##### Test Time #####

    
# Creating and printing rooms 
print("Creating and printing rooms ")
kitchen = Room(1, "the kitchen")
cell = Room(2, "a dungeon cell")
shuttle_bay = Room(3, "the shuttle bay")
closet = Room(4, "a closet")
rooms = [kitchen, cell, shuttle_bay, closet]

for room in rooms:
    print(room)

print()   
    

# Creating and printing things
print("Creating and printing things")
house_key = Thing('main door key', kitchen)
tiny_key = Thing('tiny silver key', closet)
rusty_key = Thing('rusty key', cell)
keys = [house_key, tiny_key, rusty_key]

for key in keys:
    print(key)
    
print()


# Test and print openable
print("Test and print openable")
window1 = Openable('small window', kitchen, True)
print(window1)
print(window1.try_open())
print(window1)
print()


necronomicon = Openable('Necronomicon', cell)
print(necronomicon)
print(necronomicon.try_open())
print(necronomicon)
print()
print()


# Test and print lockable
print("Test and print lockable")
door1 = Lockable('main door', shuttle_bay, house_key, is_open= False, is_locked =True)
print(door1)
print(door1.try_open(),'\n', door1)
print(door1.try_unlock_with(rusty_key),'\n', door1)
print(door1.try_unlock_with(house_key),'\n', door1)
print(door1.try_open() ,door1)
print()


sams_diary = Lockable('diary', closet, tiny_key, True)
print(sams_diary)
print(sams_diary.try_open())
print(sams_diary)
print(sams_diary.try_unlock_with(rusty_key))
print(sams_diary)
print(sams_diary.try_unlock_with(tiny_key))
print(sams_diary)
print()


chest1 = Lockable('ancient treasure chest', cell, rusty_key)
print(chest1)
print(chest1.try_unlock_with(house_key))
print(chest1)
print(chest1.try_unlock_with(rusty_key))
print(chest1)
print(chest1.try_open())
print(chest1)
























            
    
    