Entries
=======

##Objectives
Learn basics of a custom model object used for data storage, and a singleton controller to manage that those objects.

##Part 1:

###Step 1: Create an Entry Object
- Create an Entry with properties:
  - Title (NSString strong)
  - Note (NSString strong)
  - Timestamp (NSDate strong)

###Step 2: Create an EntryController Object
- Create an EntryController with properties:
  - Entries (NSArray strong, readonly)
- And methods:
  - +(EntryController *)sharedInstance
  - -(void)addEntry:(Entry *)entry
  - -(void)removeEntry:(Entry *)entry
  
The shared instance method should be defined to match the gist here:
https://gist.github.com/jkhowland/89e24b5fb6e1b5048eb5

The addEntry method needs to create a mutable version of the controller's entries array, add the entry that's passed in, and then re-set the controller's Entries array.

The removeEntry method needs to do the reverse. It should create a mutable copy of the entries array, remove the entry that was passed in, and then re-set the controllers Entries array.

##Part 2:

###Step 3: Add Dictionary Representations of Entries
- Add two methods to the header of Entry
  - -(NSDictionary *)entryDictionary
  - -(id)initWithDictionary:(NSDictionary *)dictionary
- Add the methods to the implementation file
- Add a const key for each of the properties (i.e. titleKey, flagKey)
- In the dictionary method create a mutable dictionary and then add each of the properties for their key
  - Note: You can't insert a nil object. So you'll want to check those objects before you add them
  - if (title != nil) { [dictionary addObject:title forKey:titleKey] }
- In the init method you'll set the properties to the values for keys from the dictionary


###Step 4: Update the controller to store the dictionary Entries to NSUserDefaults
- Update the setter method of Entries array
  - Store the entries array in _entries
  - Create a new mutable array
  - Iterate through the entries and convert each one to a dictionary
  - Add that dictionary to the mutable array
  - Store the new array of dictionaries to NSUserDefaults
- Update the sharedInstance method
  - Get the array of dictionaries from NSUserDefaults
  - Create a new mutable array
  - Iterate through the list of dictionaries, convert each one to a entry and add to the mutable array
  - Set self.entries to the mutable array

