Yubi (Yu-Be)
=============

Overview
-------------
This is project I'm working on to help reuse code
i've written across multiple projects.

Keeping everything as modular as possible.  Will gemify anything if
it seems large and cohesive.  For now, see tests for usage examples.

My main focus at this point are the Structs, which I'm trying to use
for another gem and a specific project i have in mind.  Basically,
I want to quickly define some pretty complicated classes quickly
and I don't feel like typing all that shit. or creating 2*n files

Also, if anyone knows of gems that match the functionality
here, please let me know.  I'm looking into DSL, DSLKit, Hashey and
others.  I kind of wish there were be definitive go-to gems for this
kind of stuff.  then again, ruby gems to simplify adding a dsl to a
project has been hard to google.  i'm tired of writing generic
code more than once.

## Modules

### Attrs
cattr_accessor helpers, with default or from a block

### Callbacks
modules/base classes to add hooks to common methods,
such as initialize, etc.

### ConfStruct
modules to help with defining classes with complex data structures
ConfStructs can be quickly defined with nested blocks
DupStructs are intended to be used to define class attributes, 
which are deep-copied to new instances with defaults/callbacks.  New
instances then start with a default ostruct

### Hashes
helper method to symbolize keys

### Meta Stuff
basic meta stuff, looking into using DSL or DSLKit


TODO: 
-----------

DupStruct
- finalize structure
- tests for default values passed thru a hash
- tests for callbacks assigned
- tests for nested dupstruct
- how to define a DupStruct, then use it in array in instances?


